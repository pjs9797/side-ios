//
//  ForgotIdViewController.swift
//  FeatureSignIn
//
//  Created by 강민성 on 1/29/24.
//

import UIKit
import Shared
import Domain

import RxSwift
import RxCocoa
import RxFlow
import ReactorKit

public class ForgotIdViewController: BaseViewController, ReactorKit.View {
    
    public typealias Reactor = ForgotIdReactor
    
    let forgotIdView = ForgotIdView()
    
    public override func loadView() {
        super.loadView()
        view = forgotIdView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public override func configureUI() {
        super.configureUI()
        addBackButton()
        addNavigationTitleLabel("아이디 찾기")
        render()
    }
    
    init(with reactor: Reactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        forgotIdView.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(navigationBarArea.snp.bottom).offset(60)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(forgotIdView.findWithPhoneNumberButton.snp.top).offset(-40)
        }
        
        forgotIdView.findWithPhoneNumberButton.snp.makeConstraints { make in
            make.top.equalTo(forgotIdView.titleLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(105)
        }
        
        forgotIdView.findWithEmailButton.snp.makeConstraints { make in
            make.top.equalTo(forgotIdView.findWithPhoneNumberButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(105)
        }
    }
}

extension ForgotIdViewController {
    public func bind(reactor: ForgotIdReactor) {
        backButton.rx.tap
            .map { Reactor.Action.didbackButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        forgotIdView.findWithEmailButton.rx.tap
            .map { Reactor.Action.didFindWithEmailButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        forgotIdView.findWithPhoneNumberButton.rx.tap
            .map { Reactor.Action.didFindWithPhoneNumberTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}
