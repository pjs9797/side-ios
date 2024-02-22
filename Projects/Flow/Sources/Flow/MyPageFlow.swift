//
//  MyPageFlow.swift
//  Flow
//
//  Created by 강민성 on 2/22/24.
//

import UIKit
import Domain
import FeatureMyPageInterface
import Shared
import FeatureMyPage
import CoreStep

import RxSwift
import RxRelay
import RxFlow

public struct MyPageStepper: Stepper {
    
    public let steps = PublishRelay<Step>()
    private let provider: ServiceProviderType
    private let disposeBag: DisposeBag = .init()
    
    public init(provider: ServiceProviderType) {
        self.provider = provider
    }
}

final public class MyPageFlow: Flow {
    
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
        guard let step = step as? MyPageStep else { return .none }
        
        switch step {
        case .popViewController:
            return popViewController()
            
        case .myPageRequired:
            return coordinateToMyPageViewController()
            
        case .settingsRequired:
            return coordinateToSettingsViewController()
        
        default:
            return .none
        }
    }
    
    private func popViewController() -> FlowContributors {
        self.rootViewController.popViewController(animated: true)
        
        return .none
    }
    
    private func coordinateToMyPageViewController() -> FlowContributors {
        let reactor = MyPageReactor(provider: provider)
        let viewController = MyPageViewController(with: reactor)
        self.rootViewController.setViewControllers([viewController], animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToSettingsViewController() -> FlowContributors {
        let reactor = SettingsReactor(provider: provider)
        let viewController = SettingsViewController(with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
}
