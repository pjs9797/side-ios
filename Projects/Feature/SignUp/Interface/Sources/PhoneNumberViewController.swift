import UIKit
import SnapKit
import Shared

class PhoneNumberViewController: UIViewController {
    var phoneNumberView = PhoneNumberView()
    
    override func loadView() {
        super.loadView()
        
        view = phoneNumberView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
    }
    
    func setNavigationBar() {
        title = "회원가입"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : Fonts.SH03Bold.font,
            .foregroundColor: SharedDSKitAsset.Colors.gr100.color
        ]
        
        let rightButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconSetting24.image, style: .plain, target: self, action: nil)
        rightButton.tintColor = SharedDSKitAsset.Colors.black.color
        navigationItem.rightBarButtonItem = rightButton
    }
}
