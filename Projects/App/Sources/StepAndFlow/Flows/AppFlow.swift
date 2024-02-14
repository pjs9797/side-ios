//
//  AppFlow.swift
//  TP
//
//  Created by 강민성 on 1/15/24.
//


import UIKit
import RxSwift
import RxCocoa
import RxFlow
import FeatureSignIn
import FeatureHome
import FeatureMyPage

import Domain

struct AppStepper: Stepper {
    
    let steps = PublishRelay<Step>()
    private let provider: ServiceProviderType
    private let disposeBag: DisposeBag = .init()
    
    init(provider: ServiceProviderType) {
        self.provider = provider
    }
}

final class AppFlow: Flow {
    var root: Presentable {
        return self.rootWindow
    }
    
    private let rootWindow: UIWindow
    private let provider: ServiceProviderType
    
    init(with window: UIWindow, provider: ServiceProviderType) {
        self.rootWindow = window
        self.provider = provider
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        
        switch step {
        case .signInRequired:
//            return coordinateToSignInViewController()
            return coordinateToMyPageViewController()
            
//        case .userIsSignedIn:
//            return coordinateToHomeViewController()
            
        default:
            return .none
        }
    }
    
    private func coordinateToSignInViewController() -> FlowContributors {
        let signInFlow = SignInFlow(with: provider)
        
        Flows.use(signInFlow, when: .created) { [unowned self] root in
            self.rootWindow.rootViewController = root
        }
        
        let nextStep = OneStepper(withSingleStep: SignInStep.signInRequired)
        
        return .one(flowContributor: .contribute(withNextPresentable: signInFlow, withNextStepper: nextStep))
        
    }
    /*
    private func coordinateToHomeViewController() -> FlowContributors {
        let homeFlow = HomeFlow(with: provider)
        
        Flows.use(homeFlow, when: .created) { [unowned self] root in
            self.rootWindow.rootViewController = root
        }
        
        let nextStep = OneStepper(withSingleStep: AppStep.userIsSignedIn)
        
        return .one(flowContributor: .contribute(withNextPresentable: homeFlow, withNextStepper: nextStep))
    }
    */
    
    private func coordinateToMyPageViewController() -> FlowContributors {
        let myPageFlow = MyPageFlow(with: provider)
        
        Flows.use(myPageFlow, when: .created) { [unowned self] root in
            self.rootWindow.rootViewController = root
        }
        
        let nextStep = OneStepper(withSingleStep: MyPageStep.myPageRequired)
        
        return .one(flowContributor: .contribute(withNextPresentable: myPageFlow, withNextStepper: nextStep))
    }
}

