//
//  SignInViewController.swift
//  FeatureSignIn
//
//  Created by 강민성 on 11/6/23.
//

import UIKit
import Shared
import FeatureSignInInterface

import RxSwift
import RxCocoa
import RxFlow
import ReactorKit

public class SignInViewController: BaseViewController, ReactorKit.View {
    
    public typealias Reactor = SignInReactor
    
//    public var disposeBag: DisposeBag = DisposeBag()
    
    var signInView = SignInView()
    
    public override func loadView() {
        super.loadView()
        view = signInView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    init(with reactor: Reactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        signInView.continueWithEmailButton.addAction(UIAction(handler: { [weak self] _ in
            self?.showBottomSheet()
        }), for: .touchUpInside)    }
    
    private func showBottomSheet() {
        let contentViewController = AgreementsViewController()
        let bottomSheetViewController = BottomSheetViewController(contentViewController: contentViewController)
        
        self.present(bottomSheetViewController, animated: true)
    }
}

extension SignInViewController {
    
    public func bind(reactor: SignInReactor) {
        signInView.continueWithEmailButton.rx.tap
            .map { Reactor.Action.didContinueWithEmailButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        signInView.signInWithEmailButton.rx.tap
            .map { Reactor.Action.didSignInWithEmailButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
    }
}
