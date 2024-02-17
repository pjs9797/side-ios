import RxCocoa
import ReactorKit

public class DevelopHobbyCollectionViewReactor: ReactorKit.Reactor{
    public var initialState: State
    public typealias Action = NoAction
    
    public init(title: String, isSelected: Bool) {
        self.initialState = State(title: title, isSelected: isSelected)
    }
    
    public struct State {
        var title: String
        var isSelected: Bool
    }
}
