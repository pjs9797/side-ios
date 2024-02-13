//
//  NewPasswordInputWithPhoneNumberViewController.swift
//  FeatureSignIn
//
//  Created by 강민성 on 2/9/24.
//

import UIKit
import Shared
import Domain

import RxSwift
import RxCocoa
import ReactorKit
import RxFlow

public class NewPasswordInputWithPhoneNumberViewController: BaseViewController, ReactorKit.View {
    
    public typealias Reactor = NewPasswordInputWithPhoneNumberReactor
    
    let newPasswordInputWithPhoneNumberView = NewPasswordInputWithPhoneNumberView()
    
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
        view = newPasswordInputWithPhoneNumberView
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
        newPasswordInputWithPhoneNumberView.passwordInputView.inputViewTextField.isSecureTextEntry = true
        newPasswordInputWithPhoneNumberView.passwordConfirmInputView.inputViewTextField.isSecureTextEntry = true
        newPasswordInputWithPhoneNumberView.passwordInputView.inputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        newPasswordInputWithPhoneNumberView.passwordInputView.inputViewTextField.rightView?.isHidden = true
        newPasswordInputWithPhoneNumberView.passwordConfirmInputView.inputViewTextField.rightView?.isHidden = true
        newPasswordInputWithPhoneNumberView.passwordInputView.inputViewTextField.clearButtonMode = .whileEditing
        newPasswordInputWithPhoneNumberView.passwordInputView.labelStackView.isHidden = false
        newPasswordInputWithPhoneNumberView.changePasswordCompleteButton.isEnabled = false
        newPasswordInputWithPhoneNumberView.changePasswordCompleteButton.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
    }
    
    private func render() {
        
        newPasswordInputWithPhoneNumberView.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(navigationBarArea.snp.bottom).offset(60)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(34)
        }
        
        newPasswordInputWithPhoneNumberView.passwordInputView.snp.makeConstraints { make in
            make.top.equalTo(newPasswordInputWithPhoneNumberView.titleLabel.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        newPasswordInputWithPhoneNumberView.passwordConfirmInputView.snp.makeConstraints { make in
            make.top.equalTo(newPasswordInputWithPhoneNumberView.passwordInputView.snp.bottom).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        newPasswordInputWithPhoneNumberView.changePasswordCompleteButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(52)
        }
    }
}

