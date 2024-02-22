import RxCocoa
import ReactorKit
import RxFlow

class TermsReactor: ReactorKit.Reactor, Stepper{    
    var initialState: State
    var steps = PublishRelay<Step>()
    
    init(){
        self.initialState = State()
    }
    
    enum Action {
        case backButtonTapped
    }
    
    enum Mutation {
        
    }
    
    struct State{
        
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .backButtonTapped:
            self.steps.accept(MyPageStep.popViewController)
            return .empty()
        }
    }
}
