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
        case setRegionButtonTitle(String)
    }
    
    public enum Mutation {
        case setOnlineSwitch(Bool)
        case setRegionButtonTitle(String)
    }
    
    public struct State {
        var isOnline: Bool = true
        var regionButtonTitle: String? = "읍,면,동으로 검색하세요."
        var region: String = ""
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .updateOnlineSwitch(let isOn):
            return .just(.setOnlineSwitch(isOn))
        case .regionButtonTapped:
            self.steps.accept(CreateMeetingStep.presentSelectMeetingRegionViewController)
            return .empty()
        case .setRegionButtonTitle(let title):
            return .just(.setRegionButtonTitle(title))
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setOnlineSwitch(let isOn):
            newState.isOnline = isOn
            if isOn {
                newState.region = "온라인"
            }
            else {
                if newState.regionButtonTitle == "읍,면,동으로 검색하세요." {
                    newState.region = ""
                } else {
                    newState.region = newState.regionButtonTitle ?? ""
                }
            }
        case .setRegionButtonTitle(let title):
            newState.region = title
        }
        return newState
    }
}
