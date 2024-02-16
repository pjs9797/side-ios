import RxCocoa
import ReactorKit
import RxFlow

public class InterestCollectionViewCellReactor: ReactorKit.Reactor{
    public var initialState: State
    
    public init(titleLabelText: String){
        self.initialState = State(titleLabelText: titleLabelText)
    }
    
    public enum Action {
    }
    
    public enum Mutation {
    }
    
    public struct State {
        var titleLabelText: String
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
