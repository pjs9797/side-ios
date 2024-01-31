//
//  SignInService.swift
//  CoreNetwork
//
//  Created by 강민성 on 1/15/24.
//

import Foundation

import RxSwift
import Alamofire
import RxAlamofire

public final class SignInService: APIService {
    
    func signInWithKakao(oAuthToken: String) -> Observable<DataRequest> {
        var parameters = Parameters()
        parameters.updateValue(oAuthToken, forKey: "accessToken")
        
        return request(.post, "AGAGWQEA", useAuthHeader: false, parameters: parameters)
    }
    
    func signInWithApple(oAuthToken: String) -> Observable<DataRequest> {
        var parameters = Parameters()
        parameters.updateValue(oAuthToken, forKey: "accessToken")
        
        return request(.post, "ASDASFG", useAuthHeader: false, parameters: parameters)
    }
    
    public func signIn(email: String, password: String) -> Observable<DataRequest> {
        var parameters = Parameters()
        parameters.updateValue(email, forKey: "email")
        parameters.updateValue(password, forKey: "password")
        
        return request(.post, "ASFASGA", useAuthHeader: false, parameters: parameters)
    }
}
