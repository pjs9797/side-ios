import UIKit
import SnapKit
import Shared
//import FeatureProfile

public class PhoneNumberViewController: UIViewController, UITextFieldDelegate {
    var phoneNumberView = PhoneNumberView()
    var timer: Timer?
    var timerNum: Int = 0
    
    public override func loadView() {
        super.loadView()
        
        view = phoneNumberView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberView.emailTextField.delegate = self
        setAddTarget()
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
    
    func setAddTarget() {
        phoneNumberView.phoneNumberTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        phoneNumberView.certificationButton.addTarget(self, action: #selector(certificationButtonClicked(_:)), for: .touchUpInside)
        phoneNumberView.certificationTextField.addTarget(self, action: #selector(certificationtextFieldDidChange(_:)), for: .editingChanged)
    }
    
    func startTimer() {
        if timer != nil && timer!.isValid {
            timer?.invalidate()
        }
        
        timerNum = 180
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
    }
    
    func checkPhoneNumber(phoneNumber: String) -> Bool {
        let regex = "^010-?([0-9]{4})-?([0-9]{4})$"
        let pred = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return pred.evaluate(with: phoneNumber)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)

        if text == "Iop0221@naver.com" {
            print("hello")
            phoneNumberView.signUpButton.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
            phoneNumberView.signUpButton.setTitleColor(SharedDSKitAsset.Colors.white.color, for: .normal)
         
        } else {
            print("no")
        }
        return true
    
    }
    
    func setNothingInsert() {
        phoneNumberView.phoneNumberView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        phoneNumberView.phoneNumberLabel.textColor = SharedDSKitAsset.Colors.gr80.color
        phoneNumberView.notAccordLabel.isHidden = true
        phoneNumberView.warningImageView.isHidden = true
        phoneNumberView.certificationButton.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        phoneNumberView.certificationButton.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
        
        phoneNumberView.passwordViewOne.snp.updateConstraints {
            $0.top.equalTo(phoneNumberView.phoneNumberView.snp.bottom).offset(24)
        }
    }
    
    func setWrongInsert() {
        phoneNumberView.phoneNumberView.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
        phoneNumberView.certificationButton.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        phoneNumberView.notAccordLabel.isHidden = false
        phoneNumberView.warningImageView.isHidden = false
        phoneNumberView.phoneNumberLabel.textColor = SharedDSKitAsset.Colors.red.color
        phoneNumberView.certificationButton.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        phoneNumberView.certificationButton.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
        phoneNumberView.certificationButton.setTitle("인증하기", for: .normal)
        
        phoneNumberView.passwordViewOne.snp.updateConstraints {
            $0.top.equalTo(phoneNumberView.phoneNumberView.snp.bottom).offset(49)
        }
        
        phoneNumberView.certificationView.isHidden = true
    }
    
    func setCorrectInsert() {
        phoneNumberView.phoneNumberView.layer.borderColor = SharedDSKitAsset.Colors.gr100.color.cgColor
        phoneNumberView.certificationButton.layer.borderColor = SharedDSKitAsset.Colors.gr50.color.cgColor
        phoneNumberView.certificationButton.backgroundColor = SharedDSKitAsset.Colors.white.color
        phoneNumberView.certificationButton.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        
        phoneNumberView.phoneNumberLabel.textColor = SharedDSKitAsset.Colors.gr80.color
        phoneNumberView.notAccordLabel.isHidden = true
        phoneNumberView.warningImageView.isHidden = true
        
        phoneNumberView.passwordViewOne.snp.updateConstraints {
            $0.top.equalTo(phoneNumberView.phoneNumberView.snp.bottom).offset(24)
        }
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        guard let phoneNumber = phoneNumberView.phoneNumberTextField.text else { return }
        
        if phoneNumberView.phoneNumberTextField.text == "" {
            setNothingInsert()
        } else {
            if checkPhoneNumber(phoneNumber: phoneNumber) {
                setCorrectInsert()
            } else {
                setWrongInsert()
            }
        }
    }
    
    @objc func timerCallback() {
        let minutes = timerNum / 60 % 60
        let seconds = timerNum % 60
        phoneNumberView.timerLabel.text = String(format: "%01i:%02i", minutes, seconds)
        
        if timerNum == 0 {
            timer?.invalidate()
            timer = nil
        }
        
        timerNum -= 1
    }
    
    @objc func certificationButtonClicked(_ sender: Any?) {
        guard let phoneNumber = phoneNumberView.phoneNumberTextField.text else { return }
        guard checkPhoneNumber(phoneNumber: phoneNumber) else { return }
        
        phoneNumberView.certificationButton.setTitle("재요청", for: .normal)
        phoneNumberView.certificationButton.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        phoneNumberView.certificationView.isHidden = false
        phoneNumberView.passwordViewOne.snp.updateConstraints {
            $0.top.equalTo(phoneNumberView.phoneNumberView.snp.bottom).offset(104)
        }
        
        startTimer()
    }
    
    @objc func certificationtextFieldDidChange(_ sender: Any?) {
        // 예시 인증번호를 입력하면 체크마크와 인증 완료를 알려주는 안내문이 밑에 뜨게끔 설정
        if phoneNumberView.certificationTextField.text == "321233" {
            phoneNumberView.timerLabel.isHidden = true
            phoneNumberView.checkImageView.isHidden = false
            phoneNumberView.completeLabel.isHidden = false
            
            phoneNumberView.passwordViewOne.snp.updateConstraints {
                $0.top.equalTo(phoneNumberView.phoneNumberView.snp.bottom).offset(129)
            }
        
        } else {
            phoneNumberView.timerLabel.isHidden = false
            phoneNumberView.checkImageView.isHidden = true
            phoneNumberView.completeLabel.isHidden = true
            
            phoneNumberView.passwordViewOne.snp.updateConstraints {
                $0.top.equalTo(phoneNumberView.phoneNumberView.snp.bottom).offset(104)
            }
        }
    }
}


