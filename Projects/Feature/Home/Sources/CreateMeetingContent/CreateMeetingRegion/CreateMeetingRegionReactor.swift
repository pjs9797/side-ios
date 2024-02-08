import RxSwift
import RxCocoa
import ReactorKit
import RxFlow
import CoreLocation
import Domain

public class CreateMeetingRegionReactor: NSObject, ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    
    public override init(){
        self.initialState = State()
    }
    
    public enum Action {
        case updateOnlineSwitch(Bool)
        case regionButtonTapped
    }
    
    public enum Mutation {
        case setOnlineSwitch(Bool)
    }
    
    public struct State {
        var isOnline: Bool = true
        var regionButtonTitle: String = "읍,면,동으로 검색하세요."
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .updateOnlineSwitch(let isOn):
            return .just(.setOnlineSwitch(isOn))
        case .regionButtonTapped:
            self.steps.accept(CreateMeetingStep.presentSelectMeetingRegionViewController)
            return .empty()
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setOnlineSwitch(let isOn):
            newState.isOnline = isOn
            newState.regionButtonTitle = "읍,면,동으로 검색하세요."
            return newState
        }
    }
}
