import UIKit
import SnapKit
import SharedDSKit

public class TPTabBarController: UITabBarController {
    
    lazy var separateView: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        return view
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar() {
        self.tabBar.addSubview(separateView)
        separateView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
        }
        tabBar.tintColor = SharedDSKitAsset.Colors.lightGreen.color
        tabBar.unselectedItemTintColor = SharedDSKitAsset.Colors.gr100.color
        tabBar.backgroundColor = SharedDSKitAsset.Colors.white.color
        let homeVC = HomeViewController()
            homeVC.tabBarItem = UITabBarItem(title: "모임", image: SharedDSKitAsset.Icons.iconHome24.image, tag: 0)

            let aVC = UIViewController()
            aVC.tabBarItem = UITabBarItem(title: "플레이스", image: SharedDSKitAsset.Icons.iconPlace24.image, tag: 1)

            let bVC = UIViewController()
            bVC.tabBarItem = UITabBarItem(title: "커리어 Q&A", image: SharedDSKitAsset.Icons.iconQA24.image, tag: 2)

            let cVC = UIViewController()
            cVC.tabBarItem = UITabBarItem(title: "채팅", image: SharedDSKitAsset.Icons.iconChat24.image, tag: 3)

            let dVC = UIViewController()
            dVC.tabBarItem = UITabBarItem(title: "MY", image: SharedDSKitAsset.Icons.iconMy24.image, tag: 4)

            // 각 탭에 대응하는 네비게이션 컨트롤러 생성
            let homeNVC = UINavigationController(rootViewController: homeVC)
            let aNVC = UINavigationController(rootViewController: aVC)
            let bNVC = UINavigationController(rootViewController: bVC)
            let cNVC = UINavigationController(rootViewController: cVC)
            let dNVC = UINavigationController(rootViewController: dVC)
        self.setViewControllers([homeNVC,aNVC,bNVC,cNVC,dNVC], animated: true)
    }
}
