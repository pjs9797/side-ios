import UIKit
import Shared
import FeatureProfile

public class EmailViewController: UIViewController, UITextFieldDelegate {
    let emailView = EmailView()
    let profileView = profileMainViewController()
    
    var timer: Timer?
    var timerNum: Int = 0
    
    public override func loadView() {
        super.loadView()
        
        view = emailView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        emailView.signUpButton.rx.tap.subscribe(onNext: {
            self.navigationController?.pushViewController(self.profileView, animated: false)
        })
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
        setNavigationbar()
        setAddTarget()
        passwordViewSetAddTarget()
        PhoneSetAddTarget()
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
    
    func PhoneSetAddTarget(){
        emailView.phoneView.phoneNumberTextField.addTarget(self, action: #selector(textFieldDidChange2(_:)), for: .editingChanged)
        emailView.phoneView.certificationButton.addTarget(self, action: #selector(certificationButtonClicked(_:)), for: .touchUpInside)
        emailView.phoneView.certificationTextField.addTarget(self, action: #selector(certificationtextFieldDidChange(_:)), for: .editingChanged)
    }
    
    func checkEmail(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
    }
    @objc func certificationButtonClicked(_ sender: Any?) {
        guard let phoneNumber = emailView.phoneView.phoneNumberTextField.text else { return }
        guard checkPhoneNumber(phoneNumber: phoneNumber) else { return }
        
        emailView.phoneView.certificationButton.setTitle("재요청", for: .normal)
        emailView.phoneView.certificationButton.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        emailView.phoneView.certificationView.isHidden = false
        emailView.phoneView.passwordViewOne.snp.updateConstraints {
            $0.top.equalTo(emailView.phoneView.phoneNumberView.snp.bottom).offset(104)
        }
        emailView.passwordView.pwTextViewOne.snp.remakeConstraints { make in
            make.top.equalTo(emailView.phoneView.certificationView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(355)
        }
        
        startTimer()
    }
    
    func checkPhoneNumber(phoneNumber: String) -> Bool {
        let regex = "^010-?([0-9]{4})-?([0-9]{4})$"
        let pred = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return pred.evaluate(with: phoneNumber)
    }
    
    func startTimer() {
        if timer != nil && timer!.isValid {
            timer?.invalidate()
        }
        
        timerNum = 180
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
    }
    
    @objc func textFieldDidChange2(_ sender: Any?) {
        guard let phoneNumber = emailView.phoneView.phoneNumberTextField.text else { return }
        if emailView.phoneView.phoneNumberTextField.text == "" {
            setNothingInsert()
        } else {
            if checkPhoneNumber(phoneNumber: phoneNumber) {
                setCorrectInsert()
            } else {
                setWrongInsert()
            }
        }
    }
    
    func setNothingInsert() {
        emailView.phoneView.phoneNumberView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        emailView.phoneView.phoneNumberLabel.textColor = SharedDSKitAsset.Colors.gr80.color
        emailView.phoneView.notAccordLabel.isHidden = true
        emailView.phoneView.warningImageView.isHidden = true
        emailView.phoneView.certificationButton.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        emailView.phoneView.certificationButton.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
        
        emailView.phoneView.passwordViewOne.snp.updateConstraints {
            $0.top.equalTo(emailView.phoneView.phoneNumberView.snp.bottom).offset(24)
        }
    }
    
    func setWrongInsert() {
        emailView.phoneView.phoneNumberView.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
        emailView.phoneView.certificationButton.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        emailView.phoneView.notAccordLabel.isHidden = false
        emailView.phoneView.warningImageView.isHidden = false
        emailView.phoneView.phoneNumberLabel.textColor = SharedDSKitAsset.Colors.red.color
        emailView.phoneView.certificationButton.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        emailView.phoneView.certificationButton.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
        emailView.phoneView.certificationButton.setTitle("인증하기", for: .normal)
        
        emailView.phoneView.passwordViewOne.snp.updateConstraints {
            $0.top.equalTo(emailView.phoneView.phoneNumberView.snp.bottom).offset(49)
        }
        
        emailView.phoneView.certificationView.isHidden = true
    }
    
    func setCorrectInsert() {
        emailView.phoneView.phoneNumberView.layer.borderColor = SharedDSKitAsset.Colors.gr100.color.cgColor
        emailView.phoneView.certificationButton.layer.borderColor = SharedDSKitAsset.Colors.gr50.color.cgColor
        emailView.phoneView.certificationButton.backgroundColor = SharedDSKitAsset.Colors.white.color
        emailView.phoneView.certificationButton.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        
        emailView.phoneView.phoneNumberLabel.textColor = SharedDSKitAsset.Colors.gr80.color
        emailView.phoneView.notAccordLabel.isHidden = true
        emailView.phoneView.warningImageView.isHidden = true
        
        emailView.phoneView.passwordViewOne.snp.updateConstraints {
            $0.top.equalTo(emailView.phoneView.phoneNumberView.snp.bottom).offset(24)
        }
    }
    
    @objc func timerCallback() {
        let minutes = timerNum / 60 % 60
        let seconds = timerNum % 60
        emailView.phoneView.timerLabel.text = String(format: "%01i:%02i", minutes, seconds)
        
        if timerNum == 0 {
            timer?.invalidate()
            timer = nil
        }
        
        timerNum -= 1
    }
    
    @objc func certificationtextFieldDidChange(_ sender: Any?) {
        // 예시 인증번호를 입력하면 체크마크와 인증 완료를 알려주는 안내문이 밑에 뜨게끔 설정
        if emailView.phoneView.certificationTextField.text == "321233" {
            emailView.phoneView.timerLabel.isHidden = true
            emailView.phoneView.checkImageView.isHidden = false
            emailView.phoneView.completeLabel.isHidden = false
            emailView.signUpButton.isEnabled = true
            emailView.signUpButton.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
            emailView.signUpButton.setTitleColor(SharedDSKitAsset.Colors.white.color, for: .normal)
            emailView.phoneView.passwordViewOne.snp.updateConstraints {
                $0.top.equalTo(emailView.phoneView.phoneNumberView.snp.bottom).offset(129)
            }
        } else {
            emailView.phoneView.timerLabel.isHidden = false
            emailView.phoneView.checkImageView.isHidden = true
            emailView.phoneView.completeLabel.isHidden = true
            emailView.phoneView.passwordViewOne.snp.updateConstraints {
                $0.top.equalTo(emailView.phoneView.phoneNumberView.snp.bottom).offset(104)
            }
        }
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
                emailView.textFieldView.snp.remakeConstraints { make in
                    make.width.equalTo(335)
                    make.height.equalTo(56)
                    make.top.equalTo(emailView.passwordView.pwTextViewTwo.snp.bottom).offset(30)
                    make.leading.trailing.equalToSuperview().inset(20)
                }
                emailView.insertEmailLabelTwo.snp.remakeConstraints { make in
                    make.width.equalTo(380)
                    make.height.equalTo(60)
                    make.leading.trailing.equalToSuperview()
                    make.top.equalTo(36)
                    
                }
                emailView.passwordView.pwTextViewTwo.snp.remakeConstraints { make in
                    make.top.equalTo(emailView.passwordView.pwTextViewOne.snp.bottom).offset(38)
                    make.leading.equalToSuperview().offset(20)
                    make.width.equalTo(355)
                }
               
                emailView.passwordView.pwTextViewOne.isHidden = false
                emailView.passwordView.pwTextViewTwo.isHidden = false
                emailView.passwordView.labelStackView.isHidden = false
                emailView.insertEmailLabelTwo.numberOfLines = 2
                emailView.insertEmailLabelOne.text = "비밀번호를 입력해주세요"
                emailView.insertEmailLabelTwo.text = "영문, 숫자, 특수문자를 포함한 6자리 이상으로 설정해주세요."
                emailView.progressBar.progress = 0.66
                
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
    
    func passwordViewSetAddTarget() {
        emailView.passwordView.cancelButtonOne.addTarget(self, action: #selector(textFieldContentDeleteOne(_:)), for: .touchUpInside)
        emailView.passwordView.cancelButtonTwo.addTarget(self, action: #selector(textFieldContentDeleteTwo(_:)), for: .touchUpInside)
        emailView.passwordView.pwTextFieldOne.addTarget(self, action: #selector(textFieldDidChangeOne(_:)), for: .editingChanged)
        emailView.passwordView.pwTextFieldTwo.addTarget(self, action: #selector(textFieldDidChangeTwo(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChangeOne(_ sender: Any?) {
        if emailView.passwordView.pwTextFieldOne.text == "" {
            emailView.passwordView.cancelButtonOne.isHidden = true
            emailView.passwordView.pwTextViewOne.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            [emailView.passwordView.englishLabel, emailView.passwordView.numberLabel, emailView.passwordView.symbolLabel].forEach {
                $0.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                $0.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                $0.textColor = SharedDSKitAsset.Colors.text03.color
            }
        } else {
            emailView.passwordView.cancelButtonOne.isHidden = false
            emailView.passwordView.pwTextViewOne.layer.borderColor = SharedDSKitAsset.Colors.gr100.color.cgColor
            guard let textOne = emailView.passwordView.pwTextFieldOne.text else { return }
            checkPassword(text: textOne)
            
            if emailView.passwordView.labelStackView.isHidden == false {
                emailView.passwordView.progressBar.progress = 0.3
            }
        }
    }
    @objc func textFieldContentDeleteOne(_ sender: Any?) {
        emailView.passwordView.pwTextFieldOne.text = ""
        emailView.passwordView.labelStackView.isHidden = false
        emailView.passwordView.pwTextViewOne.layer.borderColor = SharedDSKitAsset.Colors.gr100.color.cgColor
        
        [emailView.passwordView.englishLabel, emailView.passwordView.numberLabel, emailView.passwordView.symbolLabel, emailView.passwordView.sixLabel].forEach {
            $0.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            $0.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            $0.textColor = SharedDSKitAsset.Colors.text03.color
        }
        
        [emailView.passwordView.cancelButtonOne, emailView.passwordView.possibleUseLabel, emailView.passwordView.checkImageView].forEach {
            $0.isHidden = true
        }
    }
    
    @objc func textFieldDidChangeTwo(_ sender: Any?) {
        if emailView.passwordView.possibleUseLabel.isHidden == false {
            [emailView.passwordView.checkImageView, emailView.passwordView.cancelButtonOne, emailView.passwordView.possibleUseLabel].forEach {
                $0.isHidden = true
            }
            emailView.passwordView.progressBar.progress = 0.66
        }

        if emailView.passwordView.pwTextFieldTwo.text == "" {
            [emailView.passwordView.cancelButtonTwo, emailView.passwordView.notAccordLabel, emailView.passwordView.warningImageView].forEach {
                $0.isHidden = true
            }
            emailView.passwordView.pwTextViewTwo.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        } else {
            emailView.passwordView.cancelButtonTwo.isHidden = false
            guard let textOne = emailView.passwordView.pwTextFieldOne.text else { return }
            guard let textTwo = emailView.passwordView.pwTextFieldTwo.text else { return }

            if !textOne.isEmpty {
                if textOne == textTwo {
                    [emailView.passwordView.pwTextViewOne, emailView.passwordView.pwTextViewTwo].forEach {
                        $0.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    }

                    [emailView.passwordView.possibleUseLabel, emailView.passwordView.cancelButtonOne, emailView.passwordView.checkImageView, emailView.passwordView.notAccordLabel, emailView.passwordView.cancelButtonTwo, emailView.passwordView.warningImageView].forEach {
                        $0.isHidden = true
                    }
                    emailView.insertEmailLabelOne.text = "전화번호를 인증해 주세요"
                    emailView.insertEmailLabelTwo.text = "신뢰할 수 있는 커뮤니티를 위해 전화번호가 필요해요."
                    emailView.phoneView.phoneNumberView.isHidden = false                    
                    emailView.progressBar.progress = 1
                    
                    
                  
                    
                    emailView.passwordView.pwTextViewOne.snp.remakeConstraints { make in
                        make.top.equalTo(emailView.phoneView.phoneNumberView.snp.bottom).offset(30)
                        make.leading.equalToSuperview().offset(20)
                        make.width.equalTo(355)
                    }
                    emailView.textFieldView.snp.remakeConstraints { make in
                        make.top.equalTo(emailView.passwordView.pwTextViewTwo.snp.bottom).offset(30)
                        make.width.equalTo(335)
                        make.height.equalTo(56)
                    
                        make.leading.trailing.equalToSuperview().inset(20)
                    }
                    
                   
                } else {
                    emailView.passwordView.pwTextViewTwo.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
                    emailView.passwordView.warningImageView.isHidden = false
                    emailView.passwordView.notAccordLabel.isHidden = false
                }
            }
        }
    }
  
    @objc func textFieldContentDeleteTwo(_ sender: Any?) {
        emailView.passwordView.pwTextFieldTwo.text = ""
        emailView.passwordView.pwTextViewTwo.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        
        [emailView.passwordView.cancelButtonTwo, emailView.passwordView.warningImageView, emailView.passwordView.notAccordLabel].forEach {
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
            emailView.passwordView.numberLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
            emailView.passwordView.numberLabel.textColor = SharedDSKitAsset.Colors.green.color
        } else {
            emailView.passwordView.numberLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            emailView.passwordView.numberLabel.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            emailView.passwordView.numberLabel.textColor = SharedDSKitAsset.Colors.text03.color
        }
        
        if isContainsEnglish {
            emailView.passwordView.englishLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
            emailView.passwordView.englishLabel.textColor = SharedDSKitAsset.Colors.green.color
        } else {
            emailView.passwordView.englishLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            emailView.passwordView.englishLabel.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            emailView.passwordView.englishLabel.textColor = SharedDSKitAsset.Colors.text03.color
        }
        
        if isContainsSymbol {
            emailView.passwordView.symbolLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
            emailView.passwordView.symbolLabel.textColor = SharedDSKitAsset.Colors.green.color
        } else {
            emailView.passwordView.symbolLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            emailView.passwordView.symbolLabel.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            emailView.passwordView.symbolLabel.textColor = SharedDSKitAsset.Colors.text03.color
        }
        
        if isCountMoreSix {
            emailView.passwordView.sixLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
            emailView.passwordView.sixLabel.textColor = SharedDSKitAsset.Colors.green.color
        } else {
            emailView.passwordView.sixLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            emailView.passwordView.sixLabel.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            emailView.passwordView.sixLabel.textColor = SharedDSKitAsset.Colors.text03.color
        }
        
        if isContainsEnglish && isContainsNumber && isContainsSymbol && isCountMoreSix {
            emailView.passwordView.labelStackView.isHidden = true
            emailView.passwordView.possibleUseLabel.isHidden = false
            emailView.passwordView.checkImageView.isHidden = false
            
            emailView.passwordView.cancelButtonOne.snp.makeConstraints {
                $0.width.height.equalTo(24)
                $0.centerY.equalToSuperview()
                $0.trailing.equalTo(emailView.passwordView.pwTextViewOne.snp.trailing).inset(48)
            }
        } else {
            emailView.passwordView.labelStackView.isHidden = false
            emailView.passwordView.possibleUseLabel.isHidden = true
            emailView.passwordView.checkImageView.isHidden = true
            
            emailView.passwordView.cancelButtonOne.snp.makeConstraints {
                $0.width.height.equalTo(24)
                $0.centerY.equalToSuperview()
                $0.trailing.equalTo(emailView.passwordView.pwTextViewOne.snp.trailing).inset(19)
            }
        }
    }
}
