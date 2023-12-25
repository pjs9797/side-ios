import RxSwift
import RxCocoa

public class CreateMeetingViewModel{
<<<<<<< HEAD
    let disposeBag = DisposeBag()
    let meetingTypeRelay = BehaviorRelay<MeetingType>(value: .none)
    let backButtonTapped = PublishRelay<Void>()
    let nextButtonTapped = PublishRelay<Void>()
=======
    
    enum MeetingType {
        case none
        case develop
        case hobby
    }
    let disposeBag = DisposeBag()
    let meetingTypeRelay = BehaviorRelay<MeetingType>(value: .none)
    
>>>>>>> 31ab288 ([FEAT] 모임 생성 첫 화면 개발)
    let developBtViewTapped = PublishRelay<Void>()
    let hobbyBtViewTapped = PublishRelay<Void>()
    
    public init(){
        developBtViewTapped
            .map { MeetingType.develop }
            .bind(to: meetingTypeRelay)
            .disposed(by: disposeBag)
        
        hobbyBtViewTapped
            .map { MeetingType.hobby }
            .bind(to: meetingTypeRelay)
            .disposed(by: disposeBag)
    }
}
