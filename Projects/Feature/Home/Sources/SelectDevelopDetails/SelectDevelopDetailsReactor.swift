import RxCocoa
import ReactorKit
import RxFlow

public class SelectDevelopDetailsReactor: ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    
    public init(){
        self.initialState = State()
    }
    
    public enum Action {
        case backButtonTapped
        case nextButtonTapped
        case detailTypeSelected(DevelopDetailType)
    }
    
    public enum Mutation {
        case setDetailType(DevelopDetailType)
    }
    
    public struct State {
        var selectedDetailType: DevelopDetailType = .none
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .backButtonTapped:
            self.steps.accept(CreateMeetingStep.popViewController)
            return .empty()
        case .nextButtonTapped:
            self.steps.accept(CreateMeetingStep.goToCreateMeetingContentViewController)
            return .empty()
        case .detailTypeSelected(let type):
            switch type{
            case .study:
                MeetingDataManager.shared.categoryMajor = "스터디 · 자격증"
            case .sideProject:
                MeetingDataManager.shared.categoryMajor = "사이드 프로젝트"
            case .jobChange:
                MeetingDataManager.shared.categoryMajor = "이직 준비"
            case .language:
                MeetingDataManager.shared.categoryMajor = "어학"
            case .investment:
                MeetingDataManager.shared.categoryMajor = "재테크"
            case .etc:
                MeetingDataManager.shared.categoryMajor = "기타"
            case .none:
                break
            }
            MeetingDataManager.shared.categorySub = nil
            return .just(.setDetailType(type))
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setDetailType(let type):
            newState.selectedDetailType = type
        }
        return newState
    }
}
