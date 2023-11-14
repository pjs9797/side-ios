import UIKit
import SnapKit
import Shared
import FeatureSignUp

public class PasswordViewController: UIViewController {
    let progressBar = UIProgressView()
    let guideLabelOne = UILabel()
    let guideLabelTwo = UILabel()
    let pwTextViewOne = UIView()
    let pwLabelOne = UILabel()
    let pwTextFieldOne = UITextField()
    let labelStackView = UIStackView()
    let englishLabel = UILabel()
    let numberLabel = UILabel()
    let symbolLabel = UILabel()
    let sixLabel = UILabel()
    let pwTextViewTwo = UIView()
    let pwLabelTwo = UILabel()
    let pwTextFieldTwo = UITextField()
    let emailView = UIView()
    let emailLabel = UILabel()
    let emailTextField = UITextField()
    let signUpButton = UIButton()
    let cancelButtonOne = UIButton()
    let cancelButtonTwo = UIButton()
    let possibleUseLabel = UILabel()
    let checkImageView = UIImageView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setNavigationBar()
        setBackgroundColor()
        setTextContent()
        setTextSize()
        setTextField()
        setTextColor()
        setStackView()
        setBorderLine()
        setProgressBar()
        setImageView()
    }
    
    func addViews() {
        [progressBar, guideLabelOne, guideLabelTwo, pwTextViewOne ,labelStackView, pwTextViewTwo ,signUpButton, emailView, possibleUseLabel].forEach {
            view.addSubview($0)
        }
        
        [pwLabelOne, pwTextFieldOne, cancelButtonOne, checkImageView].forEach {
            pwTextViewOne.addSubview($0)
        }
        
        [englishLabel, numberLabel, symbolLabel, sixLabel].forEach {
            labelStackView.addArrangedSubview($0)
        }
        
        [pwLabelTwo, pwTextFieldTwo, cancelButtonTwo].forEach {
            pwTextViewTwo.addSubview($0)
        }
        
        [emailLabel, emailTextField].forEach {
            emailView.addSubview($0)
        }
        
        setLayout()
    }
    
    func setNavigationBar() {
        title = "회원가입"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18),
            .foregroundColor: CustomColor.gray100 ?? UIColor()
        ]
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: nil)
        rightButton.tintColor = .black
        navigationItem.rightBarButtonItem = rightButton
    }
    
    func setBackgroundColor() {
        view.backgroundColor = .white
        signUpButton.backgroundColor = CustomColor.gray10
    }
    
    func setLayout() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        progressBar.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(safeArea.snp.top)
            $0.height.equalTo(2)
        }
        
        guideLabelOne.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(safeArea.snp.top).inset(62)
        }
        
        guideLabelTwo.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(safeArea.snp.top).inset(96)
        }
        
        pwTextViewOne.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(safeArea.snp.top).inset(184)
        }
        
        pwLabelOne.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(pwTextViewOne.snp.top).inset(8)
            $0.bottom.equalTo(pwTextViewOne.snp.bottom).inset(31)
        }
        
        pwTextFieldOne.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(pwTextViewOne.snp.top).inset(24.5)
            $0.bottom.equalTo(pwTextViewOne.snp.bottom).inset(7.5)
        }
        
        labelStackView.snp.makeConstraints {
            $0.leading.equalTo(safeArea.snp.leading).inset(20)
            $0.trailing.equalTo(safeArea.snp.trailing).inset(143)
            $0.top.equalTo(safeArea.snp.top).inset(250)
            $0.height.equalTo(24)
        }
        
        pwTextViewTwo.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(safeArea.snp.top).inset(296)
        }
        
        pwLabelTwo.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(pwTextViewTwo.snp.top).inset(8)
            $0.bottom.equalTo(pwTextViewTwo.snp.bottom).inset(31)
        }
        
        pwTextFieldTwo.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(pwTextViewTwo.snp.top).inset(24.5)
            $0.bottom.equalTo(pwTextViewTwo.snp.bottom).inset(7.5)
        }
        
        emailView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(safeArea.snp.bottom).inset(278)
        }
        
        emailLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(emailView.snp.top).inset(8)
            $0.bottom.equalTo(emailView.snp.bottom).inset(31)
        }
        
        emailTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(emailView.snp.top).inset(24.5)
            $0.bottom.equalTo(emailView.snp.bottom).inset(7.5)
        }
        
        signUpButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(safeArea.snp.bottom).inset(8)
            $0.height.equalTo(52)
        }
        
        cancelButtonOne.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(pwTextViewOne.snp.trailing).inset(19)
        }
        
        cancelButtonTwo.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(pwTextViewTwo.snp.trailing).inset(19)
        }
        
        possibleUseLabel.snp.makeConstraints {
            $0.leading.equalTo(safeArea.snp.leading).inset(20)
            $0.trailing.equalTo(safeArea.snp.trailing).inset(208)
            $0.top.equalTo(safeArea.snp.top).inset(248)
            $0.height.equalTo(17)
        }
        
        checkImageView.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(pwTextViewOne.snp.trailing).inset(16)
        }
    }
    
    func setTextContent() {
        guideLabelOne.text = "비밀번호를 입력해주세요"
        guideLabelTwo.text = "영문, 숫자, 특수문자를 포함한 6자리 이상으로 설정해주세요"
        
        [pwLabelOne, pwLabelTwo].forEach {
            $0.text = "비밀번호"
        }
        
        pwTextFieldOne.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : CustomColor.gray30 ?? UIColor() ])
        pwTextFieldOne.isSecureTextEntry = true
        pwTextFieldTwo.attributedPlaceholder = NSAttributedString(string: "비밀번호를 한번 더 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : CustomColor.gray30 ?? UIColor() ])
        emailLabel.text = "이메일"
        signUpButton.setTitle("가입하기", for: .normal)
        englishLabel.text = "영어"
        numberLabel.text = "숫자"
        symbolLabel.text = "특수문자"
        sixLabel.text = "6자리 이상"
        emailTextField.text = "abc123@gma"
        possibleUseLabel.text = "사용할 수 있는 비밀번호입니다."
        possibleUseLabel.isHidden = true
    }
    
    func setTextField() {
        cancelButtonOne.addTarget(self, action: #selector(textFieldContentDeleteOne(_:)), for: .touchUpInside)
        
        [cancelButtonOne, cancelButtonTwo].forEach {
            $0.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
            $0.tintColor = CustomColor.gray20
            $0.isHidden = true
        }
        
        pwTextFieldOne.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func setTextSize() {
        guideLabelOne.font = .boldSystemFont(ofSize: 20)
        guideLabelTwo.font = .systemFont(ofSize: 16)
        guideLabelTwo.numberOfLines = 2
        pwLabelOne.font = .systemFont(ofSize: 12)
        pwTextFieldOne.font = .systemFont(ofSize: 16)
        pwLabelTwo.font = .systemFont(ofSize: 12)
        pwTextFieldTwo.font = .systemFont(ofSize: 16)
        emailLabel.font = .systemFont(ofSize: 12)
        emailTextField.font = .systemFont(ofSize: 16)
        signUpButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        possibleUseLabel.font = .systemFont(ofSize: 12)
        
        [englishLabel, numberLabel, symbolLabel, sixLabel].forEach {
            $0.font = .systemFont(ofSize: 12)
            $0.textAlignment = .center
        }
    }
    
    func setTextColor() {
        guideLabelTwo.textColor = CustomColor.text03
        signUpButton.setTitleColor(CustomColor.gray30, for: .normal)
        possibleUseLabel.textColor = CustomColor.green
        
        [pwLabelOne, pwLabelTwo, emailLabel].forEach {
            $0.textColor = CustomColor.gray80
        }
        
        [pwTextFieldOne, pwTextFieldTwo, emailTextField].forEach {
            $0.textColor = CustomColor.gray100
        }
        
        [englishLabel, numberLabel, symbolLabel, sixLabel].forEach {
            $0.textColor = CustomColor.text03
        }
    }
    
    func setStackView() {
        labelStackView.distribution = .fillEqually
        labelStackView.spacing = 4
        labelStackView.alignment = .center
        labelStackView.axis = .horizontal
    }
    
    func setBorderLine() {
        [pwTextViewOne, pwTextViewTwo, emailView, signUpButton].forEach {
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 16
            $0.layer.borderColor = CustomColor.gray10?.cgColor
        }
        
        [englishLabel, numberLabel, symbolLabel, sixLabel].forEach {
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 12
            $0.layer.borderColor = CustomColor.gray10?.cgColor
            $0.layer.backgroundColor = CustomColor.gray10?.cgColor
        }
    }
    
    func setProgressBar() {
        progressBar.progressViewStyle = .bar
        progressBar.progressTintColor = CustomColor.gray100
        progressBar.progress = 0.5
    }
    
    func setImageView() {
        checkImageView.image = UIImage(systemName: "checkmark")
        checkImageView.isHidden = true
        checkImageView.tintColor = CustomColor.green
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        if pwTextFieldOne.text == "" {
            cancelButtonOne.isHidden = true
            cancelButtonTwo.isHidden = true
            pwTextViewOne.layer.borderColor = CustomColor.gray10?.cgColor
            
            [englishLabel, numberLabel, symbolLabel].forEach {
                $0.layer.borderColor = CustomColor.gray10?.cgColor
                $0.layer.backgroundColor = CustomColor.gray10?.cgColor
                $0.textColor = CustomColor.text03
            }
        } else {
            cancelButtonOne.isHidden = false
            cancelButtonTwo.isHidden = false
            pwTextViewOne.layer.borderColor = CustomColor.gray100?.cgColor
            
            guard let text = pwTextFieldOne.text else { return }
            checkPassword(text: text)
        }
    }
    
    @objc func textFieldContentDeleteOne(_ sender: Any?) {
        pwTextFieldOne.text = ""
        labelStackView.isHidden = false
        pwTextViewOne.layer.borderColor = CustomColor.gray10?.cgColor
        
        [englishLabel, numberLabel, symbolLabel, sixLabel].forEach {
            $0.layer.borderColor = CustomColor.gray10?.cgColor
            $0.layer.backgroundColor = CustomColor.gray10?.cgColor
            $0.textColor = CustomColor.text03
        }
        
        [cancelButtonOne, possibleUseLabel, checkImageView].forEach {
            $0.isHidden = true
        }
    }
    
    @objc func textFieldContentDeleteTwo(_ sender: Any?) {
        pwTextFieldTwo.text = ""
        pwTextViewTwo.layer.borderColor = CustomColor.gray10?.cgColor
        
        
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
            } else {
                return false
            }
        }()
        
        if isContainsNumber {
            numberLabel.layer.borderColor = CustomColor.green?.cgColor
            numberLabel.textColor = CustomColor.green
        } else {
            numberLabel.layer.borderColor = CustomColor.gray10?.cgColor
            numberLabel.layer.backgroundColor = CustomColor.gray10?.cgColor
            numberLabel.textColor = CustomColor.text03
        }
        
        if isContainsEnglish {
            englishLabel.layer.borderColor = CustomColor.green?.cgColor
            englishLabel.textColor = CustomColor.green
        } else {
            englishLabel.layer.borderColor = CustomColor.gray10?.cgColor
            englishLabel.layer.backgroundColor = CustomColor.gray10?.cgColor
            englishLabel.textColor = CustomColor.text03
        }
        
        if isContainsSymbol {
            symbolLabel.layer.borderColor = CustomColor.green?.cgColor
            symbolLabel.textColor = CustomColor.green
        } else {
            symbolLabel.layer.borderColor = CustomColor.gray10?.cgColor
            symbolLabel.layer.backgroundColor = CustomColor.gray10?.cgColor
            symbolLabel.textColor = CustomColor.text03
        }
        
        if isCountMoreSix {
            sixLabel.layer.borderColor = CustomColor.green?.cgColor
            sixLabel.textColor = CustomColor.green
        } else {
            sixLabel.layer.borderColor = CustomColor.gray10?.cgColor
            sixLabel.layer.backgroundColor = CustomColor.gray10?.cgColor
            sixLabel.textColor = CustomColor.text03
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
