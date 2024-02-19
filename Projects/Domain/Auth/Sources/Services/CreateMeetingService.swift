import RxSwift
import UIKit
import Alamofire
import RxAlamofire

public final class CreateMeetingService: APIService {
    public override init(baseURL: String, isLogging: Bool = false, configuration: URLSessionConfiguration = .default) {
        super.init(baseURL: baseURL, isLogging: isLogging, configuration: configuration)
    }
    public func createMeeting(name: String, description: String, memberMaxNumber: Int, startAt: String, mainImage: String, categoryMajor: String, categorySub: String?, type: String, activityType: String, locationInfo: String?, locationDetail: String?) -> Observable<DataRequest> {
        var parameters: Parameters = [
            "name": name,
            "description": description,
            "memberMaxNumber": memberMaxNumber,
            "startAt": startAt,
            "mainImage": mainImage,
            "categoryMajor": categoryMajor,
            "type": type,
            "activityType": activityType
        ]
        if let categorySub = categorySub{
            parameters.updateValue(categorySub, forKey: "categorySub")
        }
        if let locationInfo = locationInfo {
            parameters["locationInfo"] = ["location": locationInfo]
        }
        if let locationDetail = locationDetail {
            parameters.updateValue(locationDetail, forKey: "locationDetail")
        }
        
        return request(.post, "/api/v1/clubs", useAuthHeader: true, parameters: parameters)
    }
    
    public func transformImageToURL(image: [UIImage?]) -> Observable<UploadRequest> {
        
        return uploadImageFile(.post, "/api/v1/files", useAuthHeader: true, images: image)
    }
    
    public func searchLocation(address: String) -> Observable<DataRequest> {
        guard let encodedAddress = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return Observable.error(AFError.invalidURL(url: address))
        }
        
        return request(.get, "/api/v1/locations/search?address=\(encodedAddress)", useAuthHeader: true, encoding: URLEncoding.default)
    }
    
    public func getLocation(longitude: String, latitude: String) -> Observable<DataRequest> {
        
        return request(.get, "/api/v1/locations/coordinate?longitude=\(longitude)&latitude=\(latitude)", useAuthHeader: true, encoding: URLEncoding.default)
    }
}
