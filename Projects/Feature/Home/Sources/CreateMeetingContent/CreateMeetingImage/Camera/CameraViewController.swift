import UIKit
import Mantis
import RxCocoa

class CameraViewController: UIImagePickerController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    let cameraReactor = CameraReactor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else {
            self.cameraReactor.action.onNext(.dismissView)
            return
        }
        self.cameraReactor.action.onNext(.selectImage(selectedImage))
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.cameraReactor.action.onNext(.dismissView)
    }
}
