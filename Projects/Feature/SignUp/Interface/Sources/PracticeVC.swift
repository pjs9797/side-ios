import UIKit
import Shared
import SnapKit

public class PracticeVC: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(TPInputs.TextArea.textEnabledView)
        
        TPInputs.TextArea.textEnabledView.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(176)
            make.centerX.centerY.equalToSuperview()
        }
    }
}

