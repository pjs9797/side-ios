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
        
        case .forgotIdPhoneNumberIsRequired:
            return coordinateToIdVerificateWithPhoneNumberViewController()
            
        case .forgotPassword:
            return coordinateToForgotPasswordViewController()
            
        case .forgotPasswordEmailIsRequired:
            return coordinateToPasswordVerificateWithEmailViewController()
            
        case .forgotPasswordPhoneNumberIsRequired:
            return coordinateToPasswordVerificateWithPhoneNumberViewController()
            
        case .newPasswordWithEmailIsRequired(let email):
            return coordinateToNewPasswordInputWithEmailViewController(email: email)
            
        case .userChangedPassword:
            return coordinateToNewPasswordCompleteViewController()
            
        case .userChangedPasswordAndSignInRequired:
            return coordinateToRootViewController()
            
        case .newPasswordWIthPhoneNumberIsRequired(let phoneNumber):
            return coordinateToNewPasswordInputWithPhoneNumberViewController(phoneNumber: phoneNumber)
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
        let viewController = AgreementsViewController(with: reactor)
        let bottomSheetViewController = BottomSheetViewController(contentViewController: viewController)
        self.rootViewController.present(bottomSheetViewController, animated: true)
        
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
    
    private func coordinateToNewPasswordInputWithEmailViewController(email: String?) -> FlowContributors {
        guard let email = email else { return .none }
        let reactor = NewPasswordInputWithEmailReactor(provider: provider, email: email)
        let viewController = NewPasswordInputWithEmailViewController(with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToNewPasswordInputWithPhoneNumberViewController(phoneNumber: String?) -> FlowContributors {
        guard let phoneNumber = phoneNumber else { return .none }
        let reactor = NewPasswordInputWithPhoneNumberReactor(provider: provider, phoneNumber: phoneNumber)
        let viewController = NewPasswordInputWithPhoneNumberViewController(with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    private func coordinateToNewPasswordCompleteViewController() -> FlowContributors {
        let reactor = NewPasswordCompleteRactor(provider: provider)
        let viewController = NewPasswordCompleteViewController(with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToRootViewController() -> FlowContributors {
        self.rootViewController.popToRootViewController(animated: true)
        
        return .none
    }
    
}
