import RxCocoa
import ReactorKit

public class InterestCollectionViewCellReactor: ReactorKit.Reactor{
    public var initialState: State
    public typealias Action = NoAction
    
    public init(titleLabelText: String){
        self.initialState = State(titleLabelText: titleLabelText)
    }
    
    public struct State {
        var titleLabelText: String
    }
}
