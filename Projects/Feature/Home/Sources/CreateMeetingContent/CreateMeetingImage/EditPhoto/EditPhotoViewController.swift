import UIKit
import Mantis
import RxSwift
import RxCocoa

class EditPhotoViewController: CropViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}

extension EditPhotoViewController: CropViewControllerDelegate {
    func cropViewControllerDidCrop(_ cropViewController: Mantis.CropViewController, cropped: UIImage, transformation: Mantis.Transformation, cropInfo: Mantis.CropInfo) {
        EditPhotoReactor.shared.action.onNext(.setImage(cropped))
        EditPhotoReactor.shared.action.onNext(.doubleDismissView)
    }
    
    func cropViewControllerDidCancel(_ cropViewController: CropViewController, original: UIImage) {
        EditPhotoReactor.shared.action.onNext(.dismissView)
    }
}
