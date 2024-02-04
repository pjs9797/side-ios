import UIKit
import Domain
import RxFlow

final public class HomeFlow: Flow {
    
    public var root: Presentable {
        return self.rootViewController
    }
    
    var provider: ServiceProviderType
    
    private let rootViewController: UINavigationController
    
    init(with provider: ServiceProviderType, with rootViewController: UINavigationController) {
        self.provider = provider
        self.rootViewController = rootViewController
    }
    
    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? HomeStep else { return .none }
        
        switch step {
        case .popViewController:
            return popViewController()
        case .presentSelectMeetingTypeViewController:
            return coordinateToSelectMeetingTypeViewController()
        case .goToCreateMeetingFlow(let meetingTitle):
            return coordinateToCreateMeetingFlow(meetingTitle: meetingTitle)
        }
    }
    
    private func popViewController() -> FlowContributors {
        self.rootViewController.popViewController(animated: true)
        
        return .none
    }
    
    private func coordinateToSelectMeetingTypeViewController() -> FlowContributors {
        let reactor = SelectMeetingTypeReactor()
        let viewController = SelectMeetingTypeViewController(with: reactor)
        self.rootViewController.present(viewController, animated: false)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToCreateMeetingFlow(meetingTitle: String) -> FlowContributors {
        let createMeetingFlow = CreateMeetingFlow(with: self.provider, with: self.rootViewController, with: meetingTitle)
        return .one(flowContributor: .contribute(withNextPresentable: createMeetingFlow, withNextStepper: OneStepper(withSingleStep: CreateMeetingStep.goToInitializeCreateMeetingViewController)))
    }
}
