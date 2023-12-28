import Foundation
import RxSwift
import RxCocoa

public class CreateMeetingContentViewModel{
    let disposeBag = DisposeBag()
    let titleTextRelay = BehaviorRelay<String>(value: "")
    let onlineSwitchRelay = PublishRelay<Bool>()
    let memberTextRelay = BehaviorRelay<String>(value: "")
    let introductionTextRelay = BehaviorRelay<String>(value: "")
    let selectedDateRelay = BehaviorRelay<String>(value: "")
    let selectedTimeRelay = BehaviorRelay<String>(value: "")
    
    public init(){
        Observable.combineLatest(selectedDateRelay,selectedTimeRelay)
            .map { date, time in
                return "\(date) \(time)"
            }
            .bind(onNext: { [weak self] dateTimeString in
                print(dateTimeString)
            })
            .disposed(by: disposeBag)
    }
    
    func getDateStandardString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
    func getTimeSubTitleString(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "a h:mm"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: time)
    }
    
    func getTimeStandardString(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: time)
    }
}
