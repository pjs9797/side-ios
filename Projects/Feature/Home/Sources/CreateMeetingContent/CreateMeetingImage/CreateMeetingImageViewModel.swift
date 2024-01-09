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
    let presentAlbumRelay = PublishRelay<String>()
    let presentAlbumDriver: Driver<String>
    let presentCameraRelay = PublishRelay<String>()
    let presentCameraDriver: Driver<String>
    
    init(){
        presentAlbumDriver = presentAlbumRelay.asDriver(onErrorJustReturn: "")
        presentCameraDriver = presentCameraRelay.asDriver(onErrorJustReturn: "")
        
        let representativeImages = [SharedDSKitAsset.Icons.representativeImage1.image,SharedDSKitAsset.Icons.representativeImage2.image,SharedDSKitAsset.Icons.representativeImage3.image,SharedDSKitAsset.Icons.representativeImage4.image,SharedDSKitAsset.Icons.representativeImage5.image,SharedDSKitAsset.Icons.representativeImage6.image,SharedDSKitAsset.Icons.representativeImage7.image,SharedDSKitAsset.Icons.representativeImage8.image,SharedDSKitAsset.Icons.representativeImage9.image]
        
        setDefaultImageButtonTapped
            .bind(onNext: { _ in
                let randomIndex = Int.random(in: 0..<representativeImages.count)
                EditPhotoViewModel.shared.imgRelay.accept(representativeImages[randomIndex])
            })
            .disposed(by: disposeBag)
    }
    
    func requestCameraAuthorization() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            presentCameraRelay.accept("authorized")
        case .denied:
            presentCameraRelay.accept("denied")
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted{
                    self.presentCameraRelay.accept("authorized")
                }
                else{
                    self.presentCameraRelay.accept("denied")
                }
            }
        default:
            break
        }
    }
    
    func requestPhotoLibraryAuthorization() {
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        switch status {
        case .authorized:
            presentAlbumRelay.accept("authorized")
        case .limited:
            presentAlbumRelay.accept("limited")
        case .denied:
            presentAlbumRelay.accept("denied")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { newStatus in
                if newStatus == .authorized{
                    self.presentAlbumRelay.accept("authorized")
                }
                if newStatus == .limited {
                    self.presentAlbumRelay.accept("limited")
                }
                else if newStatus == .denied{
                    self.presentAlbumRelay.accept("denied")
                }
                else{
                    self.presentAlbumRelay.accept("")
                }
            }
        default:
            presentAlbumRelay.accept("")
        }
    }
}
