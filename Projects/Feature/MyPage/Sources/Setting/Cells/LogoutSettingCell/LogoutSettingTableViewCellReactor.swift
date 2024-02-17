import RxCocoa
import ReactorKit

public class LogoutSettingTableViewCellReactor: ReactorKit.Reactor{
    public var initialState: State
    public typealias Action = NoAction
    
    public init(mainLabelText: String){
        self.initialState = State(mainLabelText: mainLabelText)
    }
    
    public struct State {
        var mainLabelText: String
    }
}
