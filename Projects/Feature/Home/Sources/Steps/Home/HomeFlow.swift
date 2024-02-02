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
        case .dismissViewController:
            return dismissViewController()
        default:
            return .none
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
    
    private func coordinateToMainSignInViewController() -> FlowContributors {
        let reactor = SignInReactor(provider: provider)
        let viewController = SignInViewController(with: reactor)
        self.rootViewController.setViewControllers([viewController], animated: false)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
}
