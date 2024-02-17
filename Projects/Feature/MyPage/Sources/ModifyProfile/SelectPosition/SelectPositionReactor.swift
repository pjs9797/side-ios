import Foundation
import RxCocoa
import ReactorKit
import RxFlow

public class SelectPositionReactor: ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    
    public init(){
        self.initialState = State()
    }
    
    public enum Action {
        case selectPosition(IndexPath)
        case dimmedViewTapped
        case swipeGesturePerformed
    }
    
    public enum Mutation {
        case setPosition(String)
        case dismissView
    }
    
    public struct State {
        var cellData: [PositionCollectionViewModel] = PositionCollectionViewCellData.cellData
        var isDismissed: Bool = false
        var position: String = ""
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .selectPosition(let indexPath):
            let item = self.currentState.cellData[indexPath.row].title
            return Observable.concat([
                .just(.dismissView),
                .just(.setPosition(item))
            ])
        case .dimmedViewTapped, .swipeGesturePerformed:
            return .just(.dismissView)
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .dismissView:
            newState.isDismissed = true
        case .setPosition(let position):
            newState.position = position
        }
        return newState
    }
}
