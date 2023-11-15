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
        if pwTextFieldOne.text == "" {
            cancelButtonOne.isHidden = true
            pwTextViewOne.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            
            [englishLabel, numberLabel, symbolLabel].forEach {
                $0.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                $0.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                $0.textColor = SharedDSKitAsset.Colors.text03.color
            }
        } else {
            cancelButtonOne.isHidden = false
            pwTextViewOne.layer.borderColor = SharedDSKitAsset.Colors.gr100.color.cgColor
            guard let textOne = pwTextFieldOne.text else { return }
            checkPassword(text: textOne)
            
            if labelStackView.isHidden == false {
                progressBar.progress = 0.3
            }
        }
    }
    
    @objc func textFieldDidChangeTwo(_ sender: Any?) {
        if possibleUseLabel.isHidden == false {
            [checkImageView, cancelButtonOne, possibleUseLabel].forEach {
                $0.isHidden = true
            }
            progressBar.progress = 0.6
        }
        
        if pwTextFieldTwo.text == "" {
            [cancelButtonTwo, notAccordLabel, warningImageView].forEach {
                $0.isHidden = true
            }
            pwTextViewTwo.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        } else {
            cancelButtonTwo.isHidden = false
            guard let textOne = pwTextFieldOne.text else { return }
            guard let textTwo = pwTextFieldTwo.text else { return }
            
            if !textOne.isEmpty {
                if textOne == textTwo {
                    [pwTextViewOne, pwTextViewTwo].forEach {
                        $0.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    }
                    
                    [possibleUseLabel, cancelButtonOne, checkImageView, notAccordLabel, cancelButtonTwo, warningImageView].forEach {
                        $0.isHidden = true
                    }
                } else {
                    pwTextViewTwo.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
                    warningImageView.isHidden = false
                    notAccordLabel.isHidden = false
                }
            }
        }
    }
    
    @objc func textFieldContentDeleteOne(_ sender: Any?) {
        pwTextFieldOne.text = ""
        labelStackView.isHidden = false
        pwTextViewOne.layer.borderColor = SharedDSKitAsset.Colors.gr100.color.cgColor
        
        [englishLabel, numberLabel, symbolLabel, sixLabel].forEach {
            $0.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            $0.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            $0.textColor = SharedDSKitAsset.Colors.text03.color
        }
        
        [cancelButtonOne, possibleUseLabel, checkImageView].forEach {
            $0.isHidden = true
        }
    }
    
    @objc func textFieldContentDeleteTwo(_ sender: Any?) {
        pwTextFieldTwo.text = ""
        pwTextViewTwo.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        
        [cancelButtonTwo, warningImageView, notAccordLabel].forEach {
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
            numberLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
            numberLabel.textColor = SharedDSKitAsset.Colors.green.color
        } else {
            numberLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            numberLabel.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            numberLabel.textColor = SharedDSKitAsset.Colors.text03.color
        }
        
        if isContainsEnglish {
            englishLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
            englishLabel.textColor = SharedDSKitAsset.Colors.green.color
        } else {
            englishLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            englishLabel.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            englishLabel.textColor = SharedDSKitAsset.Colors.text03.color
        }
        
        if isContainsSymbol {
            symbolLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
            symbolLabel.textColor = SharedDSKitAsset.Colors.green.color
        } else {
            symbolLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            symbolLabel.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            symbolLabel.textColor = SharedDSKitAsset.Colors.text03.color
        }
        
        if isCountMoreSix {
            sixLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
            sixLabel.textColor = SharedDSKitAsset.Colors.green.color
        } else {
            sixLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            sixLabel.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            sixLabel.textColor = SharedDSKitAsset.Colors.text03.color
        }
        
        if isContainsEnglish && isContainsNumber && isContainsSymbol && isCountMoreSix {
            labelStackView.isHidden = true
            possibleUseLabel.isHidden = false
            checkImageView.isHidden = false
            
            cancelButtonOne.snp.makeConstraints {
                $0.width.height.equalTo(24)
                $0.centerY.equalToSuperview()
                $0.trailing.equalTo(pwTextViewOne.snp.trailing).inset(48)
            }
        } else {
            labelStackView.isHidden = false
            possibleUseLabel.isHidden = true
            checkImageView.isHidden = true
            
            cancelButtonOne.snp.makeConstraints {
                $0.width.height.equalTo(24)
                $0.centerY.equalToSuperview()
                $0.trailing.equalTo(pwTextViewOne.snp.trailing).inset(19)
            }
        }
    }
}
