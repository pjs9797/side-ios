import UIKit
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
import SnapKit
import SharedDSKit

public class TPTabBarController: UITabBarController {
    
    lazy var separateView: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        return view
    }()
    
<<<<<<< HEAD
=======
import SharedDSKit

public class TPTabBarController: UITabBarController {
>>>>>>> 31ab288 ([FEAT] 모임 생성 첫 화면 개발)
=======
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
    public override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
<<<<<<< HEAD
<<<<<<< HEAD
    
    func setTabBar() {
        self.tabBar.addSubview(separateView)
        separateView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
        }
        tabBar.tintColor = SharedDSKitAsset.Colors.lightGreen.color
<<<<<<< HEAD
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
=======
=======
    
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
    func setTabBar() {
        tabBar.barTintColor = SharedDSKitAsset.Colors.lightGreen.color
        tabBar.unselectedItemTintColor = SharedDSKitAsset.Colors.gr100.color
        tabBar.backgroundColor = SharedDSKitAsset.Colors.white.color
        if let items = tabBar.items {
            let attribute = [NSAttributedString.Key.font: Fonts.ST01.font]
            items[0].image = SharedDSKitAsset.Icons.iconHome24.image
            items[0].title = "모임"
            items[0].setTitleTextAttributes(attribute, for: .normal)
            items[1].image = SharedDSKitAsset.Icons.iconPlace24.image
            items[1].title = "플레이스"
            items[1].setTitleTextAttributes(attribute, for: .normal)
            items[2].image = SharedDSKitAsset.Icons.iconQA24.image
            items[2].title = "커리어 Q&A"
            items[2].setTitleTextAttributes(attribute, for: .normal)
            items[3].image = SharedDSKitAsset.Icons.iconChat24.image
            items[3].title = "채팅"
            items[3].setTitleTextAttributes(attribute, for: .normal)
            items[4].image = SharedDSKitAsset.Icons.iconMy24.image
            items[4].title = "MY"
            items[4].setTitleTextAttributes(attribute, for: .normal)
        }
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        self.setViewControllers([homeVC], animated: true)
>>>>>>> 31ab288 ([FEAT] 모임 생성 첫 화면 개발)
=======
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
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
    }
}
