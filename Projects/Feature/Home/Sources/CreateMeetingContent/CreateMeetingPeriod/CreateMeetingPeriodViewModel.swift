import Foundation
import RxSwift
import RxCocoa

public class CreateMeetingPeriodViewModel{
    let disposeBag = DisposeBag()
    let dateBtViewTapped = PublishRelay<Void>()
    let timeBtViewTapped = PublishRelay<Void>()
    let timeRelay = PublishRelay<String>()
    let amPm = BehaviorRelay<[String]>(value: ["오전", "오후"])
    let hours = BehaviorRelay<[String]>(value: Array(repeating: (1...12).map { String(format: "%02d", $0) }, count: 1000).flatMap { $0 })
    let minutes = BehaviorRelay<[String]>(value: Array(repeating: (0...59).map { String(format: "%02d", $0) }, count: 1000).flatMap { $0 })
    let dateRelay = PublishRelay<String>()
    let currentPageRelay = BehaviorRelay<Date>(value: Date())
    let currentPageDrvier: Driver<Date>
    let previousButtonTapped = PublishRelay<Void>()
    let nextButtonTapped = PublishRelay<Void>()
    
    public init() {
        currentPageDrvier = currentPageRelay.asDriver(onErrorJustReturn: Date())
        
        previousButtonTapped
            .withLatestFrom(currentPageDrvier)
            .map { Calendar.current.date(byAdding: .month, value: -1, to: $0) ?? $0 }
            .bind(to: currentPageRelay)
            .disposed(by: disposeBag)
        
        nextButtonTapped
            .withLatestFrom(currentPageDrvier)
            .map { Calendar.current.date(byAdding: .month, value: 1, to: $0) ?? $0 }
            .bind(to: currentPageRelay)
            .disposed(by: disposeBag)
        
    }
}
