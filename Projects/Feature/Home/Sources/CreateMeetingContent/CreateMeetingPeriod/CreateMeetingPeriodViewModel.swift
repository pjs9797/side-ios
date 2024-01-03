import RxSwift
import RxCocoa

class CreateMeetingPeriodViewModel{
    let disposeBag = DisposeBag()
    var selectedTime: Observable<Time>
    let timeRelay = BehaviorRelay<Time>(value: Time(period: "오전", hour: 1, minute: 0))
    
    init() {
        self.selectedTime = timeRelay.asObservable()
        timeRelay.subscribe(onNext: { time in
            print(time)
        }).disposed(by: disposeBag)
    }
    
    func selectPeriod(_ period: String) {
        timeRelay.accept(Time(period: period, hour: timeRelay.value.hour, minute: timeRelay.value.minute))
    }
    
    func selectHour(_ hour: Int) {
        timeRelay.accept(Time(period: timeRelay.value.period, hour: hour, minute: timeRelay.value.minute))
    }
    
    func selectMinute(_ minute: Int) {
        timeRelay.accept(Time(period: timeRelay.value.period, hour: timeRelay.value.hour, minute: minute))
    }
}
