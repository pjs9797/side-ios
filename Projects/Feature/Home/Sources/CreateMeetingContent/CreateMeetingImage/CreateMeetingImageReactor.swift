import Photos
import RxCocoa
import ReactorKit
import RxFlow

public class CreateMeetingImageReactor: ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    
    public init(){
        self.initialState = State()
    }
    
    public enum Action {
        case addImageBtViewTapped
        case imageCancelButtonTapped
        case setDefaultImageButtonTapped
        case requestCameraAuthorization
        case requestPhotoLibraryAuthorization
        case setPhotoAuthType(String)
        case setCameraAuthType(String)
    }
    
    public enum Mutation {
        case setPhotoAuthType(String)
        case setCameraAuthType(String)
    }
    
    public struct State {
        var photoAuthType: String = ""
        var cameraAuthType: String = ""
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .addImageBtViewTapped:
            self.steps.accept(CreateMeetingStep.presentPhotoCameraActionSheet)
            return .empty()
        case .imageCancelButtonTapped:
            EditPhotoReactor.shared.action.onNext(.clearImage)
            return .empty()
        case .setDefaultImageButtonTapped:
            let randomIndex = Int.random(in: 0..<CreateMeetingImageModel.randomImages.count)
            EditPhotoReactor.shared.action.onNext(.setImage(CreateMeetingImageModel.randomImages[randomIndex]))
            return .empty()
        case .requestCameraAuthorization:
            requestCameraAuthorization()
            return .empty()
        case .requestPhotoLibraryAuthorization:
            requestPhotoLibraryAuthorization()
            return .empty()
        case .setPhotoAuthType(let type):
            if type == "authorized" || type == "limited" {
                self.steps.accept(CreateMeetingStep.presentAlbumViewController(type: type))
            }
            else{
                self.steps.accept(CreateMeetingStep.presentDeniedAlert(target: "사진"))
            }
            return .just(.setPhotoAuthType(type))
        case .setCameraAuthType(let type):
            if type == "authorized" {
                self.steps.accept(CreateMeetingStep.presentCameraViewController)
            }
            else{
                self.steps.accept(CreateMeetingStep.presentDeniedAlert(target: "카메라"))
            }
            return .just(.setCameraAuthType(type))
        }
    }
    
    public func requestCameraAuthorization() {
        DispatchQueue.main.async {
            switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                self.action.onNext(.setCameraAuthType("authorized"))
            case .denied:
                self.action.onNext(.setCameraAuthType("denied"))
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted{
                        self.action.onNext(.setCameraAuthType("authorized"))
                    }
                    else{
                        self.action.onNext(.setCameraAuthType("denied"))
                    }
                }
            default:
                break
            }
        }
    }

    public func requestPhotoLibraryAuthorization() {
        DispatchQueue.main.async {
            let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
            switch status {
            case .authorized:
                self.action.onNext(.setPhotoAuthType("authorized"))
            case .limited:
                self.action.onNext(.setPhotoAuthType("limited"))
            case .denied:
                self.action.onNext(.setPhotoAuthType("denied"))
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization { newStatus in
                    if newStatus == .authorized{
                        self.action.onNext(.setPhotoAuthType("authorized"))
                    }
                    if newStatus == .limited {
                        self.action.onNext(.setPhotoAuthType("limited"))
                    }
                    else if newStatus == .denied{
                        self.action.onNext(.setPhotoAuthType("denied"))
                    }
                    else{
                        self.action.onNext(.setPhotoAuthType(""))
                    }
                }
            default:
                self.action.onNext(.setPhotoAuthType(""))
            }
        }
    }
}
