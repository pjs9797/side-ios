import RxSwift
import RxCocoa
import ReactorKit
import RxFlow
import CoreLocation
import Domain

public class MeetingRegionReactor: NSObject, ReactorKit.Reactor, Stepper{
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
        //CreateMeetingRegionView
        case updateOnlineSwitch(Bool)
        case regionButtonTapped
        //SelectMeetingRegionViewController
        case backButtonTapped
        case clearButtonTapped
        case searchButtonTapped
        case currentLocationButtonTapped
        case writeText(String?)
        case getLocation(longitude: String, latitude: String)
        case denyLocationAuth
        //Common
    }
    
    public enum Mutation {
        //CreateMeetingRegionView
        case setOnlineSwitch(Bool)
        //SelectMeetingRegionViewController
        case clearText
        //case setCurrentLocation(String)
        case setRegionButtonTitle(String)
        case setTextExist(Bool)
        case setLocationText(String?)
        case presentDeniedAlert
    }
    
    public struct State {
        var isOnline: Bool = true
        var regionButtonTitle: String = "읍,면,동으로 검색하세요."
        var isTextExist: Bool = false
        var locationText: String? = nil
        var deniedLocationAuth: Bool = false
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .updateOnlineSwitch(let isOn):
            return .just(.setOnlineSwitch(isOn))
        case .regionButtonTapped:
            self.steps.accept(CreateMeetingStep.presentSelectMeetingRegionViewController)
            return .empty()
        case .backButtonTapped:
            self.steps.accept(CreateMeetingStep.dismissViewController)
            return .empty()
        case .clearButtonTapped:
            return .just(.clearText)
        case .searchButtonTapped:
            return .empty()
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
                        let getLocationResponse = try decoder.decode([GetLocationResponse].self, from: data)
                        if let locationName = getLocationResponse.first?.name {
                            self.steps.accept(CreateMeetingStep.dismissViewController)
                            return .just(.setRegionButtonTitle(locationName))
                        } else {
                            return .empty()
                        }
                    } catch {
                        print("Decoding error: \(error)")
                        return .empty()
                    }
                    
                }
        case .denyLocationAuth:
            return .just(.presentDeniedAlert)
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setOnlineSwitch(let isOn):
            newState.isOnline = isOn
            newState.regionButtonTitle = "읍,면,동으로 검색하세요."
        case .setRegionButtonTitle(let title):
            newState.regionButtonTitle = title
        case .clearText:
            newState.isTextExist = false
        case .setTextExist(let exist):
            newState.isTextExist = exist
        case .setLocationText(let text):
            newState.locationText = text
        case .presentDeniedAlert:
            newState.deniedLocationAuth = true
        }
        return newState
    }
}

extension MeetingRegionReactor: CLLocationManagerDelegate {
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
