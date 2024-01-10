import UIKit
import Mantis
import RxSwift
import RxCocoa

class EditPhotoViewController: CropViewController {
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}

extension EditPhotoViewController: CropViewControllerDelegate {
    func cropViewControllerDidCrop(_ cropViewController: Mantis.CropViewController, cropped: UIImage, transformation: Mantis.Transformation, cropInfo: Mantis.CropInfo) {
        EditPhotoViewModel.shared.imgRelay.accept(cropped)
        if let rootViewController = self.view.window?.rootViewController {
            rootViewController.dismiss(animated: true, completion: {
                self.dismiss(animated: true)
            })
        }
    }
    
    func cropViewControllerDidFailToCrop(_ cropViewController: CropViewController, original: UIImage) {
        // 크롭 실패 처리
    }
    
    func cropViewControllerDidCancel(_ cropViewController: CropViewController, original: UIImage) {
        // 크롭 취소 처리
        self.dismiss(animated: true)
    }
}
