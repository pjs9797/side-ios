
// MARK: 네비게이션과 하단 버튼은 만들어져 있어서 내부 화면 UI만 구성하였습니다.
// TODO: 컴포넌트 적용 및 폰트 수정은 직접 해주세요.

import UIKit
import SnapKit
import Shared

public class CreatingGatheringViewController: UIViewController {
    lazy var createGatheringView = CreatingGatheringView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func loadView() {
        self.view = createGatheringView
    }
}

