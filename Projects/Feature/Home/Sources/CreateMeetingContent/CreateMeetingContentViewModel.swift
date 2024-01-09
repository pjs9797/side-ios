import Foundation
import RxSwift
import RxCocoa
import Shared

public class CreateMeetingContentViewModel{
    let disposeBag = DisposeBag()
    let titleTextRelay = BehaviorRelay<String>(value: "")
    let onlineSwitchRelay = PublishRelay<Bool>()
    let memberTextRelay = BehaviorRelay<String>(value: "")
    let introductionTextRelay = BehaviorRelay<String>(value: "")
    let selectedDateRelay = BehaviorRelay<String>(value: "")
    let selectedTimeRelay = PublishRelay<String>()
    let backButtonTapped = PublishRelay<Void>()
    
    public init(){
        
        
    }
}
