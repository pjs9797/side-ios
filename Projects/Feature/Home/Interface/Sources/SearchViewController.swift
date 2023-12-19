import UIKit

public class SearchViewController: UIViewController {
    let searchView = SearchView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public override func loadView() {
        super.loadView()
        
        view = searchView
    }
}
