import Foundation
import ReactorKit
import RxFlow
import RxCocoa
import Domain

class MyActivityReactor: ReactorKit.Reactor, Stepper {
    let initialState: State
    var steps = PublishRelay<Step>()
    let provider: ServiceProviderType
    var myClubCount: Int
    var clubBookmarkCount: Int
    
    init(provider: ServiceProviderType, myClubCount: Int, clubBookmarkCount: Int) {
        self.initialState = State()
        self.provider = provider
        self.myClubCount = myClubCount
        self.clubBookmarkCount = clubBookmarkCount
    }
    
    enum Action {
        case loadData
        case backButtonTapped
        case bookmarkButtonTapped(IndexPath)
        case updateMyMeetingTableViewContentSize(CGSize)
        case updateBookmarkMeetingTableViewContentSize(CGSize)
    }
    
    enum Mutation {
        case setMyClubs([ClubContent])
        case setBookmarkClubs([ClubContent])
        case setMyMeetingTableViewContentSize(CGSize)
        case setBookmarkMeetingTableViewContentSize(CGSize)
    }
    
    struct State {
        var myClubs: [ClubContent] = []
        var bookmarkClubs: [ClubContent] = []
        var myMeetingTableViewContentSize: CGSize = .zero
        var bookmarkMeetingTableViewContentSize: CGSize = .zero
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .loadData:
            let myClubsObservable = self.provider.myPageService.getMyClubs(page: 0, size: self.myClubCount).responseData()
                .flatMap { response, data -> Observable<Mutation> in
                    do {
                        let decoder = JSONDecoder()
                        let myClubsResponse = try decoder.decode(ClubResponse.self, from: data)
                        let myClubs = myClubsResponse.content
                        return .just(.setMyClubs(myClubs))
                    } catch {
                        return .empty()
                    }
                }
            let bookmarkClubsObservable = self.provider.myPageService.getBookmarkClubs(page: 0, size: self.clubBookmarkCount).responseData()
                .flatMap { response, data -> Observable<Mutation> in
                    do {
                        let decoder = JSONDecoder()
                        let bookmarkClubsResponse = try decoder.decode(ClubResponse.self, from: data)
                        let bookmarkClubs = bookmarkClubsResponse.content
                        return .just(.setBookmarkClubs(bookmarkClubs))
                    } catch {
                        return .empty()
                    }
                }
            
            return Observable.concat(myClubsObservable, bookmarkClubsObservable)
        case .backButtonTapped:
            self.steps.accept(MyPageStep.popViewController)
            return .empty()
        case .bookmarkButtonTapped(let indexPath):
            var updatedBookmarkClubs = currentState.bookmarkClubs
            updatedBookmarkClubs.remove(at: indexPath.row)
            return self.provider.myPageService.deleteBookmarkClub(clubId: self.currentState.bookmarkClubs[indexPath.row].club.id).responseData()
                .flatMap { response, data -> Observable<Mutation> in
                    if response.statusCode == 204 {
                        return .just(.setBookmarkClubs(updatedBookmarkClubs))
                    }
                    else{
                        return .empty()
                    }
                }
        case .updateMyMeetingTableViewContentSize(let size):
            return .just(.setMyMeetingTableViewContentSize(size))
        case .updateBookmarkMeetingTableViewContentSize(let size):
            return .just(.setBookmarkMeetingTableViewContentSize(size))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setMyClubs(let clubs):
            newState.myClubs = clubs
        case .setBookmarkClubs(let clubs):
            newState.bookmarkClubs = clubs
        case .setMyMeetingTableViewContentSize(let size):
            newState.myMeetingTableViewContentSize = size
        case .setBookmarkMeetingTableViewContentSize(let size):
            newState.bookmarkMeetingTableViewContentSize = size
        }
        return newState
    }
}
