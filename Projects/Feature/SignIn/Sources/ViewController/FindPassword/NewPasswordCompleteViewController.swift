//
//  NewPasswordCompleteVIewController.swift
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

public class NewPasswordCompleteViewController: BaseViewController, ReactorKit.View {
    
    public typealias Reactor = NewPasswordCompleteRactor
    
    let newPasswordCompleteView = NewPasswordCompleteView()
    
    public override func loadView() {
        super.loadView()
        view = newPasswordCompleteView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        render()
    }
    
    public override func configureUI() {
        super.configureUI()
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
        newPasswordCompleteView.okImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(navigationBarArea.snp.bottom).offset(237)
        }
        
        newPasswordCompleteView.label.snp.makeConstraints { make in
            make.top.equalTo(newPasswordCompleteView.okImageView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        
        newPasswordCompleteView.button.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(52)
        }
    }
}

extension NewPasswordCompleteViewController {
    public func bind(reactor: NewPasswordCompleteRactor) {
        bindAction(reactor: reactor)
    }
    
    private func bindAction(reactor: NewPasswordCompleteRactor) {
        newPasswordCompleteView.button.rx.tap
            .map { Reactor.Action.didGoBackToSignInButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}
