import Foundation
import RxCocoa
import ReactorKit
import RxFlow
import Domain

public class MyPageReactor: ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    let provider: ServiceProviderType
    
    public init(provider: ServiceProviderType){
        self.initialState = State()
        self.provider = provider
    }
    
    public enum Action {
        case loadData
        case settingButtonTapped
        case modifyButtonTapped
        case goToMyActivityButtonTapped
        case updateContentSize(CGSize)
    }
    
    public enum Mutation {
        case setMemberId(Int)
        case setNickname(String)
        case setEmail(String)
        case setProfileImage(String)
        case setPosition(String)
        case setCollectionViewCellData([String])
        case setTableViewCellData([ActivitySection])
        case setMyClubCount(Int)
        case setClubBookmarkCount(Int)
        case setContentSize(CGSize)
    }
    
    public struct State {
        var memberId: Int = 0
        var nickname: String = ""
        var email: String = ""
        var profileImage: String = ""
        var position: String = ""
        var collectionViewCellData: [String] = []
        var tableViewCellData: [ActivitySection] = []
        var myClubCount: Int = 0
        var clubBookmarkCount: Int = 0
        var contentSize: CGSize = .zero
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .loadData:
            return self.provider.myPageService.getMyProfile().responseData()
                .flatMap { response, data -> Observable<Mutation> in
                    do {
                        let decoder = JSONDecoder()
                        let myProfileResponse = try decoder.decode(GetMyProfileResponse.self, from: data)
                        let memberId = myProfileResponse.id
                        let nickname = myProfileResponse.nickname
                        let email = myProfileResponse.email
                        let profileImage = myProfileResponse.profileImageUrl
                        let position = myProfileResponse.jobMajor
                        let CollectionViewCellData = myProfileResponse.develops + myProfileResponse.hobbies
                        let tableViewCellData = [
                            ActivitySection(header: "모임", items: [
                                ActivityTableViewItem(title: "내 모임", cnt: String(myProfileResponse.myClubCount)),
                                ActivityTableViewItem(title: "찜한 모임", cnt: String(myProfileResponse.clubBookmarkCount))
                            ])
                        ]
                        return Observable.concat([
                            .just(.setMemberId(memberId)),
                            .just(.setNickname(nickname)),
                            .just(.setEmail(email)),
                            .just(.setProfileImage(profileImage)),
                            .just(.setPosition(position)),
                            .just(.setCollectionViewCellData(CollectionViewCellData)),
                            .just(.setTableViewCellData(tableViewCellData)),
                            .just(.setMyClubCount(myProfileResponse.myClubCount)),
                            .just(.setClubBookmarkCount(myProfileResponse.clubBookmarkCount))
                        ])
                    } catch {
                        return .empty()
                    }
                }
        case .settingButtonTapped:
            self.steps.accept(MyPageStep.goToSettingViewController(memberId: self.currentState.memberId, email: self.currentState.email))
            return .empty()
        case .modifyButtonTapped:
            self.steps.accept(MyPageStep.goToModifyProfileViewController)
            return .empty()
        case .goToMyActivityButtonTapped:
            self.steps.accept(MyPageStep.goToMyActivityViewController(myClubCount: self.currentState.myClubCount, clubBookmarkCount: self.currentState.clubBookmarkCount))
            return .empty()
        case .updateContentSize(let size):
            return .just(.setContentSize(size))
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setMemberId(let id):
            newState.memberId = id
        case .setNickname(let nickname):
            newState.nickname = nickname
        case .setEmail(let email):
            newState.email = email
        case .setProfileImage(let image):
            newState.profileImage = image
        case .setPosition(let position):
            newState.position = position
        case .setCollectionViewCellData(let cellData):
            newState.collectionViewCellData = cellData
        case .setTableViewCellData(let cellData):
            newState.tableViewCellData = cellData
        case .setMyClubCount(let cnt):
            newState.myClubCount = cnt
        case .setClubBookmarkCount(let cnt):
            newState.clubBookmarkCount = cnt
        case .setContentSize(let size):
            newState.contentSize = size
        }
        return newState
    }
}
