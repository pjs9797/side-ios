import UIKit
import Domain
import RxFlow

final public class MyPageFlow: Flow {
    
    public var root: Presentable {
        return self.rootViewController
    }
    
    var provider: ServiceProviderType
    
    private let rootViewController: UINavigationController
    
    public init(with provider: ServiceProviderType, with rootViewController: UINavigationController) {
        self.provider = provider
        self.rootViewController = rootViewController
    }
    
    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? MyPageStep else { return .none }
        switch step {
        case .popViewController:
            return popViewController()
        case .goToMyPageViewController:
            return coordinateToMyPageViewController()
        case .goToSettingViewController:
            return coordinateToSettingViewController()
        case .presentToWithdrawalAlert:
            return coordinateToWithdrawalAlert()
        }
    }
    
    private func popViewController() -> FlowContributors {
        self.rootViewController.popViewController(animated: true)
        
        return .none
    }
    
    private func coordinateToMyPageViewController() -> FlowContributors {
        let reactor = MyPageReactor()
        let viewController = MyPageViewController(with: reactor)
        self.rootViewController.pushViewController(viewController, animated: false)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func coordinateToSettingViewController() -> FlowContributors {
        let reactor = SettingReactor()
        let viewController = SettingViewController(with: reactor)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }

    private func coordinateToWithdrawalAlert() -> FlowContributors {
        let alert = UIAlertController(title: "정말 탈퇴하시겠습니까?", message: "회원 탈퇴 시 계정 정보는 삭제되어\n복구가 불가해요.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "탈퇴하기", style: .default, handler: { _ in
            //TODO: 회원 탈퇴 이벤트 작성
        }))
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        self.rootViewController.present(alert, animated: true, completion: nil)
        
        return .none
    }
}
