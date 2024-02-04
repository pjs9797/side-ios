//
//  CreateMeetingFlow.swift
//  FeatureHomeInterface
//
//  Created by 박중선 on 2/2/24.
//

import UIKit
import Domain
import RxFlow

final public class CreateMeetingFlow: Flow {
    
    public var root: Presentable {
        return self.rootViewController
    }
    
    var provider: ServiceProviderType
    private let rootViewController: UINavigationController
    let meetingTitle: String
    
    init(with provider: ServiceProviderType, with rootViewController: UINavigationController, with meetingTitle: String) {
        self.provider = provider
        self.rootViewController = rootViewController
        self.meetingTitle = meetingTitle
    }
    
    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? CreateMeetingStep else { return .none }
        
        switch step {
        case .popViewController:
            return popViewController()
        case .dismissViewController:
            return dismissViewController()
        case .goToInitializeCreateMeetingViewController:
            return coordinateToInitializeCreateMeetingViewController()
        case .goToSelectDevelopDetailsViewController:
            return coordinateToSelectDevelopDetailsViewController()
        }
    }
    
    private func popViewController() -> FlowContributors {
        self.rootViewController.popViewController(animated: true)
        
        return .none
    }
    
    private func dismissViewController() -> FlowContributors {
        self.rootViewController.popViewController(animated: true)
        
        return .none
    }
    
    private func coordinateToInitializeCreateMeetingViewController() -> FlowContributors {
        let reactor = InitializeCreateMeetingReactor()
        let viewController = InitializeCreateMeetingViewController(meetingTitle: self.meetingTitle, with: reactor)
        self.rootViewController.pushViewController(viewController, animated: false)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToSelectDevelopDetailsViewController() -> FlowContributors {
        let reactor = SelectDevelopDetailsReactor()
        let viewController = SelectDevelopDetailsViewController(meetingTitle: self.meetingTitle, with: reactor)
        self.rootViewController.pushViewController(viewController, animated: false)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
}
