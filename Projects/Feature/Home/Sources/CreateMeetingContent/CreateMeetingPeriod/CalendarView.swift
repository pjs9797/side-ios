import UIKit
import FSCalendar
import RxSwift
import RxCocoa
import SnapKit

class CalendarView: UIView{
    
    let calendar = FSCalendar()

    var calendarViewModel: CalendarViewModel
    let disposeBag = DisposeBag()
    
    
    init(calendarViewModel:CalendarViewModel){
        self.calendarViewModel = calendarViewModel
        super.init(frame: .zero)
        self.addSubview(calendar)
        calendar.snp.makeConstraints { make in
            make.width.height.equalTo(300)
            make.centerX.centerY.equalToSuperview()
        }
        //calendar.delegate = self
        //calendar.dataSource = self
        setupCalendarAppearance()
        
        // ViewModel 바인딩
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCalendarAppearance() {
        calendar.appearance.titleDefaultColor = .black
        calendar.appearance.weekdayTextColor = .gray
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 16)
        calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 14)
        calendar.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 18)
        // ... 추가 설정 ...
    }
    
    // FSCalendar Delegate 메서드
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
//        // 여기에 특별한 날짜에 대한 색상 로직을 구현하세요
//        return .green
//    }
    
//    // FSCalendar DataSource 메서드
//    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//        // 여기에 특별한 날짜에 대한 이미지 로직을 구현하세요
//    }
}

class CalendarViewModel {
    
    // Outputs to the View
    let selectedDate = PublishSubject<Date>()
    
}
