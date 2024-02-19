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
    
}
