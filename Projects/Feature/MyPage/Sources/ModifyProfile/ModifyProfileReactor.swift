import Foundation
import RxCocoa
import ReactorKit
import RxFlow
import Domain

public class ModifyProfileReactor: ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    let provider: ServiceProviderType
    
    public init(provider: ServiceProviderType){
        self.initialState = State()
        self.provider = provider
    }
    
    public enum Action {
        case loadData
        case backButtonTapped
        case saveButtonTapped
        case updateNickname(String)
        case updateBirth(String)
        case updatePosition(String)
        case positionTextFieldViewTapped
        case toggleDevelopItem(IndexPath)
        case toggleHobbyItem(IndexPath)
        case updateDevelopContentSize(CGSize)
        case updateHobbyContentSize(CGSize)
    }
    
    public enum Mutation {
        case setProfileImage(String)
        case setNickname(String)
        case setBitrh(String)
        case setPosition(String)
        case updateDevelopCellData([ModifyProfileCellData])
        case updateHobbyCellData([ModifyProfileCellData])
        case toggleDevelopItem(IndexPath)
        case toggleHobbyItem(IndexPath)
        case setDevelopContentSize(CGSize)
        case setHobbyContentSize(CGSize)
    }
    
    public struct State {
        var developCellData: [ModifyProfileCellData] = DevelopCellData.cellData
        var hobbyCellData: [ModifyProfileCellData] = HobbyCellData.cellData
        var profileImage: String = ""
        var nickname: String = ""
        var birth: String = ""
        var position: String = ""
        var developContentSize: CGSize = .zero
        var hobbyContentSize: CGSize = .zero
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .loadData:
            return self.provider.myPageService.getMyProfile().responseData()
                .flatMap { response, data -> Observable<Mutation> in
                    do {
                        let decoder = JSONDecoder()
                        let myProfileResponse = try decoder.decode(GetMyProfileResponse.self, from: data)
                        let nickname = myProfileResponse.nickname
                        let profileImage = myProfileResponse.profileImageUrl
                        let birth = myProfileResponse.birth
                        let position = myProfileResponse.jobMajor
                        let updatedDevelopCellData = self.currentState.developCellData.map { cell -> ModifyProfileCellData in
                            var modifiedCell = cell
                            modifiedCell.isSelected = myProfileResponse.develops.contains { $0 == cell.item }
                            return modifiedCell
                        }
                        let updatedHobbyCellData = self.currentState.hobbyCellData.map { cell -> ModifyProfileCellData in
                            var modifiedCell = cell
                            modifiedCell.isSelected = myProfileResponse.hobbies.contains{ $0 == cell.item }
                            return modifiedCell
                        }
                        return Observable.concat([
                            .just(.setProfileImage(profileImage)),
                            .just(.setNickname(nickname)),
                            .just(.setBitrh(birth)),
                            .just(.setPosition(position)),
                            .just(.updateDevelopCellData(updatedDevelopCellData)),
                            .just(.updateHobbyCellData(updatedHobbyCellData))
                        ])
                    } catch {
                        return .empty()
                    }
                }
        case .backButtonTapped:
            self.steps.accept(MyPageStep.popViewController)
            return .empty()
        case .saveButtonTapped:
            let clubCategories = (self.currentState.developCellData + self.currentState.hobbyCellData)
                .filter { $0.isSelected }
                .map { $0.item }
            return self.provider.myPageService.modifyMyProfile(nickname: self.currentState.nickname, birth: self.currentState.birth, profileImageUrl: self.currentState.profileImage, jobCategory: self.currentState.position, clubCategories: clubCategories).responseData()
                .flatMap{ response, data -> Observable<Mutation> in
                    self.steps.accept(MyPageStep.popViewController)
                    return .empty()
                }
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
        case .updatePosition(let position):
            return .just(.setPosition(position))
        case .positionTextFieldViewTapped:
            self.steps.accept(MyPageStep.presentToSelectPositionViewController)
            return .empty()
        case .toggleDevelopItem(let indexPath):
            return .just(.toggleDevelopItem(indexPath))
        case .toggleHobbyItem(let indexPath):
            return .just(.toggleHobbyItem(indexPath))
        case .updateDevelopContentSize(let size):
            return .just(.setDevelopContentSize(size))
        case .updateHobbyContentSize(let size):
            return .just(.setHobbyContentSize(size))
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .updateDevelopCellData(let cellData):
            newState.developCellData = cellData
        case .updateHobbyCellData(let cellData):
            newState.hobbyCellData = cellData
        case .setProfileImage(let image):
            newState.profileImage = image
        case .setNickname(let nickname):
            newState.nickname = nickname
        case .setBitrh(let birth):
            newState.birth = birth
        case .setPosition(let position):
            newState.position = position
        case .toggleDevelopItem(let indexPath):
            newState.developCellData[indexPath.row].isSelected.toggle()
        case .toggleHobbyItem(let indexPath):
            newState.hobbyCellData[indexPath.row].isSelected.toggle()
        case .setDevelopContentSize(let size):
            newState.developContentSize = size
        case .setHobbyContentSize(let size):
            newState.hobbyContentSize = size
        }
        return newState
    }
}
