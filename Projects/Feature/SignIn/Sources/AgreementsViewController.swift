//
//  AgreementsViewController.swift
//  FeatureSignIn
//
//  Created by 강민성 on 1/14/24.
//

import UIKit
import Shared

import FeatureSignInInterface

import RxSwift
import RxCocoa
import ReactorKit

public class AgreementsViewController: UIViewController, ReactorKit.View {
    
    public typealias Reactor = AgreementsReactor
    
    public var disposeBag = DisposeBag()
    
    let agreeAllRelay = BehaviorRelay<Bool>(value: false)
    let checkedFirstRelay = BehaviorRelay<Bool>(value: false)
    let checkedSecondRelay = BehaviorRelay<Bool>(value: false)
    let checkedThridRelay = BehaviorRelay<Bool>(value: false)
    let checkedFourthRelay = BehaviorRelay<Bool>(value: false)
    
    var agreementsView = AgreementsView()
    
    public override func loadView() {
        super.loadView()
        view = agreementsView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()

        // Do any additional setup after loading the view.
    }
    
    public func bind(reactor: AgreementsReactor) {
        /*
        
        let asd = agreementsView.agreeAllCheckboxView.enabledCheckboxButton.rx.tap
            .map { .}
         */
        
    }
    
    private func configureButtons() {
        agreementsView.buttons.map { button in
            button.enabledCheckboxButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
        
    }
    
    @objc private func didTapButton() {
        agreementsView.buttons.map { button in
            button.enabledCheckboxButton.isSelected.toggle()
        }
    }
}
