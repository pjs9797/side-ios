import UIKit

class LocationViewController: UIViewController {
    let locationView = LocationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
    }
    
    override func loadView() {
        super.loadView()
        
        view = locationView
    }
    
    func setNavigationBar() {
        title = "위치 검색"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: locationView.leftBarbutton)
    }
}
