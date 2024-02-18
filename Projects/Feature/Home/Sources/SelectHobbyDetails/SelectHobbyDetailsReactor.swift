import Foundation
import RxCocoa
import ReactorKit
import RxFlow

public class SelectHobbyDetailsReactor: ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    
    public init(){
        self.initialState = State()
    }
    
    public enum Action {
        case backButtonTapped
        case nextButtonTapped
        case updateContentSize(CGSize)
        case selectItem(String,String)
    }
    
    public enum Mutation {
        case setContentSize(CGSize)
        case setSelectItem
    }
    
    public struct State {
        var hobbyCellData: [HobbyModel] = HobbyDetailTableViewCellData.cellData
        var contentSize: CGSize = .zero
        var enableNextButton: Bool = false
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .backButtonTapped:
            self.steps.accept(CreateMeetingStep.popViewController)
            return .empty()
        case .nextButtonTapped:
            self.steps.accept(CreateMeetingStep.goToCreateMeetingContentViewController)
            return .empty()
        case .updateContentSize(let size):
            return .just(.setContentSize(size))
        case .selectItem(let categoryMajor, let categorySub):
            MeetingDataManager.shared.categoryMajor = categoryMajor
            MeetingDataManager.shared.categorySub = categorySub
            return .just(.setSelectItem)
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setContentSize(let size):
            newState.contentSize = size
        case .setSelectItem:
            newState.enableNextButton = true
        }
        return newState
    }
}
