import Foundation
import RxSwift
import RxCocoa
import Shared

public class CreateMeetingContentViewModel{
    let disposeBag = DisposeBag()
    let titleTextRelay = PublishRelay<String>()
    let memberTextRelay = PublishRelay<String>()
    let introductionTextRelay = PublishRelay<String>()
    let backButtonTapped = PublishRelay<Void>()
    let createButtonTapped = PublishRelay<Void>()
//    let isCreateButtonEnabled: Driver<Bool>
//    
//    public init(meetingRegionViewModel: MeetingRegionViewModel, createMeetingPeriodReactor: CreateMeetingPeriodReactor){
//        isCreateButtonEnabled = Observable.combineLatest(
//            titleTextRelay.asObservable(),
//            memberTextRelay.asObservable(),
//            introductionTextRelay.asObservable(),
//            meetingRegionViewModel.currentLocationRelay.asObservable(),
//            createMeetingPeriodReactor.dateRelay.asObservable(),
//            createMeetingPeriodReactor.timeRelay.asObservable(),
//            EditPhotoViewModel.shared.imgRelay.asObservable()
//        ) { title, member, introduction, location, date, time, img in
//            return !title.isEmpty && !member.isEmpty && !introduction.isEmpty &&
//            !location.isEmpty && !date.isEmpty && !time.isEmpty && img != nil
//        }
//        .asDriver(onErrorJustReturn: false)
//    }
    public init(){
        
    }
}
