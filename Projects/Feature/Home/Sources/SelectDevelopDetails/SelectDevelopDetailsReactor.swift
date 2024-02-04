import RxSwift
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
            //self.steps.accept(CreateMeetingStep.nextScreen)
            return .empty()
        case .detailTypeSelected(let type):
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
