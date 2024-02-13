//
//  ForgotPasswordViewController.swift
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

public class ForgotPasswordViewController: BaseViewController, ReactorKit.View {
    
    public typealias Reactor = ForgotPasswordReactor
    
    let forgotPasswordView = ForgotPasswordView()
    
    public override func loadView() {
        super.loadView()
        view = forgotPasswordView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        render()
    }
    
    public override func configureUI() {
        super.configureUI()
        addBackButton()
        addNavigationTitleLabel("비밀번호 찾기")
    }
    
    init(with reactor: Reactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        forgotPasswordView.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(navigationBarArea.snp.bottom).offset(60)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }
        
        forgotPasswordView.findWithPhoneNumberButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordView.titleLabel.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(20)
            make.bottom.equalTo(forgotPasswordView.findWithEmailButton.snp.top).offset(-16)
            make.height.equalTo(105)
        }
        
        forgotPasswordView.findWithEmailButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordView.findWithPhoneNumberButton.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(105)
        }
    }
}

extension ForgotPasswordViewController {
    public func bind(reactor: ForgotPasswordReactor) {
        backButton.rx.tap
            .map { Reactor.Action.didbackButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        forgotPasswordView.findWithEmailButton.rx.tap
            .map { Reactor.Action.didFindWithEmailButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        forgotPasswordView.findWithPhoneNumberButton.rx.tap
            .map { Reactor.Action.didFindWithPhoneNumberTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}
