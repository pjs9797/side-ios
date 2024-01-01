import UIKit
import Shared
import SnapKit
import Shared

public class EmailView: UIView {
    let textView = UIView()
    let textFieldView = UIView()
    
    var insertEmailLabelOne: UILabel = {
        let label = UILabel()
        label.text = "이메일을 입력해주세요"
        label.font = Fonts.H01.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        
        return label
    }()
    
    var insertEmailLabelTwo: UILabel = {
        let label = UILabel()
        label.text = "로그인 시 사용하실 이메일을 입력해주세요."
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        
        return label
    }()
    
    var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일"
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.gr80.color
        
        return label
    }()
    
    var emailTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요", attributes: [NSAttributedString.Key.font : Fonts.Body02.font, NSAttributedString.Key.foregroundColor : SharedDSKitAsset.Colors.gr30.color])
        textField.clearButtonMode = .never
        textField.font = Fonts.Body02.font
        
        return textField
    }()
    
    var progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.progressViewStyle = .bar
        progressBar.progressTintColor = SharedDSKitAsset.Colors.gr100.color
        progressBar.progress = 0.33
        
        return progressBar
    }()
    
    var signUpButton: UIButton = {
        let signUpButton = UIButton()
        signUpButton.setTitle("가입하기", for: .normal)
        signUpButton.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        signUpButton.titleLabel?.font = Fonts.SH02Bold.font
        signUpButton.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
        
        return signUpButton
    }()
    
    var useLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "사용할 수 있는 아이디입니다."
        label.isHidden = true
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.green.color
        
        return label
    }()
    
    var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = SharedDSKitAsset.Colors.gr20.color
        button.isHidden = true
        
        return button
    }()
    
    var checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark")
        imageView.tintColor = SharedDSKitAsset.Colors.green.color
        imageView.isHidden = true
        
        return imageView
    }()
    
    
    
    
    var passwordView = PasswordView()
    var phoneView = PhoneNumberView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        let safeArea = self.safeAreaLayoutGuide
        self.backgroundColor = SharedDSKitAsset.Colors.white.color
        //passwordView 불러오기(처음엔 hidden 상태)
        passwordView.pwTextViewOne.isHidden = true
        passwordView.pwTextViewTwo.isHidden = true
        passwordView.labelStackView.isHidden = true
        phoneView.phoneNumberView.isHidden = true
        
        addSubViews([progressBar, signUpButton, textFieldView, textView, useLabel, passwordView.pwTextViewOne, passwordView.pwTextViewTwo, passwordView.labelStackView, passwordView.possibleUseLabel, passwordView.notAccordLabel, phoneView.phoneNumberView, phoneView.notAccordLabel, phoneView.certificationView])
      
        [passwordView.englishLabel, passwordView.numberLabel, passwordView.symbolLabel, passwordView.sixLabel].forEach {
            passwordView.labelStackView.addArrangedSubview($0)
        }
        
        addViews()
        setBorderLine()
        
        textView.snp.makeConstraints {
            $0.width.equalTo(335)
            $0.height.equalTo(60)
            $0.top.equalTo(progressBar.snp.bottom).offset(60)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        insertEmailLabelOne.snp.makeConstraints {
            $0.width.equalTo(182)
            $0.height.equalTo(28)
            $0.leading.top.equalToSuperview()
            $0.bottom.equalTo(-32)
            $0.trailing.equalTo(-153)
        }
        
        insertEmailLabelTwo.snp.makeConstraints {
            $0.width.equalTo(335)
            $0.height.equalTo(60)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(36)
        }
        
        textFieldView.snp.makeConstraints {
            $0.width.equalTo(335)
            $0.height.equalTo(56)
            $0.top.equalToSuperview().offset(230)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        emailLabel.snp.makeConstraints {
            $0.width.equalTo(231)
            $0.height.equalTo(17)
            $0.leading.equalTo(textFieldView.snp.leading).inset(16)
            $0.trailing.equalTo(textFieldView.snp.trailing).inset(88)
            $0.top.equalTo(textFieldView.snp.top).offset(8)
            $0.bottom.equalTo(textFieldView.snp.bottom).offset(-31)
        }
        
        emailTextField.snp.makeConstraints {
            $0.width.equalTo(231)
            $0.height.equalTo(24)
            $0.leading.equalTo(textFieldView.snp.leading).inset(16)
            $0.trailing.equalTo(textFieldView.snp.trailing).inset(88)
            $0.top.equalTo(textFieldView.snp.top).inset(25)
            $0.bottom.equalTo(textFieldView.snp.bottom).inset(8)
        }
        
        useLabel.snp.makeConstraints {
            $0.width.equalTo(137)
            $0.height.equalTo(17)
            $0.leading.equalTo(safeArea.snp.leading).inset(20)
            $0.trailing.equalTo(safeArea.snp.trailing).inset(218)
            $0.top.equalTo(textFieldView.snp.bottom).offset(8)
        }
        
        signUpButton.snp.makeConstraints {
            $0.width.equalTo(335)
            $0.height.equalTo(52)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(safeArea.snp.bottom).inset(8)
        }
        
        progressBar.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(safeArea.snp.top)
        }
        
        checkImageView.snp.makeConstraints {
            $0.width.equalTo(18)
            $0.height.equalTo(13.2)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(cancelButton.snp.trailing).offset(8)
        }
        
        cancelButton.snp.makeConstraints {
            $0.width.height.equalTo(18)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(textFieldView.snp.trailing).inset(16)
        }
        passwordView.pwTextViewOne.snp.makeConstraints { make in
            make.top.equalTo(insertEmailLabelTwo.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(355)
        }
        passwordView.pwTextViewTwo.snp.makeConstraints { make in
            make.top.equalTo(passwordView.pwTextViewOne.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(355)
        }
        passwordView.labelStackView.snp.makeConstraints {
            $0.leading.equalTo(safeArea.snp.leading).inset(20)
            $0.trailing.equalTo(safeArea.snp.trailing).inset(143)
            $0.top.equalTo(passwordView.pwTextViewOne.snp.bottom).offset(8)
            $0.height.equalTo(24)
        }
        passwordView.possibleUseLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordView.labelStackView.snp.top)
            make.leading.equalTo(safeArea.snp.leading).inset(20)
            make.height.equalTo(17)
        }
        passwordView.notAccordLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordView.pwTextViewTwo.snp.bottom).offset(8)
            make.leading.equalTo(safeArea.snp.leading).inset(20)
            make.height.equalTo(17)
        }
        phoneView.phoneNumberView.snp.makeConstraints { make in
            make.top.equalTo(insertEmailLabelTwo.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(355)
        }
        phoneView.notAccordLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneView.phoneNumberView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(17)
        }
        phoneView.certificationView.snp.makeConstraints { make in
            make.top.equalTo(phoneView.phoneNumberView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(355)
        }
    }
    
    func addViews() {
        [insertEmailLabelOne, insertEmailLabelTwo].forEach {
            textView.addSubview($0)
        }
       
        
        [emailLabel, emailTextField, cancelButton, checkImageView].forEach {
            textFieldView.addSubview($0)
        }
    }
    
    func setBorderLine() {
        [textFieldView, signUpButton].forEach {
            $0.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 16
        }
        [passwordView.englishLabel, passwordView.numberLabel, passwordView.symbolLabel, passwordView.sixLabel].forEach {
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 12
            $0.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            $0.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        }
    }
}
