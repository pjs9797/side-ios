import Foundation
import ReactorKit
import RxCocoa
import RxFlow

class HobbyDetailTableViewCellReactor: ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    
    init(hobbyModel: HobbyModel, tableViewIndexPath: IndexPath) {
        self.initialState = State(tableViewIndexPath: tableViewIndexPath, hobbyModel: hobbyModel, hobbyDetailModels: hobbyModel.hobbyDetailModel)
    }
    
    enum Action {
        case toggleCollectionView
        case selectCollectionViewItem(tableViewIndexPath: IndexPath, collectionViewIndexPath: IndexPath)
        case none
    }
    
    enum Mutation {
        case setCollectionViewHidden(Bool)
        case setCollectionViewHeight(CGFloat)
        case setSelectedCollectionViewItem(tableViewIndexPath: IndexPath, collectionViewIndexPath: IndexPath)
    }
    
    struct State {
        var currentCollectionViewIndexPath: (tableViewIndexPath: IndexPath, collectionViewIndexPath: IndexPath)? = nil
        var tableViewIndexPath: IndexPath
        var hobbyModel: HobbyModel
        var hobbyDetailModels: [HobbyDetailModel]
        var isCollectionViewHidden: Bool = true
        var collectionViewHeight: CGFloat = 0
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .toggleCollectionView:
            let isCurrentlyHidden = self.currentState.isCollectionViewHidden
            let newHiddenState = !isCurrentlyHidden
            let itemCount = self.currentState.hobbyModel.hobbyDetailModel.count
            let rowHeight: CGFloat = 77
            let spacing: CGFloat = 20
            let rows = CGFloat((itemCount + 3) / 4)
            let collectionViewHeight = rows * rowHeight + (rows - 1) * spacing
            let newHeight = newHiddenState ? 0 : collectionViewHeight
            return Observable.concat([
                .just(.setCollectionViewHidden(newHiddenState)),
                .just(.setCollectionViewHeight(newHeight))
            ])
        case .selectCollectionViewItem(let tableViewIndexPath, let collectionViewIndexPath):
            return Observable.just(.setSelectedCollectionViewItem(tableViewIndexPath: tableViewIndexPath, collectionViewIndexPath: collectionViewIndexPath))
        case .none:
            return .empty()
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setCollectionViewHidden(let hidden):
            newState.isCollectionViewHidden = hidden
        case .setCollectionViewHeight(let height):
            newState.collectionViewHeight = height
        case .setSelectedCollectionViewItem(let tableViewIndexPath, let collectionViewIndexPath):
            let indexPaths = (tableViewIndexPath, collectionViewIndexPath)
            newState.currentCollectionViewIndexPath = indexPaths
        }
        return newState
    }
}
