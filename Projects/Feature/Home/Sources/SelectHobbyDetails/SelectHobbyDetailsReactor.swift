import Foundation
import RxSwift
import RxCocoa
import ReactorKit
import RxFlow
import Shared

public class SelectHobbyDetailsReactor: ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    
    public init(){
        self.initialState = State()
    }
    
    public enum Action {
        case backButtonTapped
        case nextButtonTapped
        case updateContentSize(CGSize)
        case selectCollectionViewItem(tableViewIndexPath: IndexPath?, collectionViewIndexPath: IndexPath?)
    }
    
    public enum Mutation {
        case setContentSize(CGSize)
        case setSelectedCollectionViewItem(tableViewIndexPath: IndexPath?, collectionViewIndexPath: IndexPath?)
    }
    
    public struct State {
        var hobbyCellData: [HobbyModel] = HobbyDetailTableViewCellData.cellData
        var contentSize: CGSize = .zero
        var selectedIndexPaths: (tableViewIndexPath: IndexPath?, collectionViewIndexPath: IndexPath?)
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .backButtonTapped:
            self.steps.accept(CreateMeetingStep.popViewController)
            return .empty()
        case .nextButtonTapped:
            self.steps.accept(CreateMeetingStep.goToCreateMeetingContentViewController)
            return .empty()
        case .updateContentSize(let size):
            return .just(.setContentSize(size))
        case .selectCollectionViewItem(let tableViewIndexPath, let collectionViewIndexPath):
            return Observable.just(.setSelectedCollectionViewItem(tableViewIndexPath: tableViewIndexPath, collectionViewIndexPath: collectionViewIndexPath))
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setContentSize(let size):
            newState.contentSize = size
        case .setSelectedCollectionViewItem(let tableViewIndexPath, let collectionViewIndexPath):
            let indexPaths = (tableViewIndexPath, collectionViewIndexPath)
            newState.selectedIndexPaths = indexPaths
        }
        return newState
    }
}
