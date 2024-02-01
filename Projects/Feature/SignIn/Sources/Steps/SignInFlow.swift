//
//  SignInFlow.swift
//  FeatureSignInInterface
//
//  Created by 강민성 on 1/18/24.
//

import UIKit
import Domain
import FeatureSignInInterface
import SharedDSKit

import RxSwift
import RxRelay
import RxFlow

public struct SignInStepper: Stepper {
    
    public let steps = PublishRelay<Step>()
    private let provider: ServiceProviderType
    private let disposeBag: DisposeBag = .init()
    
    public init(provider: ServiceProviderType) {
        self.provider = provider
    }
}

final public class SignInFlow: Flow {
    
    public var root: Presentable {
        return self.rootViewController
    }
    
    var provider: ServiceProviderType
    
    private let rootViewController: NavigationController = {
        let navigationController = NavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.interactivePopGestureRecognizer?.isEnabled = true
        return navigationController
    }()
    
    public init(with provider: ServiceProviderType) {
        self.provider = provider
    }
    
    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? SignInStep else { return .none }
        
        switch step {
        case .popViewController:
            return popViewController()
            
        case .userIsSignedIn:
            // 로그인 "완료"
            return .end(forwardToParentFlowWithStep: SignInStep.userIsSignedIn)
            
        case .signInRequired:
            return coordinateToMainSignInViewController()
            
        case .emailSigningRequired:
            return coordinateToSignInWithEmailViewController()
            
        case .agreementsIsRequried:
            return coordinateToAgreementsViewController()

        case .forgotId:
            return coordinateToForgotIdViewController()
            
        case .forgotIdEmailisRequired:
            return coordinateToIdVerificateWithEmailViewController()
            /*
        case .forgotIdPhoneNumberIsRequired:
            return coordinateToIdVerificateWithPhoneNumberViewController()
            
        case .forgotPassword:
            return coordinateToForgotPasswordViewController()
            
        case .forgotPasswordEmailIsRequired:
            return coordinateToPasswordVerificateWithEmailViewController()
            
        case .forgotPasswordPhoneNumberIsRequired:
            return coordinateToPasswordVerificateWithPhoneNumberViewController()
            
        case .newPasswordIsRequired(let email):
            return coordinateToNewPasswordInputViewController(email: email)
         */
        default:
            return .none
        }
    }
    
    private func popViewController() -> FlowContributors {
        self.rootViewController.popViewController(animated: true)
        
        return .none
    }
    
    private func coordinateToMainSignInViewController() -> FlowContributors {
        let reactor = SignInReactor(provider: provider)
        let viewController = SignInViewController(with: reactor)
        self.rootViewController.setViewControllers([viewController], animated: false)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToSignInWithEmailViewController() -> FlowContributors {
        let reactor = SignInWithEmailReactor(provider: provider)
        let viewController = SignInWithEmailViewController(with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToAgreementsViewController() -> FlowContributors {
        let reactor = AgreementsReactor(provider: provider)
        let viewController = AgreementsViewController()
        let bottomSheetViewController = BottomSheetViewController(contentViewController: viewController)
        
        return .one(flowContributor: .contribute(withNextPresentable: bottomSheetViewController, withNextStepper: reactor))
    }
    
    private func coordinateToForgotIdViewController() -> FlowContributors {
        let reactor = ForgotIdReactor(provider: provider)
        let viewController = ForgotIdViewController(with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToIdVerificateWithEmailViewController() -> FlowContributors {
        let reactor = IdVerificateWithEmailReactor(provider: provider)
        let viewController = IdVerificateWithEmailViewController(with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToIdVerificateWithPhoneNumberViewController() -> FlowContributors {
        let reactor = IdVerificateWithPhoneNumberReactor(provider: provider)
        let viewController = IdVerificateWithPhoneNumberViewController(with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    /*
    private func coordinateToForgotPasswordViewController() -> FlowContributors {
        let reactor = ForgotPasswordReactor(provider: provider)
        let viewController = ForgotPasswordViewController(with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToPasswordVerificateWithEmailViewController() -> FlowContributors {
        let reactor = PasswordVerificateWithEmailReactor(provider: provider)
        let viewController = PasswordVerificateWithEmailViewController(with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToPasswordVerificateWithPhoneNumberViewController() -> FlowContributors {
        let reactor = PasswordVerificateWithPhoneNumberReactor(provider: provider)
        let viewController = PasswordVerificateWithPhoneNumberViewController(with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToNewPasswordInputViewController(email: String?) -> FlowContributors {
        guard let email = email else { return .none }
        let reactor = NewPasswordInputReactor(provider: provider, email: email)
        let viewController = NewPasswordInputViewController(with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    */
}
