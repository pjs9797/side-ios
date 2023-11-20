import UIKit
import Shared
import SnapKit

public class PracticeVC: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(TPInputs.Default.emailActiveView)
    }
}

