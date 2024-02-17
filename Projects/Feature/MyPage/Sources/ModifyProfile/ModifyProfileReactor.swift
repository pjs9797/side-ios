import Foundation
import RxCocoa
import ReactorKit
import RxFlow

public class ModifyProfileReactor: ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    
    public init(){
        self.initialState = State()
    }
    
    public enum Action {
        case loadData
        case backButtonTapped
        case updateNickname(String)
        case updateBirth(String)
        case positionTextFieldViewTapped
        case toggleDevelopItem(IndexPath)
        case toggleHobbyItem(IndexPath)
        case updateDevelopContentSize(CGSize)
        case updateHobbyContentSize(CGSize)
    }
    
    public enum Mutation {
        case setNickname(String)
        case setBitrh(String)
        case setPosition(String)
        case setSelectedDevelopItems([String])
        case setSelectedHobbyItems([String])
        case toggleDevelopItem(String)
        case toggleHobbyItem(String)
        case setDevelopContentSize(CGSize)
        case setHobbyContentSize(CGSize)
    }
    
    public struct State {
        var developCellData: [String] = DevelopCellData.cellData
        var hobbyCellData: [String] = HobbyCellData.cellData
        var nickname: String = ""
        var birth: String = ""
        var position: String = ""
        var selectedDevelopItems: [String] = []
        var selectedHobbyItems: [String] = []
        var developContentSize: CGSize = .zero
        var hobbyContentSize: CGSize = .zero
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .loadData:
            let nickname = "Test"
            let birth = "2024-01-01"
            let position = "기획 · 전략 · 경영"
            let selectedDevelopItems = ["사이드프로젝트", "스터디 · 자격증"]
            let selectedHobbyItems = ["사교 · 동네친구"]
            return Observable.concat([
                .just(.setNickname(nickname)),
                .just(.setBitrh(birth)),
                .just(.setPosition(position)),
                .just(.setSelectedDevelopItems(selectedDevelopItems)),
                .just(.setSelectedHobbyItems(selectedHobbyItems))
            ])
        case .backButtonTapped:
            self.steps.accept(MyPageStep.popViewController)
            return .empty()
        case .updateNickname(let nickname):
            return .just(.setNickname(nickname))
        case .updateBirth(let birth):
            let digitsText = birth.replacingOccurrences(of: "-", with: "")
            var formattedText = ""
            for (index, character) in digitsText.enumerated() {
                if index == 4 || index == 6 {
                    formattedText += "-"
                }
                formattedText.append(character)
            }
            let formattedBirth = formattedText.count > 10 ? String(formattedText.prefix(10)) : formattedText
            return .just(.setBitrh(formattedBirth))
        case .positionTextFieldViewTapped:
            self.steps.accept(MyPageStep.presentToSelectPositionViewController)
            return .empty()
        case .toggleDevelopItem(let indexPath):
            let item = self.currentState.developCellData[indexPath.row]
            return .just(.toggleDevelopItem(item))
        case .toggleHobbyItem(let indexPath):
            let item = self.currentState.hobbyCellData[indexPath.row]
            return .just(.toggleHobbyItem(item))
        case .updateDevelopContentSize(let size):
            return .just(.setDevelopContentSize(size))
        case .updateHobbyContentSize(let size):
            return .just(.setHobbyContentSize(size))
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setNickname(let nickname):
            newState.nickname = nickname
        case .setBitrh(let birth):
            newState.birth = birth
        case .setPosition(let position):
            newState.position = position
        case .setSelectedDevelopItems(let selectedItems):
            newState.selectedDevelopItems = selectedItems
        case .setSelectedHobbyItems(let selectedItems):
            newState.selectedHobbyItems = selectedItems
        case .toggleDevelopItem(let item):
            if newState.selectedDevelopItems.contains(item) {
                newState.selectedDevelopItems.removeAll { $0 == item }
            } else {
                newState.selectedDevelopItems.append(item)
            }
        case .toggleHobbyItem(let item):
            if newState.selectedHobbyItems.contains(item) {
                newState.selectedHobbyItems.removeAll { $0 == item }
            } else {
                newState.selectedHobbyItems.append(item)
            }
        case .setDevelopContentSize(let size):
            newState.developContentSize = size
        case .setHobbyContentSize(let size):
            newState.hobbyContentSize = size
        }
        return newState
    }
}
