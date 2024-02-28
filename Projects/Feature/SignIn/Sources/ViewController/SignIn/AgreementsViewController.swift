//
//  AgreementsViewController.swift
//  FeatureSignIn
//
//  Created by 강민성 on 1/14/24.
//

import UIKit
import Shared
import Domain

import RxSwift
import RxCocoa
import ReactorKit

public class AgreementsViewController: UIViewController, ReactorKit.View {
    
    public typealias Reactor = AgreementsReactor
    
    public var disposeBag = DisposeBag()
    
    var agreementsView = AgreementsView()
    
    public override func loadView() {
        super.loadView()
        view = agreementsView
    }
    
    init(with reactor: Reactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AgreementsViewController {
    public func bind(reactor: AgreementsReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: AgreementsReactor) {
        agreementsView.agreeAllCheckboxView.enabledCheckboxButton.rx.tap
            .map { Reactor.Action.agreementButtonTapped(.agreeAll) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        agreementsView.checkbox1.enabledCheckboxButton.rx.tap
            .map { Reactor.Action.agreementButtonTapped(.checkedFirst) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        agreementsView.checkbox2.enabledCheckboxButton.rx.tap
            .map { Reactor.Action.agreementButtonTapped(.checkedSecond) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        agreementsView.checkbox3.enabledCheckboxButton.rx.tap
            .map { Reactor.Action.agreementButtonTapped(.checkedThird) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        agreementsView.checkbox4.enabledCheckboxButton.rx.tap
            .map { Reactor.Action.agreementButtonTapped(.checkedFourth) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: AgreementsReactor) {
        reactor.state.map { $0.isAgreeAll }
            .bind(to: agreementsView.agreeAllCheckboxView.enabledCheckboxButton.rx.isSelected)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isAgreeFirst }
            .bind(to: agreementsView.checkbox1.enabledCheckboxButton.rx.isSelected)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isAgreeSecond }
            .bind(to: agreementsView.checkbox2.enabledCheckboxButton.rx.isSelected)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isAgreeThird }
            .bind(to: agreementsView.checkbox3.enabledCheckboxButton.rx.isSelected)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isAgreeFourth }
            .bind(to: agreementsView.checkbox4.enabledCheckboxButton.rx.isSelected)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isSigninButtonEnable }
            .withUnretained(self)
            .subscribe(onNext: { viewController, enable in
                if enable {
                    viewController.agreementsView.signUpButton.isEnabled = true
                    viewController.agreementsView.signUpButton.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
                }
                else {
                    viewController.agreementsView.signUpButton.isEnabled = false
                    viewController.agreementsView.signUpButton.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                }
            })
            .disposed(by: disposeBag)
    }
}
