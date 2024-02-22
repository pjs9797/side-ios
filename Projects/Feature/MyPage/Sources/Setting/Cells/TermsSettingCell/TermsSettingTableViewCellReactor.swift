import RxCocoa
import ReactorKit

class TermsSettingTableViewCellReactor: ReactorKit.Reactor{
    var initialState: State
    typealias Action = NoAction
    
    init(mainLabelText: String){
        self.initialState = State(mainLabelText: mainLabelText)
    }
    
    struct State {
        var mainLabelText: String
    }
    
}
