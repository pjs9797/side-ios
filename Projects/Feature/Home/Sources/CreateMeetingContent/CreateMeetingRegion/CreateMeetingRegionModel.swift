import Foundation

struct LocationResponse: Codable{
    let id: Int
    let name: String
    let region1: String
    let region2: String
    let region3: String
    let longitude: Double
    let latitude: Double
}