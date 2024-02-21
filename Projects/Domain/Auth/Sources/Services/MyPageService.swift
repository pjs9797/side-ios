import RxSwift
import UIKit
import Alamofire
import RxAlamofire

public final class MyPageService: APIService {
    public override init(baseURL: String, isLogging: Bool = false, configuration: URLSessionConfiguration = .default) {
        super.init(baseURL: baseURL, isLogging: isLogging, configuration: configuration)
    }
    
    public func getMyProfile() -> Observable<DataRequest> {
        
        return request(.get, "/api/v1/accounts/me/profiles", useAuthHeader: true)
    }
    
    
    public func modifyMyProfile(nickname: String, birth: String, profileImageUrl: String, jobCategory: String, clubCategories: [String]) -> Observable<DataRequest> {
        var parameters: Parameters = [
            "nickname": nickname,
            "birth": birth,
            "profileImageUrl": profileImageUrl,
            "jobCategory": jobCategory,
            "clubCategories": clubCategories
        ]
        
        return request(.put, "/api/v1/accounts/me/profiles", useAuthHeader: true, parameters: parameters)
    }
}
