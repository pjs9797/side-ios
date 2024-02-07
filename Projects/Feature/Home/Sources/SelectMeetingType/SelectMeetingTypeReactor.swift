import RxCocoa
import ReactorKit
import RxFlow

public class SelectMeetingTypeReactor: ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    
    public init(){
        self.initialState = State()
    }
    
    public enum Action {
        case oneDayButtonTapped
        case shortTermButtonTapped
        case continuousButtonTapped
        case dimmedViewTapped
        case swipeGesturePerformed
    }
    
    public enum Mutation {
        case dismissView
    }
    
    public struct State {
        var isDismissed: Bool = false
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .oneDayButtonTapped:
            self.steps.accept(HomeStep.goToCreateMeetingFlow(meetingTitle: "원데이 멤버 모집하기"))
            return .just(.dismissView)
        case .shortTermButtonTapped:
            self.steps.accept(HomeStep.goToCreateMeetingFlow(meetingTitle: "단기 멤버 모집하기"))
            return .just(.dismissView)
        case .continuousButtonTapped:
            self.steps.accept(HomeStep.goToCreateMeetingFlow(meetingTitle: "지속형 멤버 모집하기"))
            return .just(.dismissView)
        case .dimmedViewTapped, .swipeGesturePerformed:
            return .just(.dismissView)
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .dismissView:
            newState.isDismissed = true
        }
        return newState
    }
}
