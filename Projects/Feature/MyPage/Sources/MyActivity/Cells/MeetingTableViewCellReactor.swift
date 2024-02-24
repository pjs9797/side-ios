import RxCocoa
import ReactorKit

public class MeetingTableViewCellReactor: ReactorKit.Reactor{
    public var initialState: State
    public typealias Action = NoAction
    
    public init(item: ClubContent){
        let isBookmark = item.isLeader == nil ? true : false
        let locationText = item.club.location.name == "없음" ? "온라인" : item.club.location.region2
        
        self.initialState = State(meetingImage: item.club.mainImageUrl, typeText: item.club.type, isLeader: item.isLeader ?? false, isBookmark: isBookmark , titleText: item.club.name, locationText: locationText, currentMemberCnt: String(item.club.memberCurrentNumber), maxMemberCnt: String(item.club.memberMaxNumber), categoryText: item.club.categoryMajor)
    }
    
    public struct State {
        var meetingImage: String
        var typeText: String
        var isLeader: Bool
        var isBookmark: Bool
        var titleText: String
        var locationText: String
        var currentMemberCnt: String
        var maxMemberCnt: String
        var categoryText: String
    }
}
