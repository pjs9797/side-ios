import RxSwift
import Photos
import RxCocoa
import Shared

class CreateMeetingImageViewModel{
    let disposeBag = DisposeBag()
    let authorizationManager = AuthorizationManager()
    let setDefaultImageButtonTapped = PublishRelay<Void>()
    let imageCancelButtonTapped = PublishRelay<Void>()
    let addImageBtViewTapped = PublishRelay<Void>()
    let presentNextViewRelay = PublishRelay<String>()
    var representativeImagesDriver: Driver<SharedDSKitImages.Image>
    
    init(){
        let representativeImages = [SharedDSKitAsset.Icons.representativeImage1.image,SharedDSKitAsset.Icons.representativeImage2.image,SharedDSKitAsset.Icons.representativeImage3.image,SharedDSKitAsset.Icons.representativeImage4.image,SharedDSKitAsset.Icons.representativeImage5.image,SharedDSKitAsset.Icons.representativeImage6.image,SharedDSKitAsset.Icons.representativeImage7.image,SharedDSKitAsset.Icons.representativeImage8.image,SharedDSKitAsset.Icons.representativeImage9.image]
        
        representativeImagesDriver = setDefaultImageButtonTapped
            .map { _ in
                let randomIndex = Int.random(in: 0..<representativeImages.count)
                return representativeImages[randomIndex]
            }
            .asDriver(onErrorDriveWith: Driver.empty())
    }
    
    func requestCameraAuthorization() {
        authorizationManager.requestCameraAuthorization()
            .subscribe(onNext: { [weak self] granted in
                if granted {
                    // 권한이 허용된 경우, 카메라를 여는 로직을 여기에 작성
                } else {
                    // 권한 거부됨을 사용자에게 알리는 로직
                }
            })
            .disposed(by: disposeBag)
    }
    
    func requestPhotoLibraryAuthorization() {
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        switch status {
        case .authorized:
            presentNextViewRelay.accept("authorized")
        case .limited:
            presentNextViewRelay.accept("limited")
        case .denied:
            presentNextViewRelay.accept("denied")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { [weak self] newStatus in
                if newStatus == .authorized{
                    self?.presentNextViewRelay.accept("authorized")
                }
                if newStatus == .limited {
                    self?.presentNextViewRelay.accept("limited")
                }
                else if newStatus == .denied{
                    self?.presentNextViewRelay.accept("denied")
                }
                else{
                    self?.presentNextViewRelay.accept("")
                }
            }
        default:
            presentNextViewRelay.accept("")
        }
    }
}
