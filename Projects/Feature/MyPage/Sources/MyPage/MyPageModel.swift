import RxDataSources

public struct ActivityTableViewItem: Equatable {
    var title: String
    var cnt: String
}

public struct ActivitySection: Equatable {
    var header: String
    public var items: [ActivityTableViewItem]
    
    public static func == (lhs: ActivitySection, rhs: ActivitySection) -> Bool {
        return lhs.header == rhs.header && lhs.items == rhs.items
    }
}

extension ActivitySection: SectionModelType {
    public typealias Item = ActivityTableViewItem

    public init(original: ActivitySection, items: [Item]) {
        self = original
        self.items = items
    }
}

struct GetMyProfileResponse: Codable{
    let id: Int
    let nickname: String
    let email: String
    let birth: String
    let profileImageUrl: String
    let jobMajor: String
    let develops: [String]
    let hobbies: [String]
    let myClubCount: Int
    let clubBookmarkCount: Int
}

