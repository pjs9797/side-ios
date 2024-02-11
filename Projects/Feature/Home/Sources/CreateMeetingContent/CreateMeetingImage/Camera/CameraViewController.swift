import UIKit
import Mantis
import RxFlow
import RxCocoa

class CameraViewController: UIImagePickerController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, Stepper{
    public var steps = PublishRelay<Step>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        self.steps.accept(CreateMeetingStep.presentEditPhotoViewController(image: selectedImage))
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.steps.accept(CreateMeetingStep.dismissViewController)
    }
}
