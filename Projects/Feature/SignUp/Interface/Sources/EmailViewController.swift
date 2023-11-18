import UIKit
import Shared

public class EmailViewController: UIViewController {
    var emailView = EmailView()
    
    public override func loadView() {
        super.loadView()
        
        view = emailView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationbar()
        setAddTarget()
    }
    
    func setNavigationbar() {
        title = "회원가입"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : Fonts.SH03Bold.font,
            .foregroundColor: SharedDSKitAsset.Colors.gr100.color
        ]
        
        let rightButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconSetting24.image, style: .plain, target: self, action: nil)
        rightButton.tintColor = SharedDSKitAsset.Colors.black.color
        navigationItem.rightBarButtonItem = rightButton
    }
    
    func setAddTarget() {
        emailView.emailTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        emailView.cancelButton.addTarget(self, action: #selector(textFieldContentDelete(_:)), for: .touchUpInside)
    }
    
    func checkEmail(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        if emailView.emailTextField.text == "" {
            emailView.textFieldView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            emailView.cancelButton.isHidden = true
            
            emailView.cancelButton.snp.updateConstraints {
                $0.trailing.equalTo(emailView.textFieldView.snp.trailing).inset(16)
            }
        } else {
            emailView.textFieldView.layer.borderColor = SharedDSKitAsset.Colors.gr100.color.cgColor
            emailView.cancelButton.isHidden = false
            guard let text = emailView.emailTextField.text else { return }
            
            if checkEmail(str: text) {
                emailView.useLabel.isHidden = false
                emailView.checkImageView.isHidden = false
                emailView.textFieldView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                
                emailView.cancelButton.snp.updateConstraints {
                    $0.trailing.equalTo(emailView.textFieldView.snp.trailing).inset(48)
                }
            } else {
                emailView.useLabel.isHidden = true
                emailView.checkImageView.isHidden = true
                
                emailView.cancelButton.snp.updateConstraints {
                    $0.trailing.equalTo(emailView.textFieldView.snp.trailing).inset(16)
                }
            }
        }
    }
    
    @objc func textFieldContentDelete(_ sender: Any?) {
        emailView.emailTextField.text = ""
        emailView.cancelButton.isHidden = true
        emailView.checkImageView.isHidden = true
        emailView.useLabel.isHidden = true
    }
}
