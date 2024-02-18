import ReactorKit
import UIKit.UIImage

class HobbyDetailCollectionViewCellReactor: ReactorKit.Reactor {
    var initialState: State
    
    init(hobbyDetailModel: HobbyDetailModel) {
        self.initialState = State(targetImage: hobbyDetailModel.img, title: hobbyDetailModel.title)
    }
    
    enum Action {
        case setSelected(Bool)
    }
    
    enum Mutation {
        case setSelected(Bool)
    }
    
    struct State {
        var targetImage: UIImage
        var title: String
        var isSelected: Bool = false
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .setSelected(isSelected):
            return .just(.setSelected(isSelected))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case let .setSelected(isSelected):
            state.isSelected = isSelected
        }
        return state
    }
}
