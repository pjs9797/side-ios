import RxSwift
import RxCocoa

public class CreateMeetingViewModel{
    let disposeBag = DisposeBag()
    let meetingTypeRelay = BehaviorRelay<MeetingType>(value: .none)
    let backButtonTapped = PublishRelay<Void>()
    let nextButtonTapped = PublishRelay<Void>()
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
