import ReactorKit
import UIKit.UIImage

class AlbumCollectionViewCellReactor: ReactorKit.Reactor {
    let initialState: State

    init(image: UIImage?, isSelected: Bool = false) {
        self.initialState = State(image: image, isSelected: isSelected)
    }
    
    enum Action {
        case selectImage(Bool)
    }
    
    enum Mutation {
        case setSelected(Bool)
    }

    struct State {
        var image: UIImage?
        var isSelected: Bool = false
    }

    

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .selectImage(let status):
            return .just(.setSelected(status))
        }
    }

    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setSelected(let isSelected):
            newState.isSelected = isSelected
        }
        return newState
    }
}
