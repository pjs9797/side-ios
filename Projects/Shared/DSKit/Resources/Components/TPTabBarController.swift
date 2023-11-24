import UIKit

class TPTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
    }
    
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
    }
}