extension NewPasswordInputWithPhoneNumberViewController {
    public func bind(reactor: NewPasswordInputWithPhoneNumberReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: NewPasswordInputWithPhoneNumberReactor) {
        backButton.rx.tap
            .map { Reactor.Action.didBackButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        newPasswordInputWithPhoneNumberView.passwordInputView.inputViewTextField.rx.text
            .orEmpty
            .map { Reactor.Action.writePassword($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        newPasswordInputWithPhoneNumberView.passwordConfirmInputView.inputViewTextField.rx.text
            .orEmpty
            .map { Reactor.Action.writeConfirmPassword($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        newPasswordInputWithPhoneNumberView.changePasswordCompleteButton.rx.tap
            .map { Reactor.Action.didTapChangePasswordCompleteButton }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: NewPasswordInputWithPhoneNumberReactor) {
        reactor.state.compactMap { $0.isIncorrectFormedPassword }
            .withUnretained(self)
            .subscribe(onNext: { viewController, error in
                if !error {
                    // 조건 모두 통과
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.inputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.inputViewErrorLabel.textColor = SharedDSKitAsset.Colors.green.color
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.labelStackView.isHidden = true
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.inputViewErrorLabel.text = "사용할 수 있는 비밃번호입니다."
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.inputViewErrorLabel.isHidden = false
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.inputViewTextField.rightView = viewController.okImageView
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.inputViewTextField.rightView?.isHidden = false
                }
                else {
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.inputViewErrorLabel.isHidden = true
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.labelStackView.isHidden = false
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.inputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.inputViewTextField.rightView = viewController.errorImageView
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.inputViewTextField.rightView?.isHidden = false
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.compactMap { $0.isIncorrectFormedConfirmPassword }
            .distinctUntilChanged()
            .withUnretained(self)
            .subscribe(onNext: { viewController, error in
                if !error {
                    viewController.newPasswordInputWithPhoneNumberView.passwordConfirmInputView.inputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    viewController.newPasswordInputWithPhoneNumberView.passwordConfirmInputView.inputViewErrorLabel.textColor = SharedDSKitAsset.Colors.green.color
                    viewController.newPasswordInputWithPhoneNumberView.passwordConfirmInputView.inputViewErrorLabel.isHidden = true
                    viewController.newPasswordInputWithPhoneNumberView.passwordConfirmInputView.inputViewTextField.rightView = viewController.newPasswordInputWithPhoneNumberView.passwordConfirmInputView.inputViewTextField.okImageView
                    viewController.newPasswordInputWithPhoneNumberView.passwordConfirmInputView.inputViewTextField.rightView?.isHidden = false
                }
                else {
                    viewController.newPasswordInputWithPhoneNumberView.passwordConfirmInputView.inputViewErrorLabel.isHidden = false
                    viewController.newPasswordInputWithPhoneNumberView.passwordConfirmInputView.inputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
                    viewController.newPasswordInputWithPhoneNumberView.passwordConfirmInputView.inputViewErrorLabel.text = "비밀번호가 일치하지 않습니다."
                    viewController.newPasswordInputWithPhoneNumberView.passwordConfirmInputView.inputViewErrorLabel.textColor = SharedDSKitAsset.Colors.red.color
                    viewController.newPasswordInputWithPhoneNumberView.passwordConfirmInputView.inputViewTextField.rightView = viewController.errorImageView
                    viewController.newPasswordInputWithPhoneNumberView.passwordConfirmInputView.inputViewTextField.rightView?.isHidden = false
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isCompleteEnable }
            .distinctUntilChanged()
            .withUnretained(self)
            .subscribe(onNext: { viewController, enable in
                if enable {
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.inputViewErrorLabel.isHidden = true
                    viewController.newPasswordInputWithPhoneNumberView.changePasswordCompleteButton.isEnabled = true
                    viewController.newPasswordInputWithPhoneNumberView.changePasswordCompleteButton.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
                }
                else {
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.inputViewErrorLabel.isHidden = false
                    viewController.newPasswordInputWithPhoneNumberView.changePasswordCompleteButton.isEnabled = false
                    viewController.newPasswordInputWithPhoneNumberView.changePasswordCompleteButton.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPasswordContainsNumber }
            .withUnretained(self)
            .subscribe(onNext: { viewController, contains in
                if contains {
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.numberLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.numberLabel.textColor = SharedDSKitAsset.Colors.green.color
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.numberLabel.backgroundColor = .white
                }
                else {
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.numberLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.numberLabel.textColor = SharedDSKitAsset.Colors.text03.color
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.numberLabel.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPasswordContainsSymbol }
            .withUnretained(self)
            .subscribe(onNext: { viewController, contains in
                if contains {
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.symbolLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.symbolLabel.textColor = SharedDSKitAsset.Colors.green.color
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.symbolLabel.backgroundColor = .white
                }
                else {
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.symbolLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.symbolLabel.textColor = SharedDSKitAsset.Colors.text03.color
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.symbolLabel.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPasswordContainsEnglish }
            .withUnretained(self)
            .subscribe(onNext: { viewController, contains in
                if contains {
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.englishLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.englishLabel.textColor = SharedDSKitAsset.Colors.green.color
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.englishLabel.backgroundColor = .white
                }
                else {
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.englishLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.englishLabel.textColor = SharedDSKitAsset.Colors.text03.color
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.englishLabel.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPasswordLengthIsMoreThanSix }
            .withUnretained(self)
            .subscribe(onNext: { viewController, more in
                if more {
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.sixLabel.layer.borderColor = SharedDSKitAsset.Colors.green.color.cgColor
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.sixLabel.textColor = SharedDSKitAsset.Colors.green.color
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.sixLabel.backgroundColor = .white
                }
                else {
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.sixLabel.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.sixLabel.textColor = SharedDSKitAsset.Colors.text03.color
                    viewController.newPasswordInputWithPhoneNumberView.passwordInputView.sixLabel.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.shouldPushCompleteView }
            .withUnretained(self)
            .bind { viewController, push in
                if push {
                    
                }
            }
            .disposed(by: disposeBag)
    }
}

