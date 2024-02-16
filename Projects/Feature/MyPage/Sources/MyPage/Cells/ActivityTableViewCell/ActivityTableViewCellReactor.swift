import RxCocoa
import ReactorKit
import RxFlow

public class ActivityTableViewCellReactor: ReactorKit.Reactor{
    public var initialState: State
    
    public init(titleLabelText: String, cntLabelText: String){
        self.initialState = State(titleLabelText: titleLabelText, cntLabelText: cntLabelText)
    }
    
    public enum Action {
    }
    
    public enum Mutation {
    }
    
    public struct State {
        var titleLabelText: String
        var cntLabelText: String
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
