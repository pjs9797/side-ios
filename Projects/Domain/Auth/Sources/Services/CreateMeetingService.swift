import RxSwift
import UIKit
import Alamofire
import RxAlamofire

public final class CreateMeetingService: APIService {
    func createMeeting(name: String, description: String, memberMaxNumber: Int, startAt: String, mainImage: String, categoryMajor: String, categorySub: String, type: String, activityType: String, locationInfo: String, locationDetail: String?) -> Observable<DataRequest> {
        var parameters: Parameters = [
            "name": name,
            "description": description,
            "memberMaxNumber": memberMaxNumber,
            "startAt": startAt,
            "mainImage": mainImage,
            "categoryMajor": categoryMajor,
            "categorySub": categorySub,
            "type": type,
            "activityType": activityType,
            "locationInfo": locationInfo
        ]
        if let locationDetail = locationDetail {
            parameters.updateValue(locationDetail, forKey: "locationDetail")
        }
        
        return request(.post, "/api/v1/clubs", useAuthHeader: true, parameters: parameters)
    }
    
    func transformImageToURL(image: [UIImage?]) -> Observable<UploadRequest> {
        return upload(.post, "/api/v1/files", useAuthHeader: true, images: image)
    }
    
    func searchLocation(address: String) -> Observable<DataRequest> {
        
        return request(.get, "/api/v1/locations/search?address=\(address)", useAuthHeader: true, encoding: URLEncoding.default)
    }
    
    public func getLocation(longitude: String, latitude: String) -> Observable<DataRequest> {
        
        return request(.get, "/api/v1/locations/coordinate?longitude=\(longitude)&latitude=\(latitude)", useAuthHeader: true, encoding: URLEncoding.default)
    }
}
