import Foundation
import RxSwift
import RxCocoa

public class CreateMeetingPeriodViewModel{
    let disposeBag = DisposeBag()
    let timeRelay = PublishRelay<String>()
    let dateBtViewTapped = PublishRelay<Void>()
    let timeBtViewTapped = PublishRelay<Void>()
    var selectedPeriodIndex: Int = 0
    var selectedHourIndex: Int = 0
    var selectedMinuteIndex: Int = 0
    let amPm = ["오전", "오후"]
    let hours = (1...12).map { String(format: "%02d", $0) }
    let minutes = (0...59).map { String(format: "%02d", $0) }
    
    let selectedDate = PublishRelay<String>()
    let currentPage = BehaviorRelay<Date>(value: Date())
    
    public init() {
        timeRelay.subscribe(onNext: { time in
            print(time)
        }).disposed(by: disposeBag)
        
        selectedDate.subscribe(onNext: { date in
            print(date)
        }).disposed(by: disposeBag)
    }
    
    func selectPeriod(_ period: String, hour: String, minute: String) {
        let newTime = "\(period) \(hour):\(minute)"
        timeRelay.accept(newTime)
        selectedPeriodIndex = amPm.firstIndex(of: period) ?? 0
        selectedHourIndex = hours.firstIndex(of: hour) ?? 0
        selectedMinuteIndex = minutes.firstIndex(of: minute) ?? 0
    }
    
    func selectHour(_ hour: String, period: String, minute: String) {
        let newTime = "\(period) \(hour):\(minute)"
        timeRelay.accept(newTime)
        selectedPeriodIndex = amPm.firstIndex(of: period) ?? 0
        selectedHourIndex = hours.firstIndex(of: hour) ?? 0
        selectedMinuteIndex = minutes.firstIndex(of: minute) ?? 0
    }
    
    func selectMinute(_ minute: String, period: String, hour: String) {
        let newTime = "\(period) \(hour):\(minute)"
        timeRelay.accept(newTime)
        selectedPeriodIndex = amPm.firstIndex(of: period) ?? 0
        selectedHourIndex = hours.firstIndex(of: hour) ?? 0
        selectedMinuteIndex = minutes.firstIndex(of: minute) ?? 0
    }
}
