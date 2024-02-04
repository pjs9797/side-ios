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
    
    public override func loadView() {
        super.loadView()
        view = newPasswordInputWithEmailView
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func configureUI() {
        super.configureUI()
        addBackButton()
        addNavigationTitleLabel("비밀번호 찾기")
    }
    
    private func setUp() {
        newPasswordInputWithEmailView.passwordInputView.inputViewTextField.rightView?.isHidden = true
        newPasswordInputWithEmailView.passwordInputView.inputViewTextField.clearButtonMode = .whileEditing
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
            make.height.equalTo(81)
        }
        
        newPasswordInputWithEmailView.passwordConfirmInputView.snp.makeConstraints { make in
            make.top.equalTo(newPasswordInputWithEmailView.passwordInputView.snp.bottom).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(81)
        }
    }
}

extension NewPasswordInputWithEmailViewController {
    public func bind(reactor: NewPasswordInputWithEmailReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: NewPasswordInputWithEmailReactor) {
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
        reactor.state.map { $0.isIncorrectFormedPassword }
            .subscribe(onNext: { [weak self] error in
                if !error {
                    // 조건 모두 통과
                    self?.newPasswordInputWithEmailView.passwordInputView.inputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    self?.newPasswordInputWithEmailView.passwordInputView
                })
            }
    }
}
