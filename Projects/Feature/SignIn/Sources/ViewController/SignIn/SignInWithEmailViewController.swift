//
//  SignInWithEmailViewController.swift
//  FeatureSignInInterface
//
//  Created by 강민성 on 1/21/24.
//

import UIKit
import Shared
import Domain

import RxSwift
import RxCocoa
import RxFlow
import ReactorKit

public class SignInWithEmailViewController: BaseViewController, ReactorKit.View {
    
    public typealias Reactor = SignInWithEmailReactor
    
    let signInWithEmailView = SignInWithEmailView()
    
    public override func loadView() {
        super.loadView()
        view = signInWithEmailView
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
        addNavigationTitleLabel("로그인")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        signInWithEmailView.emailInputView.inputViewTextField.rightView?.isHidden = true
        signInWithEmailView.emailInputView.inputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        signInWithEmailView.emailInputView.inputViewErrorLabel.isHidden = true
        
        signInWithEmailView.passwordInputView.inputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        signInWithEmailView.passwordInputView.inputViewErrorLabel.isHidden = true
        signInWithEmailView.passwordInputView.inputViewTextField.rightView?.isHidden = true
        
    }
    
    private func render() {
        signInWithEmailView.emailInputView.snp.makeConstraints { make in
            make.top.equalTo(navigationBarArea.snp.bottom).offset(60)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(81)
        }
        
        signInWithEmailView.passwordInputView.snp.makeConstraints { make in
            make.top.equalTo(signInWithEmailView.emailInputView.snp.bottom).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(98)
        }
        
        signInWithEmailView.signInButton.snp.makeConstraints { make in
            make.top.equalTo(signInWithEmailView.passwordInputView.snp.bottom).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(52)
        }
        
        signInWithEmailView.forgotIdButton.snp.makeConstraints { make in
            make.top.equalTo(signInWithEmailView.signInButton.snp.bottom).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(95.5)
            make.height.equalTo(24)
        }
        
        signInWithEmailView.forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(signInWithEmailView.signInButton.snp.bottom).offset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-95.5)
            make.height.equalTo(24)
        }
    }
}

extension SignInWithEmailViewController {
    public func bind(reactor: SignInWithEmailReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: SignInWithEmailReactor) {
        backButton.rx.tap
            .map { Reactor.Action.didBackbuttonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        signInWithEmailView.emailInputView.inputViewTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .map { Reactor.Action.writeEmail($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        signInWithEmailView.passwordInputView.inputViewTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .map { Reactor.Action.writePassword($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        signInWithEmailView.forgotIdButton.rx.tap
            .map { Reactor.Action.didForgotEmailButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        signInWithEmailView.forgotPasswordButton.rx.tap
            .map { Reactor.Action.didForgotPasswordButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        signInWithEmailView.signInButton.rx.tap
            .map { Reactor.Action.didSignInButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: SignInWithEmailReactor) {
        reactor.state.map { $0.email }
            .bind(to: signInWithEmailView.emailInputView.inputViewTextField.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.password }
            .bind(to: signInWithEmailView.passwordInputView.inputViewTextField.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isSignInEnable }
            .bind(to: signInWithEmailView.signInButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
//        reactor.state.map { $0.incorrectEmailOrPassword }
//            .withUnretained(self)
//            .subscribe(onNext: { viewController, error in
//                if error {
//                    viewController.signInWithEmailView.passwordInputView.inputViewErrorLabel.isHidden = false
//                }
//            })
//            .disposed(by: disposeBag)
        
//            .withUnretained(self)
//            .subscribe(onNext: { viewController, error in
//                viewController.signInWithEmailView.passwordInputView.inputViewErrorLabel.text = "아이디 또는 비밀번호가 올바르지 않습니다.\n입력한 내용을 다시 확인해 주세요."
//                viewController.signInWithEmailView.passwordInputView.inputViewErrorLabel.isHidden = !error
//            })
//            .disposed(by: disposeBag)
        
        reactor.state.compactMap { $0.isIncorrectFormedEmail }
            .withUnretained(self)
            .subscribe(onNext: { viewController, error in
                if !error {
                    viewController.signInWithEmailView.emailInputView.inputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                } else {
                    viewController.signInWithEmailView.emailInputView.inputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
                }
                viewController.signInWithEmailView.emailInputView.inputViewErrorLabel.text = "올바른 이메일 주소를 입력해 주세요."
                viewController.signInWithEmailView.emailInputView.inputViewTextField.rightView?.isHidden = !error
                viewController.signInWithEmailView.emailInputView.inputViewErrorLabel.isHidden = !error
            })
            .disposed(by: disposeBag)
        
        reactor.state.compactMap { $0.isIncorrectFormedPassword }
//            .distinctUntilChanged()
            .withUnretained(self)
            .subscribe(onNext: { viewController, error in
                if !error {
                    viewController.signInWithEmailView.passwordInputView.inputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    viewController.signInWithEmailView.passwordInputView.inputViewTextField.rightView?.isHidden = true
                    viewController.signInWithEmailView.passwordInputView.inputViewErrorLabel.isHidden = true
                } else {
                    viewController.signInWithEmailView.passwordInputView.inputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
                    viewController.signInWithEmailView.passwordInputView.inputViewErrorLabel.text = "올바른 비밀번호를 입력해주세요."
                    viewController.signInWithEmailView.passwordInputView.inputViewTextField.rightView?.isHidden = false
                    viewController.signInWithEmailView.passwordInputView.inputViewErrorLabel.isHidden = false
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.signInFailMessage }
            .distinctUntilChanged()
            .withUnretained(self)
            .subscribe(onNext: { viewController, message in
                viewController.signInWithEmailView.passwordInputView.inputViewErrorLabel.isHidden = false
                viewController.signInWithEmailView.passwordInputView.inputViewErrorLabel.text = message
            })
            .disposed(by: disposeBag)
    }
}
