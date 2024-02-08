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
    let selectMeetingRegionReactor: SelectMeetingRegionReactor
    
    init(with provider: ServiceProviderType, with rootViewController: UINavigationController, with meetingTitle: String) {
        self.provider = provider
        self.rootViewController = rootViewController
        self.meetingTitle = meetingTitle
        self.selectMeetingRegionReactor = SelectMeetingRegionReactor(provider: self.provider)
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
        case .goToSelectHobbyDetailsViewController:
            return coordinateToSelectHobbyDetailsViewController()
        case .goToCreateMeetingContentViewController:
            return coordinateToCreateMeetingContentViewController()
        case .presentSelectMeetingRegionViewController:
            return coordinateToSelectMeetingRegionViewController()
        }
    }
    
    private func popViewController() -> FlowContributors {
        self.rootViewController.popViewController(animated: true)
        
        return .none
    }
    
    private func dismissViewController() -> FlowContributors {
        self.rootViewController.dismiss(animated: true)
        return .none
    }
    
    private func coordinateToInitializeCreateMeetingViewController() -> FlowContributors {
        let reactor = InitializeCreateMeetingReactor()
        let viewController = InitializeCreateMeetingViewController(meetingTitle: self.meetingTitle, with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToSelectDevelopDetailsViewController() -> FlowContributors {
        let reactor = SelectDevelopDetailsReactor()
        let viewController = SelectDevelopDetailsViewController(meetingTitle: self.meetingTitle, with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToSelectHobbyDetailsViewController() -> FlowContributors {
        let reactor = SelectHobbyDetailsReactor()
        let viewController = SelectHobbyDetailsViewController(meetingTitle: self.meetingTitle, with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToCreateMeetingContentViewController() -> FlowContributors {
        let createMeetingContentReactor = CreateMeetingContentReactor()
        let createMeetingRegionReactor = CreateMeetingRegionReactor()
        let createMeetingPeriodReactor = CreateMeetingPeriodReactor()
        let viewController = CreateMeetingContentViewController(meetingTitle: "모임 생성", createMeetingContentReactor: createMeetingContentReactor, createMeetingRegionReactor: createMeetingRegionReactor, selectMeetingRegionReactor: self.selectMeetingRegionReactor, createMeetingPeriodReactor: createMeetingPeriodReactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        let compositeStepper = CompositeStepper(steppers: [createMeetingContentReactor, createMeetingRegionReactor, createMeetingPeriodReactor])
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: compositeStepper))
    }
    
    private func coordinateToSelectMeetingRegionViewController() -> FlowContributors {
        let viewController = SelectMeetingRegionViewController(with: self.selectMeetingRegionReactor)
        self.rootViewController.present(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: self.selectMeetingRegionReactor))
    }
}
