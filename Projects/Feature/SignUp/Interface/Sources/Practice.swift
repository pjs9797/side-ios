import UIKit
import Shared
import SnapKit

public class PracticeVC: UIViewController {
    let disview = TPInputs.Default.disabledEmailView
    let label = TPInputs.Default.disabledEmailLabel
    let textField = TPInputs.Default.disabledTextField
    let helpLabel = TPInputs.Default.disabledHelpLabel
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(disview)
        
        [label, textField, helpLabel].forEach {
            disview.addSubview($0)
        }
        
        setLayOut()
    }
    
    func setLayOut() {
        disview.snp.makeConstraints {
            $0.width.equalTo(335)
            $0.height.equalTo(56)
            $0.centerX.centerY.equalToSuperview()
        }
        
        label.snp.makeConstraints {
            $0.width.equalTo(303)
            $0.height.equalTo(17)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().offset(8)
        }
        
        textField.snp.makeConstraints {
            $0.width.equalTo(303)
            $0.height.equalTo(24)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().offset(25)
        }
        
        helpLabel.snp.makeConstraints {
            $0.width.equalTo(66)
            $0.height.equalTo(17)
            $0.top.equalTo(disview.snp.bottom).offset(8)
            $0.leading.equalTo(disview.snp.leading)
        }
    }
}
