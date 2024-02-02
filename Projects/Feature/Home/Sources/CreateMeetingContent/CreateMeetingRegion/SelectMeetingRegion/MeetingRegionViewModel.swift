import RxSwift
import RxCocoa
import CoreLocation

public class MeetingRegionViewModel: NSObject{
    let disposeBag = DisposeBag()
    let locationManager = CLLocationManager()
    let backButtonTapped = PublishRelay<Void>()
    let cancelButtonTapped = PublishRelay<Void>()
    let clearButtonTapped = PublishRelay<Void>()
    let currentLocationButtonTapped = PublishRelay<Void>()
    let onlineSwitchRelay = BehaviorRelay<Bool>(value: true)
    var textFieldRelay = PublishRelay<String?>()
    var isTextExistDriver: Driver<Bool>
    var currentLocationRelay = PublishRelay<String>()
    var regionButtonTitleRelay = PublishRelay<String>()
    var locationAuthDeniedRelay = PublishRelay<Void>()
    var popViewControllerRelay = PublishRelay<Void>()
    
    public override init(){
        isTextExistDriver = textFieldRelay.map { !($0?.isEmpty ?? true) }.asDriver(onErrorJustReturn: true)
        super.init()
        
        locationManager.delegate = self
        
        currentLocationButtonTapped
            .subscribe(onNext: { [weak self] _ in
                self?.checkLocationAuthorization()
            })
            .disposed(by: disposeBag)
        
        onlineSwitchRelay
            .subscribe(onNext: { [weak self] value in
                if value{
                    self?.currentLocationRelay.accept("온라인")
                }
            })
            .disposed(by: disposeBag)
        
        currentLocationRelay
            .subscribe(onNext: { [weak self] location in
                if location != "온라인"{
                    self?.regionButtonTitleRelay.accept(location)
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func checkLocationAuthorization() {
        let currentStatus = locationManager.authorizationStatus
        switch currentStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            locationAuthDeniedRelay.accept(())
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.stopUpdatingLocation()
            locationManager.startUpdatingLocation()
        @unknown default:
            break
        }
    }
}

extension MeetingRegionViewModel: CLLocationManagerDelegate{
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            //TODO: 서울특별시 중구 소공동 대신에 서버와 통신해 위도,경도를 보내면 지번 주소 받은거 넣을 예정
            self.currentLocationRelay.accept("서울특별시 중구 소공동")
            self.popViewControllerRelay.accept(())
            locationManager.stopUpdatingLocation()
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error fetching location: \(error)")
    }
}
