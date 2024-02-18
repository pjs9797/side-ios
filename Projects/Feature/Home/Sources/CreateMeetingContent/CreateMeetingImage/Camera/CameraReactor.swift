import ReactorKit
import UIKit.UIImage
import RxFlow
import RxCocoa

class CameraReactor: ReactorKit.Reactor, Stepper {
    let initialState: State
    var steps = PublishRelay<Step>()

    init() {
        self.initialState = State(selectedImage: nil)
    }
    
    enum Action {
        case selectImage(UIImage)
        case dismissView
    }
    
    enum Mutation{
        
    }
    
    struct State{
        var selectedImage: UIImage?
    }

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .selectImage(let image):
            self.steps.accept(CreateMeetingStep.presentEditPhotoViewController(image: image))
            return .empty()
        case .dismissView:
            self.steps.accept(CreateMeetingStep.dismissViewController)
            return .empty()
        }
    }
}
