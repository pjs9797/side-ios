import RxCocoa
import ReactorKit
import RxFlow

public class TermsSettingTableViewCellReactor: ReactorKit.Reactor{
    public var initialState: State
    
    public init(mainLabelText: String){
        self.initialState = State(mainLabelText: mainLabelText)
    }
    
    public enum Action {
    }
    
    public enum Mutation {
    }
    
    public struct State {
        var mainLabelText: String
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        }
        return newState
    }
}
