import RxCocoa
import ReactorKit

public class InfoSettingTableViewCellReactor: ReactorKit.Reactor{
    public var initialState: State
    
    public init(mainLabelText: String, infoLabelText: String){
        self.initialState = State(mainLabelText: mainLabelText, infoLabelText: infoLabelText)
    }
    
    public enum Action {
    }
    
    public enum Mutation {
    }
    
    public struct State {
        var mainLabelText: String
        var infoLabelText: String
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
