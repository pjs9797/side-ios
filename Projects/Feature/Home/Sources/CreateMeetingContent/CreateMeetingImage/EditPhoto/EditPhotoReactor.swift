import ReactorKit
import UIKit

class EditPhotoReactor: ReactorKit.Reactor {
    static let shared = EditPhotoReactor()
    let initialState: State

    init() {
        self.initialState = State(image: nil)
    }
    
    enum Action {
        case setImage(UIImage?)
        case clearImage
    }

    enum Mutation {
        case setImage(UIImage?)
    }

    struct State {
        var image: UIImage?
    }

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .setImage(let image):
            return .just(.setImage(image))
        case .clearImage:
            return .just(.setImage(nil))
        }
    }

    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setImage(let image):
            newState.image = image
        }
        return newState
    }
}
