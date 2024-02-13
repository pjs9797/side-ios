//
//  PasswordVerificateWithPhoneNumberViewController.swift
//  FeatureSignIn
//
//  Created by 강민성 on 2/4/24.
//

import UIKit
import Shared
import Domain

import RxSwift
import RxCocoa
import RxFlow
import ReactorKit
import RxKeyboard
import AnyFormatKit

public class PasswordVerificateWithPhoneNumberViewController: BaseViewController, ReactorKit.View, UITextFieldDelegate {
    
    public typealias Reactor = PasswordVerificateWithPhoneNumberReactor
    
    let passwordVerificateWithPhoneNumberView = PasswordVerificateWithPhoneNumberView()
    
    let timerView: UILabel = {
        let label = UILabel()
        label.textColor = SharedDSKitAsset.Colors.green.color
        label.font = Fonts.Caption.font
        label.textAlignment = .right
        
        return label
    }()
    
    let okImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark")
        imageView.tintColor = SharedDSKitAsset.Colors.green.color
        
        return imageView
    }()
    
    public override func loadView() {
        super.loadView()
        view = passwordVerificateWithPhoneNumberView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        render()
    }
    
    init(with reactor: Reactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    public override func configureUI() {
        super.configureUI()
        addBackButton()
        addNavigationTitleLabel("아이디 찾기")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.inputViewErrorLabel.isHidden = true
        passwordVerificateWithPhoneNumberView.verificationNumberInputView.isHidden = true
        
        passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.verificationInputViewTextField.delegate = self
    }
    
    private func render() {
        passwordVerificateWithPhoneNumberView.verificationNumberInputView.inputViewTextField.leftView = okImageView
        passwordVerificateWithPhoneNumberView.verificationNumberInputView.inputViewTextField.leftView?.isHidden = true
        passwordVerificateWithPhoneNumberView.verificationNumberInputView.inputViewTextField.rightView = timerView
        
        passwordVerificateWithPhoneNumberView.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(navigationBarArea.snp.bottom).offset(60)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(68)
        }
        
        passwordVerificateWithPhoneNumberView.descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordVerificateWithPhoneNumberView.titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(48)
        }
        
        passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.snp.makeConstraints { make in
            make.top.equalTo(passwordVerificateWithPhoneNumberView.descriptionLabel.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        passwordVerificateWithPhoneNumberView.verificationNumberInputView.snp.makeConstraints { make in
            make.top.equalTo(passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        passwordVerificateWithPhoneNumberView.verificationCompletedButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(52)
        }
    }
    
    func formatPhoneNumber(_ text: String?) -> String {
        guard let text = text else { return "" }
        
        // 숫자만 추출
        let numbersOnly = text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        var formattedText = ""
        
        // 첫 번째 그룹 (000)
        if numbersOnly.count > 0 {
            formattedText.append(contentsOf: numbersOnly.prefix(3))
        }
        
        // 자동으로 "-" 추가
        if numbersOnly.count > 3 {
            formattedText.append("-")
        }
        
        // 두 번째 그룹 (0000)
        if numbersOnly.count > 3 {
            let startIndex = numbersOnly.index(numbersOnly.startIndex, offsetBy: 3)
            if numbersOnly.count > 7 {
                formattedText.append(contentsOf: numbersOnly[startIndex..<numbersOnly.index(startIndex, offsetBy: 4)])
                formattedText.append("-")
            } else {
                formattedText.append(contentsOf: numbersOnly[startIndex...])
                return formattedText
            }
        }
        
        // 세 번째 그룹 (0000)
        if numbersOnly.count > 7 {
                let startIndex = numbersOnly.index(numbersOnly.startIndex, offsetBy: 7)
                let endIndex = numbersOnly.index(startIndex, offsetBy: min(6, numbersOnly.count - 7))
                formattedText.append(contentsOf: numbersOnly[startIndex..<endIndex])
            }
        
        return formattedText
    }
}

extension PasswordVerificateWithPhoneNumberViewController {
    public func bind(reactor: PasswordVerificateWithPhoneNumberReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: PasswordVerificateWithPhoneNumberReactor) {
        backButton.rx.tap
            .map { Reactor.Action.didBackButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.verificationInputViewTextField.rx.text
            .orEmpty
            .map { Reactor.Action.writePhoneNumber($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.verificationInputViewTextField.rx.text
            .withUnretained(self)
            .subscribe(onNext: { viewController, text in
                viewController.passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.verificationInputViewTextField.text = viewController.formatPhoneNumber(text)
            })
            .disposed(by: disposeBag)
        
        passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.verificateButton.rx
            .tap
            .map { Reactor.Action.didTapRequestVerificationNumberButton }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        passwordVerificateWithPhoneNumberView.verificationNumberInputView.inputViewTextField.rx.text
            .orEmpty
            .map { Reactor.Action.writeVerificationNumber($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        passwordVerificateWithPhoneNumberView.verificationCompletedButton.rx.tap
            .map { Reactor.Action.didTapVerificateNumberButton }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: PasswordVerificateWithPhoneNumberReactor) {
        reactor.state.map { $0.isStartTimer }
            .withUnretained(self)
            .subscribe(onNext: { viewController, start in
                if start {
                    viewController.passwordVerificateWithPhoneNumberView.verificationNumberInputView.isHidden = false
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.phoneNumber }
            .bind(to: passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.verificationInputViewTextField.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isVerificationComplete }
            .bind(to: passwordVerificateWithPhoneNumberView.verificationCompletedButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.timerTime == 0 }
            .bind(to: passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.verificateButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.timerString }
            .bind(to: timerView.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isIncorrectFormedPhoneNumber }
            .withUnretained(self)
            .subscribe(onNext: { viewController, error in
                if !error {
                    viewController.passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.verificationInputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    viewController.passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.verificateButton.layer.borderColor = SharedDSKitAsset.Colors.gr50.color.cgColor
                    viewController.passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.verificationInputViewTextField.leftView?.isHidden = true
                } else {
                    viewController.passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.verificationInputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
                    viewController.passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.inputViewErrorLabel.text = "올바른 전화번호를 입력해 주세요."
                    viewController.passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.verificationInputViewTextField.leftView?.isHidden = false
                    viewController.passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.verificateButton.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                    viewController.passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.verificateButton.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                }
                viewController.passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.verificateButton.isEnabled = !error
                viewController.passwordVerificateWithPhoneNumberView.phoneNumberVerificateInputView.inputViewErrorLabel.isHidden = !error
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isVerificationComplete }
            .withUnretained(self)
            .subscribe(onNext: { viewController, complete in
                if complete {
                    viewController.passwordVerificateWithPhoneNumberView.verificationNumberInputView.inputViewTextField.rightView?.isHidden = true
                    viewController.passwordVerificateWithPhoneNumberView.verificationNumberInputView.inputViewTextField.leftView?.isHidden = false
                    viewController.passwordVerificateWithPhoneNumberView.verificationNumberInputView.inputViewErrorLabel.text = "인증이 완료 되었습니다."
                    viewController.passwordVerificateWithPhoneNumberView.verificationNumberInputView.inputViewErrorLabel.textColor = SharedDSKitAsset.Colors.green.color
                    viewController.passwordVerificateWithPhoneNumberView.verificationCompletedButton.backgroundColor = SharedDSKitAsset.Colors.green.color
                }
                else {
                    viewController.passwordVerificateWithPhoneNumberView.verificationCompletedButton.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                }
            })
            .disposed(by: disposeBag)
    }
}
