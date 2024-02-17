import RxCocoa
import ReactorKit

public class InfoSettingTableViewCellReactor: ReactorKit.Reactor{
    public var initialState: State
    public typealias Action = NoAction
    
    public init(mainLabelText: String, infoLabelText: String){
        self.initialState = State(mainLabelText: mainLabelText, infoLabelText: infoLabelText)
    }
    
    public struct State {
        var mainLabelText: String
        var infoLabelText: String
    }
}
