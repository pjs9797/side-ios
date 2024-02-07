import RxSwift
import RxCocoa
import ReactorKit
import RxFlow

public class InitializeCreateMeetingReactor: ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    
    public init(){
        self.initialState = State()
    }
    
    public enum Action {
        case backButtonTapped
        case nextButtonTapped
        case developButtonTapped
        case hobbyButtonTapped
    }
    
    public enum Mutation {
        case setMeetingTypeDevelop
        case setMeetingTypeHobby
    }
    
    public struct State {
        var meetingType: MeetingType = .none
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .backButtonTapped:
            self.steps.accept(CreateMeetingStep.popViewController)
            return .empty()
        case .nextButtonTapped:
            switch self.currentState.meetingType{
            case .develop:
                self.steps.accept(CreateMeetingStep.goToSelectDevelopDetailsViewController)
            case .hobby:
                self.steps.accept(CreateMeetingStep.goToSelectHobbyDetailsViewController)
                break
            case .none:
                break
            }
            return .empty()
        case .developButtonTapped:
            return .just(.setMeetingTypeDevelop)
        case .hobbyButtonTapped:
            return .just(.setMeetingTypeHobby)
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setMeetingTypeDevelop:
            newState.meetingType = .develop
        case .setMeetingTypeHobby:
            newState.meetingType = .hobby
        }
        return newState
    }
}
