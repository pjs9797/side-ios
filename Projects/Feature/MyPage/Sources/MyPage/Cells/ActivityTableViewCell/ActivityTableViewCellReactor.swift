import RxCocoa
import ReactorKit

public class ActivityTableViewCellReactor: ReactorKit.Reactor{
    public var initialState: State
    public typealias Action = NoAction
    
    public init(titleLabelText: String, cntLabelText: String){
        self.initialState = State(titleLabelText: titleLabelText, cntLabelText: cntLabelText)
    }
    
    public struct State {
        var titleLabelText: String
        var cntLabelText: String
    }
}
