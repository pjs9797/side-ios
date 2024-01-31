//
//  UserService.swift
//  CoreNetwork
//
//  Created by 강민성 on 1/17/24.
//

import Foundation

import RxSwift
import Alamofire
import RxAlamofire

public final class UserService: APIService {
    
    func refresh() -> Observable<DataRequest> {
        return request(.post, "someRefresh")
    }
}
