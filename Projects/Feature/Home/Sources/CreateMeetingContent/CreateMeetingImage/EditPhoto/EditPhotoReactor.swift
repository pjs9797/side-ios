import ReactorKit
import UIKit.UIImage
import RxFlow
import RxCocoa

class EditPhotoReactor: ReactorKit.Reactor, Stepper {
    static let shared = EditPhotoReactor()
    let initialState: State
    var steps = PublishRelay<Step>()

    init() {
        self.initialState = State(image: nil)
    }
    
    enum Action {
        case setImage(UIImage?)
        case clearImage
        case doubleDismissView
        case dismissView
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
        case .doubleDismissView:
            self.steps.accept(CreateMeetingStep.doubleDismissViewController)
            return .empty()
        case .dismissView:
            self.steps.accept(CreateMeetingStep.dismissViewController)
            return .empty()
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
