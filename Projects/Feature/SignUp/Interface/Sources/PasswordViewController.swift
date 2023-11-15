import UIKit
import SnapKit
import Shared

public class PasswordViewController: UIViewController {
    
    var passwordView = PasswordView()
    
    public override func loadView() {
        super.loadView()
        view = passwordView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setAddTarget()
    }
    
    func setNavigationBar() {
        title = "회원가입"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18),
            .foregroundColor: SharedDSKitAsset.Colors.gr100.color
        ]
        
        let rightButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconSetting24.image, style: .plain, target: self, action: nil)
        rightButton.tintColor = .black
        navigationItem.rightBarButtonItem = rightButton
    }
    
    func setAddTarget() {
        passwordView.cancelButtonOne.addTarget(self, action: #selector(textFieldContentDeleteOne(_:)), for: .touchUpInside)
        passwordView.cancelButtonTwo.addTarget(self, action: #selector(textFieldContentDeleteTwo(_:)), for: .touchUpInside)
        passwordView.pwTextFieldOne.addTarget(self, action: #selector(textFieldDidChangeOne(_:)), for: .editingChanged)
        passwordView.pwTextFieldTwo.addTarget(self, action: #selector(textFieldDidChangeTwo(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChangeOne(_ sender: Any?) {
        if passwordView.pwTextFieldOne.text == "" {
            passwordView.cancelButtonOne.isHidden = true
            passwordView.pwTextViewOne.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            
            
            [passwordView.englishLabel, passwordView.numberLabel, passwordView.symbolLabel].forEach {
                $0.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                $0.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                $0.textColor = SharedDSKitAsset.Colors.text03.color
            }
        } else {
            passwordView.cancelButtonOne.isHidden = false
            passwordView.pwTextViewOne.layer.borderColor = SharedDSKitAsset.Colors.gr100.color.cgColor
            guard let textOne = passwordView.pwTextFieldOne.text else { return }
            checkPassword(text: textOne)
            
            if passwordView.labelStackView.isHidden == false {
                passwordView.progressBar.progress = 0.3
            }
        }
    }
    
    @objc func textFieldDidChangeTwo(_ sender: Any?) {
        if passwordView.possibleUseLabel.isHidden == false {
            [passwordView.checkImageView, passwordView.cancelButtonOne, passwordView.possibleUseLabel].forEach {
                $0.isHidden = true
            }
            passwordView.progressBar.progress = 0.6
        }
        
        if passwordView.pwTextFieldTwo.text == "" {
            [passwordView.cancelButtonTwo, passwordView.notAccordLabel, passwordView.warningImageView].forEach {
                $0.isHidden = true
            }
            passwordView.pwTextViewTwo.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        } else {
            passwordView.cancelButtonTwo.isHidden = false
            guard let textOne = passwordView.pwTextFieldOne.text else { return }
            guard let textTwo = passwordView.pwTextFieldTwo.text else { return }
            
            if !textOne.isEmpty {
                if textOne == textTwo {
                    [passwordView.pwTextViewOne, passwordView.pwTextViewTwo].forEach {
                        $0.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    }
                    
                    [passwordView.possibleUseLabel, passwordView.cancelButtonOne, passwordView.checkImageView, passwordView.notAccordLabel, passwordView.cancelButtonTwo, passwordView.warningImageView].forEach {
                        $0.isHidden = true
                    }
                } else {
                    passwordView.pwTextViewTwo.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
                    passwordView.warningImageView.isHidden = false
                    passwordView.notAccordLabel.isHidden = false
                }
            }
        }
    }
    
    @objc func textFieldContentDeleteOne(_ sender: Any?) {
        passwordView.pwTextFieldOne.text = ""
        passwordView.labelStackView.isHidden = false
        passwordView.pwTextViewOne.layer.borderColor = SharedDSKitAsset.Colors.gr100.color.cgColor
        
        [passwordView.englishLabel, passwordView.numberLabel, passwordView.symbolLabel, passwordView.sixLabel].forEach {
            $0.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            $0.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            $0.textColor = SharedDSKitAsset.Colors.text03.color
        }
        
        [passwordView.cancelButtonOne, passwordView.possibleUseLabel, passwordView.checkImageView].forEach {
            $0.isHidden = true
        }
    }
    
    @objc func textFieldContentDeleteTwo(_ sender: Any?) {
        passwordView.pwTextFieldTwo.text = ""
        passwordView.pwTextViewTwo.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        
        [passwordView.cancelButtonTwo, passwordView.warningImageView, passwordView.notAccordLabel].forEach {
            $0.isHidden = true
        }
    }
    
    func checkPassword(text: String) {
        let isContainsNumber: Bool = {
            return "\(text)".range(of: "\\p{Number}", options: .regularExpression) != nil
        }()
        
        let isContainsEnglish: Bool = {
            return "\(text)".range(of: "\\p{Latin}", options: .regularExpression) != nil
        }()
        
        let isContainsSymbol: Bool = {
            return "\(text)".range(of: "(?=.*[!@#$%^&*])", options: .regularExpression) != nil
        }()
        
        let isCountMoreSix: Bool = {
            if text.count >= 6 {
                return true
            }
            return false
        }()
        
        if isContainsNumber {
            passwordView.numberLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
            passwordView.numberLabel.textColor = SharedDSKitAsset.Colors.green.color
        } else {
            passwordView.numberLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            passwordView.numberLabel.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            passwordView.numberLabel.textColor = SharedDSKitAsset.Colors.text03.color
        }
        
        if isContainsEnglish {
            passwordView.englishLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
            passwordView.englishLabel.textColor = SharedDSKitAsset.Colors.green.color
        } else {
            passwordView.englishLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            passwordView.englishLabel.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            passwordView.englishLabel.textColor = SharedDSKitAsset.Colors.text03.color
        }
        
        if isContainsSymbol {
            passwordView.symbolLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
            passwordView.symbolLabel.textColor = SharedDSKitAsset.Colors.green.color
        } else {
            passwordView.symbolLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            passwordView.symbolLabel.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            passwordView.symbolLabel.textColor = SharedDSKitAsset.Colors.text03.color
        }
        
        if isCountMoreSix {
            passwordView.sixLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
            passwordView.sixLabel.textColor = SharedDSKitAsset.Colors.green.color
        } else {
            passwordView.sixLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            passwordView.sixLabel.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            passwordView.sixLabel.textColor = SharedDSKitAsset.Colors.text03.color
        }
        
        if isContainsEnglish && isContainsNumber && isContainsSymbol && isCountMoreSix {
            passwordView.labelStackView.isHidden = true
            passwordView.possibleUseLabel.isHidden = false
            passwordView.checkImageView.isHidden = false
            
            passwordView.cancelButtonOne.snp.makeConstraints {
                $0.width.height.equalTo(24)
                $0.centerY.equalToSuperview()
                $0.trailing.equalTo(passwordView.pwTextViewOne.snp.trailing).inset(48)
            }
        } else {
            passwordView.labelStackView.isHidden = false
            passwordView.possibleUseLabel.isHidden = true
            passwordView.checkImageView.isHidden = true
            
            passwordView.cancelButtonOne.snp.makeConstraints {
                $0.width.height.equalTo(24)
                $0.centerY.equalToSuperview()
                $0.trailing.equalTo(passwordView.pwTextViewOne.snp.trailing).inset(19)
            }
        }
    }
}
