import Foundation
import RxSwift
import RxCocoa
import ReactorKit
import RxFlow
import Shared

public class CreateMeetingContentReactor: ReactorKit.Reactor, Stepper{
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
    
    public var initialState: State
    public var steps = PublishRelay<Step>()
    
    public init(){
        self.initialState = State()
    }
    
    public enum Action {
        case backButtonTapped
        case nextButtonTapped
        case updateContentSize(CGSize)
    }
    
    public enum Mutation {
        case setContentSize(CGSize)
    }
    
    public struct State {
        var hobbyModels: [HobbyModel] = HobbyDetailTableViewCellData.cellData
        var contentSize: CGSize = .zero
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .backButtonTapped:
            self.steps.accept(CreateMeetingStep.popViewController)
            return .empty()
        case .nextButtonTapped:
            return .empty()
        case .updateContentSize(let size):
                return .just(.setContentSize(size))
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setContentSize(let size):
            newState.contentSize = size
        
        }
        return newState
    }
}
