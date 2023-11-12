import UIKit
import SnapKit
import Shared
import FeatureSignInInterface

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
    let specialLabel = UILabel()
    let sixLabel = UILabel()
    let pwTextViewTwo = UIView()
    let pwLabelTwo = UILabel()
    let pwTextFieldTwo = UITextField()
    let emailView = UIView()
    let emailLabel = UILabel()
    let emailTextField = UITextField()
    let signUpButton = UIButton()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setNavigationBar()
        setBackgroundColor()
        setTextContent()
        setTextSize()
        setTextColor()
        setStackView()
        setBorderLine()
        setProgressBar()
    }
    
    func addViews() {
        [progressBar, guideLabelOne, guideLabelTwo, pwTextViewOne ,labelStackView, pwTextViewTwo ,signUpButton, emailView].forEach {
            view.addSubview($0)
        }
        
        [pwLabelOne, pwTextFieldOne].forEach {
            pwTextViewOne.addSubview($0)
        }
        
        [englishLabel, numberLabel, specialLabel, sixLabel].forEach {
            labelStackView.addArrangedSubview($0)
        }
        
        [pwLabelTwo, pwTextFieldTwo].forEach {
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
    }
    
    func setTextContent() {
        guideLabelOne.text = "비밀번호를 입력해주세요"
        guideLabelTwo.text = "영문, 숫자, 특수문자를 포함한 6자리 이상으로 설정해주세요"
        
        [pwLabelOne, pwLabelTwo].forEach {
            $0.text = "비밀번호"
        }

        pwTextFieldOne.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : CustomColor.gray30 ?? UIColor() ])
        pwTextFieldTwo.attributedPlaceholder = NSAttributedString(string: "비밀번호를 한번 더 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : CustomColor.gray30 ?? UIColor() ])
        emailLabel.text = "이메일"
        signUpButton.setTitle("가입하기", for: .normal)
        englishLabel.text = "영어"
        numberLabel.text = "숫자"
        specialLabel.text = "특수문자"
        sixLabel.text = "6자리 이상"
        emailTextField.text = "abc123@gma"
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
        
        [englishLabel, numberLabel, specialLabel, sixLabel].forEach {
            $0.font = .systemFont(ofSize: 12)
            $0.textAlignment = .center
        }
    }
    
    func setTextColor() {
        guideLabelTwo.textColor = CustomColor.text03
        signUpButton.setTitleColor(CustomColor.gray30, for: .normal)
        
        [pwLabelOne, pwLabelTwo, emailLabel].forEach {
            $0.textColor = CustomColor.gray80
        }
        
        [pwTextFieldOne, pwTextFieldTwo, emailTextField].forEach {
            $0.textColor = CustomColor.gray100
        }
        
        [englishLabel, numberLabel, specialLabel, sixLabel].forEach {
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
        
        [englishLabel, numberLabel, specialLabel, sixLabel].forEach {
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
}
