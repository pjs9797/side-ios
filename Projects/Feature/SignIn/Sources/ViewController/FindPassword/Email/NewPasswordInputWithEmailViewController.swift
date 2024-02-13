//
//  NewPasswordInputWithEmailViewController.swift
//  FeatureSignIn
//
//  Created by 강민성 on 2/4/24.
//

import UIKit
import Shared
import Domain

import RxSwift
import RxCocoa
import ReactorKit
import RxFlow

public class NewPasswordInputWithEmailViewController: BaseViewController, ReactorKit.View {
    
    public typealias Reactor = NewPasswordInputWithEmailReactor
    
    let newPasswordInputWithEmailView = NewPasswordInputWithEmailView()
    
    var errorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "exclamationmark.circle.fill")
        imageView.tintColor = SharedDSKitAsset.Colors.red.color
        
        return imageView
    }()
    
    let okImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "checkmark")
        imageView.tintColor = SharedDSKitAsset.Colors.green.color
        
        return imageView
    }()
    
    public override func loadView() {
        super.loadView()
        view = newPasswordInputWithEmailView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        render()
        setUp()
    }
    
    init(with reactor: Reactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func configureUI() {
        super.configureUI()
        addBackButton()
        addNavigationTitleLabel("비밀번호 찾기")
    }
    
    private func setUp() {
        newPasswordInputWithEmailView.passwordInputView.inputViewTextField.isSecureTextEntry = true
        newPasswordInputWithEmailView.passwordConfirmInputView.inputViewTextField.isSecureTextEntry = true
        newPasswordInputWithEmailView.passwordInputView.inputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        newPasswordInputWithEmailView.passwordInputView.inputViewTextField.rightView?.isHidden = true
        newPasswordInputWithEmailView.passwordConfirmInputView.inputViewTextField.rightView?.isHidden = true
        newPasswordInputWithEmailView.passwordInputView.inputViewTextField.clearButtonMode = .whileEditing
        newPasswordInputWithEmailView.passwordInputView.labelStackView.isHidden = false
        newPasswordInputWithEmailView.changePasswordCompleteButton.isEnabled = false
        newPasswordInputWithEmailView.changePasswordCompleteButton.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
    }
    
    private func render() {
        newPasswordInputWithEmailView.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(navigationBarArea.snp.bottom).offset(60)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(34)
        }
        
        newPasswordInputWithEmailView.passwordInputView.snp.makeConstraints { make in
            make.top.equalTo(newPasswordInputWithEmailView.titleLabel.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        newPasswordInputWithEmailView.passwordConfirmInputView.snp.makeConstraints { make in
            make.top.equalTo(newPasswordInputWithEmailView.passwordInputView.snp.bottom).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        newPasswordInputWithEmailView.changePasswordCompleteButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(52)
        }
    }
}

extension NewPasswordInputWithEmailViewController {
    public func bind(reactor: NewPasswordInputWithEmailReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: NewPasswordInputWithEmailReactor) {
        backButton.rx.tap
            .map { Reactor.Action.didBackButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        newPasswordInputWithEmailView.passwordInputView.inputViewTextField.rx.text
            .orEmpty
            .map { Reactor.Action.writePassword($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        newPasswordInputWithEmailView.passwordConfirmInputView.inputViewTextField.rx.text
            .orEmpty
            .map { Reactor.Action.writeConfirmPassword($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        newPasswordInputWithEmailView.changePasswordCompleteButton.rx.tap
            .map { Reactor.Action.didTapChangePasswordCompleteButton }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: NewPasswordInputWithEmailReactor) {
        reactor.state.compactMap { $0.isIncorrectFormedPassword }
            .withUnretained(self)
            .subscribe(onNext: { viewController, error in
                if !error {
                    // 조건 모두 통과
                    viewController.newPasswordInputWithEmailView.passwordInputView.inputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    viewController.newPasswordInputWithEmailView.passwordInputView.inputViewErrorLabel.textColor = SharedDSKitAsset.Colors.green.color
                    viewController.newPasswordInputWithEmailView.passwordInputView.labelStackView.isHidden = true
                    viewController.newPasswordInputWithEmailView.passwordInputView.inputViewErrorLabel.text = "사용할 수 있는 비밃번호입니다."
                    viewController.newPasswordInputWithEmailView.passwordInputView.inputViewErrorLabel.isHidden = false
                    viewController.newPasswordInputWithEmailView.passwordInputView.inputViewTextField.rightView = viewController.okImageView
                    viewController.newPasswordInputWithEmailView.passwordInputView.inputViewTextField.rightView?.isHidden = false
                }
                else {
                    viewController.newPasswordInputWithEmailView.passwordInputView.inputViewErrorLabel.isHidden = true
                    viewController.newPasswordInputWithEmailView.passwordInputView.labelStackView.isHidden = false
                    viewController.newPasswordInputWithEmailView.passwordInputView.inputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
                    viewController.newPasswordInputWithEmailView.passwordInputView.inputViewTextField.rightView = viewController.errorImageView
                    viewController.newPasswordInputWithEmailView.passwordInputView.inputViewTextField.rightView?.isHidden = false
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.compactMap { $0.isIncorrectFormedConfirmPassword }
            .distinctUntilChanged()
            .withUnretained(self)
            .subscribe(onNext: { viewController, error in
                if !error {
                    viewController.newPasswordInputWithEmailView.passwordConfirmInputView.inputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    viewController.newPasswordInputWithEmailView.passwordConfirmInputView.inputViewErrorLabel.textColor = SharedDSKitAsset.Colors.green.color
                    viewController.newPasswordInputWithEmailView.passwordConfirmInputView.inputViewErrorLabel.isHidden = true
                    viewController.newPasswordInputWithEmailView.passwordConfirmInputView.inputViewTextField.rightView = viewController.newPasswordInputWithEmailView.passwordConfirmInputView.inputViewTextField.okImageView
                    viewController.newPasswordInputWithEmailView.passwordConfirmInputView.inputViewTextField.rightView?.isHidden = false
                }
                else {
                    viewController.newPasswordInputWithEmailView.passwordConfirmInputView.inputViewErrorLabel.isHidden = false
                    viewController.newPasswordInputWithEmailView.passwordConfirmInputView.inputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
                    viewController.newPasswordInputWithEmailView.passwordConfirmInputView.inputViewErrorLabel.text = "비밀번호가 일치하지 않습니다."
                    viewController.newPasswordInputWithEmailView.passwordConfirmInputView.inputViewErrorLabel.textColor = SharedDSKitAsset.Colors.red.color
                    viewController.newPasswordInputWithEmailView.passwordConfirmInputView.inputViewTextField.rightView = viewController.errorImageView
                    viewController.newPasswordInputWithEmailView.passwordConfirmInputView.inputViewTextField.rightView?.isHidden = false
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isCompleteEnable }
            .distinctUntilChanged()
            .withUnretained(self)
            .subscribe(onNext: { viewController, enable in
                if enable {
                    viewController.newPasswordInputWithEmailView.passwordInputView.inputViewErrorLabel.isHidden = true
                    viewController.newPasswordInputWithEmailView.changePasswordCompleteButton.isEnabled = true
                    viewController.newPasswordInputWithEmailView.changePasswordCompleteButton.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
                }
                else {
                    viewController.newPasswordInputWithEmailView.passwordInputView.inputViewErrorLabel.isHidden = false
                    viewController.newPasswordInputWithEmailView.changePasswordCompleteButton.isEnabled = false
                    viewController.newPasswordInputWithEmailView.changePasswordCompleteButton.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPasswordContainsNumber }
            .withUnretained(self)
            .subscribe(onNext: { viewController, contains in
                if contains {
                    viewController.newPasswordInputWithEmailView.passwordInputView.numberLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
                    viewController.newPasswordInputWithEmailView.passwordInputView.numberLabel.textColor = SharedDSKitAsset.Colors.green.color
                    viewController.newPasswordInputWithEmailView.passwordInputView.numberLabel.backgroundColor = .white
                }
                else {
                    viewController.newPasswordInputWithEmailView.passwordInputView.numberLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    viewController.newPasswordInputWithEmailView.passwordInputView.numberLabel.textColor = SharedDSKitAsset.Colors.text03.color
                    viewController.newPasswordInputWithEmailView.passwordInputView.numberLabel.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPasswordContainsSymbol }
            .withUnretained(self)
            .subscribe(onNext: { viewController, contains in
                if contains {
                    viewController.newPasswordInputWithEmailView.passwordInputView.symbolLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
                    viewController.newPasswordInputWithEmailView.passwordInputView.symbolLabel.textColor = SharedDSKitAsset.Colors.green.color
                    viewController.newPasswordInputWithEmailView.passwordInputView.symbolLabel.backgroundColor = .white
                }
                else {
                    viewController.newPasswordInputWithEmailView.passwordInputView.symbolLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    viewController.newPasswordInputWithEmailView.passwordInputView.symbolLabel.textColor = SharedDSKitAsset.Colors.text03.color
                    viewController.newPasswordInputWithEmailView.passwordInputView.symbolLabel.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPasswordContainsEnglish }
            .withUnretained(self)
            .subscribe(onNext: { viewController, contains in
                if contains {
                    viewController.newPasswordInputWithEmailView.passwordInputView.englishLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
                    viewController.newPasswordInputWithEmailView.passwordInputView.englishLabel.textColor = SharedDSKitAsset.Colors.green.color
                    viewController.newPasswordInputWithEmailView.passwordInputView.englishLabel.backgroundColor = .white
                }
                else {
                    viewController.newPasswordInputWithEmailView.passwordInputView.englishLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    viewController.newPasswordInputWithEmailView.passwordInputView.englishLabel.textColor = SharedDSKitAsset.Colors.text03.color
                    viewController.newPasswordInputWithEmailView.passwordInputView.englishLabel.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPasswordLengthIsMoreThanSix }
            .withUnretained(self)
            .subscribe(onNext: { viewController, more in
                if more {
                    viewController.newPasswordInputWithEmailView.passwordInputView.sixLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
                    viewController.newPasswordInputWithEmailView.passwordInputView.sixLabel.textColor = SharedDSKitAsset.Colors.green.color
                    viewController.newPasswordInputWithEmailView.passwordInputView.sixLabel.backgroundColor = .white
                }
                else {
                    viewController.newPasswordInputWithEmailView.passwordInputView.sixLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    viewController.newPasswordInputWithEmailView.passwordInputView.sixLabel.textColor = SharedDSKitAsset.Colors.text03.color
                    viewController.newPasswordInputWithEmailView.passwordInputView.sixLabel.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.shouldPushCompleteView }
            .withUnretained(self)
            .bind { viewController, push in
                if push {
                    
                }
            }
    }
}

