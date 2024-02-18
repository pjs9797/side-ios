import RxCocoa
import UIKit.UIImage
import ReactorKit
import RxFlow

class PositionCollectionViewReactor: ReactorKit.Reactor{
    var initialState: State
    typealias Action = NoAction
    
    init(image: UIImage, title: String){
        self.initialState = State(image: image, title: title)
    }
    
    struct State {
        var image: UIImage
        var title: String
    }
}
