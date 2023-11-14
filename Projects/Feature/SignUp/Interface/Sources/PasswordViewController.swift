import UIKit
import SnapKit
import Shared

public class PasswordViewController: UIViewController {
    var progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.progressViewStyle = .bar
        progressBar.progressTintColor = SharedDSKitAsset.Colors.gr100.color
        progressBar.progress = 0.3
        return progressBar
    }()
    
    var guideLabelOne: UILabel = {
        let label = UILabel()
        label.text = "비밀번호를 입력해주세요"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    var guideLabelTwo: UILabel = {
        let label = UILabel()
        label.text = "영문, 숫자, 특수문자를 포함한 6자리 이상으로 설정해주세요"
        label.font = .systemFont(ofSize: 16)
        label.textColor = SharedDSKitAsset.Colors.text03.color
        label.numberOfLines = 2
        return label
    }()
    
    var pwLabelOne: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = .systemFont(ofSize: 12)
        label.textColor = SharedDSKitAsset.Colors.gr80.color
        return label
    }()
    
    var pwTextFieldOne: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : SharedDSKitAsset.Colors.gr30.color])
        textField.isSecureTextEntry = true
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = SharedDSKitAsset.Colors.gr100.color
        return textField
    }()
    
    var englishLabel: UILabel = {
        let label = UILabel()
        label.text = "영어"
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor =  SharedDSKitAsset.Colors.text03.color
        return label
    }()
    
    var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.axis = .horizontal
        return stackView
    }()
    
    var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "숫자"
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    
    var symbolLabel: UILabel = {
        let label = UILabel()
        label.text = "특수문자"
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    
    var sixLabel: UILabel = {
        let label = UILabel()
        label.text = "6자리 이상"
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    
    var pwLabelTwo: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = .systemFont(ofSize: 12)
        label.textColor = SharedDSKitAsset.Colors.gr80.color
        return label
    }()
    
    var pwTextFieldTwo: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 한번 더 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : SharedDSKitAsset.Colors.gr30.color ])
        textField.isSecureTextEntry = true
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = SharedDSKitAsset.Colors.gr100.color
        return textField
    }()
    
    var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일"
        label.font = .systemFont(ofSize: 12)
        label.textColor = SharedDSKitAsset.Colors.gr80.color
        return label
    }()
    
    var emailTextField: UITextField = {
        let textField = UITextField()
        textField.text = "abc123@gma"
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = SharedDSKitAsset.Colors.gr100.color
        return textField
    }()
    
    var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        button.setTitle("가입하기", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        return button
    }()
    
    var cancelButtonOne: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = SharedDSKitAsset.Colors.gr20.color
        button.isHidden = true
        return button
    }()
    
    var cancelButtonTwo: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = SharedDSKitAsset.Colors.gr20.color
        button.isHidden = true
        return button
    }()
    
    var possibleUseLabel: UILabel = {
        let label = UILabel()
        label.text = "사용할 수 있는 비밀번호입니다."
        label.isHidden = true
        label.font = .systemFont(ofSize: 12)
        label.textColor = SharedDSKitAsset.Colors.green.color
        return label
    }()
    
    var notAccordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호가 일치하지 않습니다."
        label.isHidden = true
        label.font = .systemFont(ofSize: 12)
        label.textColor = SharedDSKitAsset.Colors.red.color
        return label
    }()
    
    var checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark")
        imageView.isHidden = true
        imageView.tintColor = SharedDSKitAsset.Colors.green.color
        return imageView
    }()
    
    var warningImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "exclamationmark.circle.fill")
        imageView.isHidden = true
        imageView.tintColor = SharedDSKitAsset.Colors.red.color
        return imageView
    }()
    
    let pwTextViewOne = UIView()
    let pwTextViewTwo = UIView()
    let emailView = UIView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addViews()
        setNavigationBar()
        setAddTarget()
        setBorderLine()
    }
    
    func addViews() {
        [progressBar, guideLabelOne, guideLabelTwo, pwTextViewOne ,labelStackView, pwTextViewTwo ,signUpButton, emailView, possibleUseLabel, notAccordLabel].forEach {
            view.addSubview($0)
        }
        
        [pwLabelOne, pwTextFieldOne, cancelButtonOne, checkImageView].forEach {
            pwTextViewOne.addSubview($0)
        }
        
        [englishLabel, numberLabel, symbolLabel, sixLabel].forEach {
            labelStackView.addArrangedSubview($0)
        }
        
        [pwLabelTwo, pwTextFieldTwo, cancelButtonTwo, warningImageView].forEach {
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
            .foregroundColor: SharedDSKitAsset.Colors.gr100.color
        ]
        
        let rightButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconSetting24.image, style: .plain, target: self, action: nil)
        rightButton.tintColor = .black
        navigationItem.rightBarButtonItem = rightButton
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
            $0.top.equalTo(safeArea.snp.top).inset(98)
        }
        
        pwTextViewOne.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(safeArea.snp.top).inset(186)
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
            $0.top.equalTo(pwTextViewOne.snp.bottom).offset(49)
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
            $0.top.equalTo(pwTextViewTwo.snp.bottom).offset(49)
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
            $0.trailing.equalTo(pwTextViewTwo.snp.trailing).inset(48)
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
        
        warningImageView.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(pwTextViewTwo.snp.trailing).inset(16)
        }
        
        notAccordLabel.snp.makeConstraints {
            $0.height.equalTo(17)
            $0.leading.equalTo(safeArea.snp.leading).inset(20)
            $0.trailing.equalTo(safeArea.snp.trailing).inset(211)
            $0.top.equalTo(pwTextViewTwo.snp.bottom).offset(8)
        }
    }
    
    func setAddTarget() {
        cancelButtonOne.addTarget(self, action: #selector(textFieldContentDeleteOne(_:)), for: .touchUpInside)
        cancelButtonTwo.addTarget(self, action: #selector(textFieldContentDeleteTwo(_:)), for: .touchUpInside)
        pwTextFieldOne.addTarget(self, action: #selector(textFieldDidChangeOne(_:)), for: .editingChanged)
        pwTextFieldTwo.addTarget(self, action: #selector(textFieldDidChangeTwo(_:)), for: .editingChanged)
    }
    
    func setBorderLine() {
        [pwTextViewOne, pwTextViewTwo, emailView, signUpButton].forEach {
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 16
            $0.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        }
        
        [englishLabel, numberLabel, symbolLabel, sixLabel].forEach {
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 12
            $0.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            $0.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        }
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
