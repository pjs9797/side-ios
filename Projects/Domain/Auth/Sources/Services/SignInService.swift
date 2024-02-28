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
import FirebaseAuth

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
        
        return request(.post, "api/v1/auth/login", useAuthHeader: false, parameters: parameters)
    }
    
    public func sendEmailForVerificationToFindPassword(email: String) -> Observable<DataRequest> {
        var parameters = Parameters()
        parameters.updateValue(email, forKey: "email")
        
        return request(.post, "api/v1/pw/sendEmail", useAuthHeader: false, parameters: parameters)
    }
    
    public func checkCodeWithEmail(email: String, code: String) -> Observable<DataRequest> {
        var parameters = Parameters()
        parameters.updateValue(email, forKey: "email")
        parameters.updateValue(code, forKey: "code")
        
        return request(.post, "api/v1/pw/checkCode", useAuthHeader: false, parameters: parameters)
    }
    
    public func sendEmailForVerificationToFindId(email: String) -> Observable<DataRequest> {
        var parameters = Parameters()
        parameters.updateValue(email, forKey: "email")
        
        return request(.post, "api/v1/email/sendEmail", useAuthHeader: false, parameters: parameters)
    }
    
    public func setPasswordWithEmail(email: String, password: String) -> Observable<DataRequest> {
        var parameters = Parameters()
        parameters.updateValue(email, forKey: "email")
        parameters.updateValue(password, forKey: "password")
        
        return request(.post, "api/v1/pw/changePw", useAuthHeader: false, parameters: parameters)
    }
    
    public func setPasswordWithPhoneNumber(phoneNumber: String, password: String) -> Observable<DataRequest> {
        var parameters = Parameters()
        parameters.updateValue(phoneNumber, forKey: "phoneNumber")
        parameters.updateValue(password, forKey: "password")
        
        return request(.post, "api/v1/phone/pw/changePw", useAuthHeader: false, parameters: parameters)
    }
}
