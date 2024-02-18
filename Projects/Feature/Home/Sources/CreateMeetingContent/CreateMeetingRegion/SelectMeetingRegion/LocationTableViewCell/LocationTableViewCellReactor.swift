import RxSwift
import RxCocoa
import ReactorKit

class LocationTableViewCellReactor: ReactorKit.Reactor{
    var initialState: State
    typealias Action = NoAction
    
    init(locationName: String){
        self.initialState = State(locationName: locationName)
    }
    
    struct State {
        var locationName: String
    }
}
