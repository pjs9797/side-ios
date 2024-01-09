import UIKit
import Mantis

class CameraViewController: UIImagePickerController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sourceType = .camera
        self.allowsEditing = false
        self.cameraDevice = .rear
        self.cameraCaptureMode = .photo
        self.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        self.presentEditPhotoViewController(img: selectedImage)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func presentEditPhotoViewController(img: UIImage) {
        var config = Mantis.Config()
        config.cropMode = .async
        config.cropViewConfig.showAttachedRotationControlView = false
        config.cropToolbarConfig.toolbarButtonOptions = [.clockwiseRotate, .reset, .ratio, .autoAdjust, .horizontallyFlip]
        let editPhotoViewController: EditPhotoViewController = Mantis.cropViewController(image: img, config: config)
        editPhotoViewController.modalPresentationStyle = .overFullScreen
        self.present(editPhotoViewController, animated: true)
    }
}
