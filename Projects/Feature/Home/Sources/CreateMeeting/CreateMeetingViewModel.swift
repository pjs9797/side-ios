import RxSwift
import RxCocoa

public class CreateMeetingViewModel{
    
    enum MeetingType {
        case none
        case develop
        case hobby
    }
    let disposeBag = DisposeBag()
    let meetingTypeRelay = BehaviorRelay<MeetingType>(value: .none)
    
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
