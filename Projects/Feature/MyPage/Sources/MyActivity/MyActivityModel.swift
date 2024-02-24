import Foundation

public struct ClubResponse: Codable {
    let content: [ClubContent]
}

public struct ClubContent: Codable {
    let club: Club
    let isLeader: Bool?
}

public struct Club: Codable {
    let id: Int
    let name: String
    let memberCurrentNumber: Int
    let memberMaxNumber: Int
    let type: String
    let activityType: String
    let description: String
    let categoryMajor: String
    let mainImageUrl: String
    let location: Location
}

public struct Location: Codable {
    let id: Int
    let name: String
    let region1: String
    let region2: String
    let region3: String
    let region4: String
}
