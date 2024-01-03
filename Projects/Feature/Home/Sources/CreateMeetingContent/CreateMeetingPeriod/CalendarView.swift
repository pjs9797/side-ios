import UIKit
import FSCalendar
import SnapKit

public class CalendarView: UIViewController{
    
    let calendar = FSCalendar()

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(calendar)
        calendar.snp.makeConstraints { make in
            make.width.height.equalTo(300)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
}
