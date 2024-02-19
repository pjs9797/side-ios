import RxCocoa
import ReactorKit
import RxFlow
import CoreLocation
import Domain

public class SelectMeetingRegionReactor: NSObject, ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    let provider: ServiceProviderType
    let locationManager = CLLocationManager()
    
    public init(provider: ServiceProviderType){
        self.initialState = State()
        self.provider = provider
        super.init()
        
        locationManager.delegate = self
    }
    
    public enum Action {
        case backButtonTapped
        case clearButtonTapped
        case searchButtonTapped
        case currentLocationButtonTapped
        case clearSearchedLocations
        case selectSearchedLocation(String)
        case writeText(String?)
        case getLocation(longitude: String, latitude: String)
        case denyLocationAuth
    }
    
    public enum Mutation {
        case clearText
        case clearSearchedLocations
        case setSearchedLocationNames([String])
        case setRegionButtonTitle(String)
        case setTextExist(Bool)
        case setLocationText(String?)
    }
    
    public struct State {
        var searchedLocationNames: [String] = []
        var regionButtonTitle: String = "읍,면,동으로 검색하세요."
        var isTextExist: Bool = false
        var locationText: String? = nil
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .backButtonTapped:
            self.steps.accept(CreateMeetingStep.dismissViewController)
            return .empty()
        case .clearButtonTapped:
            return .just(.clearText)
        case .clearSearchedLocations:
            return .just(.clearSearchedLocations)
        case .searchButtonTapped:
            guard let location = self.currentState.locationText else { return .empty()}
            return self.provider.createMeetingService.searchLocation(address: location).responseData()
                .flatMap { response, data -> Observable<Mutation> in
                    do {
                        let decoder = JSONDecoder()
                        let getLocationResponse = try decoder.decode([GetLocation].self, from: data)
                        let names = getLocationResponse.map { $0.name }
                        let SetNames = Array(Set(names)).sorted()
                        return .just(.setSearchedLocationNames(SetNames))
                    } catch {
                        return .empty()
                    }
                }
        case .selectSearchedLocation(let locationName):
            return Observable.concat([
                .just(.setRegionButtonTitle(locationName)),
                .empty()
                .delay(.milliseconds(10), scheduler: MainScheduler.instance)
                .do(onCompleted: { [weak self] in
                    self?.steps.accept(CreateMeetingStep.dismissViewController)
                })
            ])
        case .currentLocationButtonTapped:
            checkLocationAuthorization()
            return .empty()
        case .writeText(let text):
            return Observable.concat([
                .just(.setTextExist(!(text?.isEmpty ?? true))),
                .just(.setLocationText(text))
            ])
        case .getLocation(let longitude,let latitude):
            return self.provider.createMeetingService.getLocation(longitude: longitude, latitude: latitude).responseData()
                .flatMap { response, data -> Observable<Mutation> in
                    do {
                        let decoder = JSONDecoder()
                        let getLocationResponse = try decoder.decode([GetLocation].self, from: data)
                        if let locationName = getLocationResponse.first?.name {
                            self.steps.accept(CreateMeetingStep.dismissViewController)
                            return .just(.setRegionButtonTitle(locationName))
                        } else {
                            return .empty()
                        }
                    } catch {
                        return .empty()
                    }
                }
        case .denyLocationAuth:
            self.steps.accept(CreateMeetingStep.presentDeniedAlert(target: "위치"))
            return .empty()
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setSearchedLocationNames(let names):
            newState.searchedLocationNames = names
        case .setRegionButtonTitle(let title):
            newState.regionButtonTitle = title
        case .clearText:
            newState.isTextExist = false
        case .clearSearchedLocations:
            newState.searchedLocationNames = []
        case .setTextExist(let exist):
            newState.isTextExist = exist
        case .setLocationText(let text):
            newState.locationText = text
        }
        return newState
    }
}

extension SelectMeetingRegionReactor: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            self.action.onNext(.getLocation(longitude: String(longitude), latitude: String(latitude)))
            locationManager.stopUpdatingLocation()
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error fetching location: \(error)")
    }
    
    private func checkLocationAuthorization() {
        let currentStatus = locationManager.authorizationStatus
        switch currentStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            self.action.onNext(.denyLocationAuth)
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.stopUpdatingLocation()
            locationManager.startUpdatingLocation()
        @unknown default:
            break
        }
    }
}
