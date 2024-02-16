import Foundation
import RxCocoa
import ReactorKit
import RxFlow

public class MyPageReactor: ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    
    public init(){
        self.initialState = State()
    }
    
    public enum Action {
        case loadCellData
        case settingButtonTapped
        case modifyButtonTapped
        case updateContentSize(CGSize)
    }
    
    public enum Mutation {
        case setCollectionViewCellData([String])
        case setTableViewCellData([ActivitySection])
        case setContentSize(CGSize)
    }
    
    public struct State {
        var collectionViewCellData: [String] = []
        var tableViewCellData: [ActivitySection] = []
        var contentSize: CGSize = .zero
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .loadCellData:
            let CollectionViewCellData = [ "음악 · 악기", "문화 · 예술", "운동 · 스포츠", "운동 · 스포츠", "운동 · 스포", "이직준비" ]
            let tableViewCellData = [
                ActivitySection(header: "모임", items: [
                    ActivityTableViewItem(title: "내 모임", cnt: "4"),
                    ActivityTableViewItem(title: "진행 모임", cnt: "7")
                ])
            ]
            return Observable.concat([
                .just(.setCollectionViewCellData(CollectionViewCellData)),
                .just(.setTableViewCellData(tableViewCellData))
            ])
        case .settingButtonTapped:
            self.steps.accept(MyPageStep.goToSettingViewController)
            return .empty()
        case .modifyButtonTapped:
            return .empty()
        case .updateContentSize(let size):
            return .just(.setContentSize(size))
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setCollectionViewCellData(let cellData):
            newState.collectionViewCellData = cellData
        case .setTableViewCellData(let cellData):
            newState.tableViewCellData = cellData
        case .setContentSize(let size):
            newState.contentSize = size
        }
        return newState
    }
}
