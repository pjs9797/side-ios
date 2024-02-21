//
//  MyPageService.swift
//  DomainAuth
//
//  Created by 강민성 on 2/14/24.
//

import Foundation

import RxSwift
import Alamofire
import RxAlamofire

public final class MyPageService: APIService {
    public func getMyProfile() -> Observable<DataRequest> {
        return request(.get, "api/v1/accounts/me/profiles")
    }
}
