//
//  PasswordVerificateWithEmailViewController.swift
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

public class PasswordVerificateWithEmailViewController: BaseViewController, ReactorKit.View {
    
    public typealias Reactor = PasswordVerificateWithEmailReactor
    
    let passwordVerificateWithEmailView = PasswordVerificateWithEmailView()
    
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
        view = passwordVerificateWithEmailView
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
        addNavigationTitleLabel("비밀번호 찾기")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        passwordVerificateWithEmailView.emailVerificateInputView.inputViewErrorLabel.isHidden = true
        passwordVerificateWithEmailView.verificationNumberInputView.isHidden = true
    }
    
    private func render() {
        passwordVerificateWithEmailView.verificationNumberInputView.inputViewTextField.leftView = okImageView
        passwordVerificateWithEmailView.verificationNumberInputView.inputViewTextField.leftView?.isHidden = true
        passwordVerificateWithEmailView.verificationNumberInputView.inputViewTextField.rightView = timerView
        
        passwordVerificateWithEmailView.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(navigationBarArea.snp.bottom).offset(60)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(68)
        }
        
        passwordVerificateWithEmailView.emailVerificateInputView.snp.makeConstraints { make in
            make.top.equalTo(passwordVerificateWithEmailView.titleLabel.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        passwordVerificateWithEmailView.verificationNumberInputView.snp.makeConstraints { make in
            make.top.equalTo(passwordVerificateWithEmailView.emailVerificateInputView.snp.bottom).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        passwordVerificateWithEmailView.verificationCompletedButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(52)
        }
    }
}

extension PasswordVerificateWithEmailViewController {
    public func bind(reactor: PasswordVerificateWithEmailReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: PasswordVerificateWithEmailReactor) {
        backButton.rx.tap
            .map { Reactor.Action.didBackButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        passwordVerificateWithEmailView.emailVerificateInputView.verificationInputViewTextField.rx.text
            .orEmpty
            .map { Reactor.Action.writeEmail($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        passwordVerificateWithEmailView.emailVerificateInputView.verificateButton.rx
            .tap
            .map { Reactor.Action.didTapRequestVerificationNumberButton }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        passwordVerificateWithEmailView.verificationNumberInputView.inputViewTextField.rx.text
            .orEmpty
            .map { Reactor.Action.writeVerificationCode($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        passwordVerificateWithEmailView.verificationCompletedButton.rx
            .tap
            .map { Reactor.Action.didTapVerificateCompleteButton }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
    }
    
    private func bindState(reactor: PasswordVerificateWithEmailReactor) {
        reactor.state.map { $0.isStartTimer }
            .withUnretained(self)
            .subscribe(onNext: { viewController, start in
                if start {
                    viewController.passwordVerificateWithEmailView.verificationNumberInputView.isHidden = false
                    viewController.passwordVerificateWithEmailView.emailVerificateInputView.verificateButton.setTitle("재인증", for: .normal)
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.timerTime == 0 }
            .bind(to: passwordVerificateWithEmailView.emailVerificateInputView.verificateButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.timerString }
            .bind(to: timerView.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.compactMap { $0.isIncorrectFormedEmail }
            .distinctUntilChanged()
            .withUnretained(self)
            .subscribe(onNext: { viewController, error in
                if !error {
                    viewController.passwordVerificateWithEmailView.emailVerificateInputView.verificationInputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    viewController.passwordVerificateWithEmailView.emailVerificateInputView.verificateButton.layer.borderColor = SharedDSKitAsset.Colors.gr50.color.cgColor
                    viewController.passwordVerificateWithEmailView.emailVerificateInputView.verificationInputViewTextField.leftView?.isHidden = true
                } else {
                    viewController.passwordVerificateWithEmailView.emailVerificateInputView.verificationInputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
                    viewController.passwordVerificateWithEmailView.emailVerificateInputView.inputViewErrorLabel.text = "올바른 이메일 주소를 입력해 주세요."
                    viewController.passwordVerificateWithEmailView.emailVerificateInputView.verificationInputViewTextField.leftView?.isHidden = false
                    viewController.passwordVerificateWithEmailView.emailVerificateInputView.verificateButton.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                }
                viewController.passwordVerificateWithEmailView.emailVerificateInputView.verificateButton.isEnabled = !error
                viewController.passwordVerificateWithEmailView.emailVerificateInputView.inputViewErrorLabel.isHidden = !error
            })
            .disposed(by: disposeBag)
        
        reactor.state.compactMap { $0.isVerificationComplete }
            .distinctUntilChanged()
            .withUnretained(self)
            .subscribe(onNext: { viewController, complete in
                if complete {
                    viewController.passwordVerificateWithEmailView.verificationNumberInputView.inputViewTextField.rightView?.isHidden = true
                    viewController.passwordVerificateWithEmailView.verificationNumberInputView.inputViewTextField.leftView?.isHidden = false
                    viewController.passwordVerificateWithEmailView.verificationNumberInputView.inputViewErrorLabel.textColor = SharedDSKitAsset.Colors.green.color
                    viewController.passwordVerificateWithEmailView.verificationCompletedButton.backgroundColor = SharedDSKitAsset.Colors.green.color
                    viewController.passwordVerificateWithEmailView.verificationCompletedButton.isEnabled = true
                }
                else {
                    viewController.passwordVerificateWithEmailView.verificationNumberInputView.inputViewTextField.rightView?.isHidden = false
                    viewController.passwordVerificateWithEmailView.verificationNumberInputView.inputViewTextField.leftView?.isHidden = true
                    viewController.passwordVerificateWithEmailView.verificationNumberInputView.inputViewErrorLabel.text = "인증코드를 입력해주세요."
                    viewController.passwordVerificateWithEmailView.verificationNumberInputView.inputViewErrorLabel.textColor = SharedDSKitAsset.Colors.text03.color
                    viewController.passwordVerificateWithEmailView.verificationCompletedButton.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                    viewController.passwordVerificateWithEmailView.verificationCompletedButton.isEnabled = false
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isIncorrectVerificationCode }
            .withUnretained(self)
            .subscribe(onNext: { viewController, error in
                if error {
                    viewController.passwordVerificateWithEmailView.verificationNumberInputView.inputViewErrorLabel.text = "인증코드가 올바르지 않습니다. 다시 확인해주세요."
                    viewController.passwordVerificateWithEmailView.verificationNumberInputView.inputViewErrorLabel.textColor = SharedDSKitAsset.Colors.red.color
                }
            })
            .disposed(by: disposeBag)
    }
}
