import UIKit
import Mantis
import RxSwift
import RxCocoa
import RxFlow

class EditPhotoViewController: CropViewController, Stepper {
    public var steps = PublishRelay<Step>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}

extension EditPhotoViewController: CropViewControllerDelegate {
    func cropViewControllerDidCrop(_ cropViewController: Mantis.CropViewController, cropped: UIImage, transformation: Mantis.Transformation, cropInfo: Mantis.CropInfo) {
        EditPhotoReactor.shared.action.onNext(.setImage(cropped))
        self.steps.accept(CreateMeetingStep.doubleDismissViewController)
    }
    
    func cropViewControllerDidCancel(_ cropViewController: CropViewController, original: UIImage) {
        self.steps.accept(CreateMeetingStep.dismissEditPhotoViewController)
    }
}
