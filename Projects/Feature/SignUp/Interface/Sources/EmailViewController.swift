import UIKit
import Shared

public class EmailViewController: UIViewController {
    var emailView = EmailView()
    var isCheckedEmail: Bool = false
    
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
        rightButton.tintColor = .black
        navigationItem.rightBarButtonItem = rightButton
    }
    
    func setAddTarget() {
        emailView.emailTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        emailView.cancelButton.addTarget(self, action: #selector(textFieldContentDelete(_:)), for: .touchUpInside)
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        if emailView.emailTextField.text == "" {
            emailView.textFieldView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            emailView.cancelButton.isHidden = true
        } else {
            emailView.textFieldView.layer.borderColor = SharedDSKitAsset.Colors.gr100.color.cgColor
            emailView.cancelButton.isHidden = false
            guard let text = emailView.emailTextField.text else { return }
            
            if text.contains("@") && text.contains(".com")  {
                emailView.checkImageView.isHidden = false
                emailView.useLabel.isHidden = false
                isCheckedEmail = true
                changeCancelButtonLayout(isCheckedEmail: isCheckedEmail)
            } else {
                emailView.useLabel.isHidden = true
                emailView.checkImageView.isHidden = true
                isCheckedEmail = false
                changeCancelButtonLayout(isCheckedEmail: isCheckedEmail)
            }
        }
    }
    
    func changeCancelButtonLayout(isCheckedEmail: Bool) {
        if isCheckedEmail {
            emailView.cancelButton.snp.makeConstraints {
                $0.width.height.equalTo(18)
                $0.centerY.equalToSuperview()
                $0.trailing.equalTo(emailView.textFieldView.snp.trailing).inset(48)
            }
        } else {
            emailView.cancelButton.snp.makeConstraints {
                $0.width.height.equalTo(18)
                $0.centerY.equalToSuperview()
                $0.trailing.equalTo(emailView.textFieldView.snp.trailing).inset(16)
            }
        }
    }
    
    @objc func textFieldContentDelete(_ sender: Any?) {
        emailView.emailTextField.text = ""
        emailView.cancelButton.isHidden = true
    }
}
