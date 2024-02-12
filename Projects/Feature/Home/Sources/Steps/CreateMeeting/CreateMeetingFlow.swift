import UIKit
import Domain
import RxFlow
import Mantis

final public class CreateMeetingFlow: Flow {
    
    public var root: Presentable {
        return self.rootViewController
    }
    
    var provider: ServiceProviderType
    private let rootViewController: UINavigationController
    let meetingTitle: String
    let selectMeetingRegionReactor: SelectMeetingRegionReactor
    let createMeetingImageReactor: CreateMeetingImageReactor
    
    init(with provider: ServiceProviderType, with rootViewController: UINavigationController, with meetingTitle: String) {
        self.provider = provider
        self.rootViewController = rootViewController
        self.meetingTitle = meetingTitle
        self.selectMeetingRegionReactor = SelectMeetingRegionReactor(provider: self.provider)
        self.createMeetingImageReactor = CreateMeetingImageReactor()
    }
    
    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? CreateMeetingStep else { return .none }
        
        switch step {
        case .popViewController:
            return popViewController()
        case .dismissViewController:
            return dismissViewController()
        case .dismissEditPhotoViewController:
            return dismissEditPhotoViewController()
        case .doubleDismissViewController:
            return doubleDismissViewController()
        case .goToInitializeCreateMeetingViewController:
            return coordinateToInitializeCreateMeetingViewController()
        case .goToSelectDevelopDetailsViewController:
            return coordinateToSelectDevelopDetailsViewController()
        case .goToSelectHobbyDetailsViewController:
            return coordinateToSelectHobbyDetailsViewController()
        case .goToCreateMeetingContentViewController:
            return coordinateToCreateMeetingContentViewController()
        case .presentSelectMeetingRegionViewController:
            return coordinateToSelectMeetingRegionViewController()
        case .presentAlbumViewController(let type):
            return coordinateToAlbumViewController(type: type)
        case .presentCameraViewController:
            return coordinateToCameraController()
        case .presentEditPhotoViewController(let image):
            return coordinateToEditPhotoViewController(image: image)
        case .presentPhotoCameraActionSheet:
            return coordinateToPhotoCameraActionSheet()
        case .presentDeniedAlert(let target):
            return coordinateToDeniedAlert(target: target)
        }
    }
    
    private func popViewController() -> FlowContributors {
        self.rootViewController.popViewController(animated: true)
        
        return .none
    }
    
    private func dismissViewController() -> FlowContributors {
        self.rootViewController.dismiss(animated: true)
        return .none
    }
    
    private func dismissEditPhotoViewController() -> FlowContributors {
        self.rootViewController.presentedViewController?.dismiss(animated: true)
        return .none
    }
    
    private func doubleDismissViewController() -> FlowContributors {
        self.rootViewController.dismiss(animated: true, completion: {
            self.rootViewController.dismiss(animated: true)
        })
        return .none
    }
    
    private func coordinateToInitializeCreateMeetingViewController() -> FlowContributors {
        let reactor = InitializeCreateMeetingReactor()
        let viewController = InitializeCreateMeetingViewController(meetingTitle: self.meetingTitle, with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToSelectDevelopDetailsViewController() -> FlowContributors {
        let reactor = SelectDevelopDetailsReactor()
        let viewController = SelectDevelopDetailsViewController(meetingTitle: self.meetingTitle, with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToSelectHobbyDetailsViewController() -> FlowContributors {
        let reactor = SelectHobbyDetailsReactor()
        let viewController = SelectHobbyDetailsViewController(meetingTitle: self.meetingTitle, with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToCreateMeetingContentViewController() -> FlowContributors {
        let createMeetingContentReactor = CreateMeetingContentReactor(provider: self.provider)
        let createMeetingRegionReactor = CreateMeetingRegionReactor()
        let createMeetingPeriodReactor = CreateMeetingPeriodReactor()
        let createMeetingImageReactor = self.createMeetingImageReactor
        let viewController = CreateMeetingContentViewController(meetingTitle: "모임 생성", createMeetingContentReactor: createMeetingContentReactor, createMeetingRegionReactor: createMeetingRegionReactor, selectMeetingRegionReactor: self.selectMeetingRegionReactor, createMeetingPeriodReactor: createMeetingPeriodReactor, createMeetingImageReactor: createMeetingImageReactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        let compositeStepper = CompositeStepper(steppers: [createMeetingContentReactor, createMeetingRegionReactor, createMeetingPeriodReactor, createMeetingImageReactor])
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: compositeStepper))
    }
    
    private func coordinateToSelectMeetingRegionViewController() -> FlowContributors {
        let viewController = SelectMeetingRegionViewController(with: self.selectMeetingRegionReactor)
        self.rootViewController.present(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: self.selectMeetingRegionReactor))
    }
    
    private func coordinateToAlbumViewController(type: String) -> FlowContributors {
        let reactor = AlbumViewReactor(photoAuthType: type)
        let viewController = AlbumViewController(with: reactor)
        self.rootViewController.present(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
            
    private func coordinateToCameraController() -> FlowContributors {
        let viewController = CameraViewController()
        viewController.sourceType = .camera
        viewController.allowsEditing = true
        viewController.cameraDevice = .rear
        viewController.cameraCaptureMode = .photo
        self.rootViewController.present(viewController, animated: true)
                                                     
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: viewController))
    }
         
    private func coordinateToEditPhotoViewController(image: UIImage) -> FlowContributors {
        var config = Mantis.Config()
        config.cropMode = .async
        config.cropViewConfig.showAttachedRotationControlView = false
        config.cropToolbarConfig.toolbarButtonOptions = [.clockwiseRotate, .reset, .ratio, .autoAdjust, .horizontallyFlip]
        let viewController: EditPhotoViewController = Mantis.cropViewController(image: image, config: config)
        viewController.modalPresentationStyle = .overFullScreen
        self.rootViewController.presentedViewController?.present(viewController, animated: true)
                        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: viewController))
    }
    
    private func coordinateToPhotoCameraActionSheet() -> FlowContributors {
        let alert = UIAlertController(title: "사부작", message: nil, preferredStyle: .actionSheet)
        let photoLibraryAction = UIAlertAction(title: "앨범에서 사진선택", style: .default) { [weak self] _ in
            self?.createMeetingImageReactor.action.onNext(.requestPhotoLibraryAuthorization)
        }
        let cameraAction = UIAlertAction(title: "카메라 촬영", style: .default) { [weak self] _ in
            self?.createMeetingImageReactor.action.onNext(.requestCameraAuthorization)
        }
        alert.addAction(photoLibraryAction)
        alert.addAction(cameraAction)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        self.rootViewController.present(alert, animated: true, completion: nil)
                        
        return .none
    }
    
    private func coordinateToDeniedAlert(target: String) -> FlowContributors {
        let alert = UIAlertController(title: nil, message: "\(target) 기능을 사용하려면\n’\(target)’ 접근권한을 허용해야 합니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "설정", style: .default, handler: { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        self.rootViewController.present(alert, animated: true, completion: nil)
        
        return .none
    }
}

