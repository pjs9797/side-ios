//
//  SignUpService.swift
//  CoreNetwork
//
//  Created by 강민성 on 1/17/24.
//

import Foundation
import DomainAuthInterface

import RxSwift
import RxFlow
import Alamofire
import RxAlamofire

public final class SignUpService: APIService {
    
    public var signUpWithKakaoData: SignUpWithKakaoData? = nil
    public var signUpWithAppleData: SignUpWithAppleData? = nil
    public var signUpWithEmailData: SignUpWithEmailData? = nil
    
    func removeAllSignUpData() {
        signUpWithKakaoData = nil
        signUpWithKakaoData = SignUpWithKakaoData()
        
        signUpWithAppleData = nil
        signUpWithAppleData = SignUpWithAppleData()
        
        signUpWithEmailData = nil
        signUpWithEmailData = SignUpWithEmailData()
    }
    
    func signUpWithKakao() -> Observable<DataRequest> {
        
        guard let jobCategory = signUpWithKakaoData?.jobCategory,
              let wantDevelopCategory = signUpWithKakaoData?.wantDevelopCategory,
              let wantHobbyCategory = signUpWithKakaoData?.wantHobbyCategory,
              let gender = signUpWithKakaoData?.gender,
              let birthDate = signUpWithKakaoData?.birthDate,
              let nickname = signUpWithKakaoData?.nickname,
              let socialID = signUpWithKakaoData?.socialID,
              // 나중에 받는것들
              let phoneNumber = signUpWithKakaoData?.phoneNumber
        else { return .error(fatalError()) }
        
        var parameters = Parameters()
        parameters.updateValue(jobCategory, forKey: "jobCategory")
        
        // 자기계발 카테고리 리퀘스트 시, 전달 모델 생각할것 ❗️
        var developmentCategory = wantDevelopCategory.map { String($0) }.joined(separator: ",")
        parameters.updateValue(developmentCategory, forKey: "wantDevelopCategory")
        
        // 취미 카테고리 리퀘스트 시, 전달 모델 생각할것 ❗️
        var hobbyCategory = wantHobbyCategory.map { String($0) }.joined(separator: ",")
        
        parameters.updateValue(hobbyCategory, forKey: "wantHobbyCategory")
        parameters.updateValue(gender, forKey: "gender")
        parameters.updateValue(birthDate, forKey: "birthDate")
        parameters.updateValue(nickname, forKey: "nickname")
        parameters.updateValue(socialID, forKey: "socialID")
        parameters.updateValue(phoneNumber, forKey: "phoneNumber")
        parameters.updateValue("KAKAO", forKey: "type")
        
        return request(.post, "ASD", useAuthHeader: false, parameters: parameters)
    }
    
    func signUpWithApple() -> Observable<DataRequest> {
        
        guard let jobCategory = signUpWithAppleData?.jobCategory,
              let wantDevelopCategory = signUpWithAppleData?.wantDevelopCategory,
              let wantHobbyCategory = signUpWithAppleData?.wantHobbyCategory,
              let gender = signUpWithAppleData?.gender,
              let birthDate = signUpWithAppleData?.birthDate,
              let nickname = signUpWithAppleData?.nickname,
              let socialID = signUpWithAppleData?.socialID,
              // 나중에 받는것들
              let phoneNumber = signUpWithAppleData?.phoneNumber
        else { return .error(fatalError()) }
        
        var parameters = Parameters()
        parameters.updateValue(jobCategory, forKey: "jobCategory")
        
        // 자기계발 카테고리 리퀘스트 시, 전달 모델 생각할것 ❗️
        var developmentCategory = wantDevelopCategory.map { String($0) }.joined(separator: ",")
        parameters.updateValue(developmentCategory, forKey: "wantDevelopCategory")
        
        // 취미 카테고리 리퀘스트 시, 전달 모델 생각할것 ❗️
        var hobbyCategory = wantHobbyCategory.map { String($0) }.joined(separator: ",")
        
        parameters.updateValue(hobbyCategory, forKey: "wantHobbyCategory")
        parameters.updateValue(gender, forKey: "gender")
        parameters.updateValue(birthDate, forKey: "birthDate")
        parameters.updateValue(nickname, forKey: "nickname")
        parameters.updateValue(socialID, forKey: "socialID")
        parameters.updateValue(phoneNumber, forKey: "phoneNumber")
        parameters.updateValue("APPLE", forKey: "type")
        
        return request(.post, "ASD", useAuthHeader: false, parameters: parameters)
    }
    
    func signUpWithEmail() -> Observable<DataRequest> {
        
        guard let jobCategory = signUpWithAppleData?.jobCategory,
              let wantDevelopCategory = signUpWithAppleData?.wantDevelopCategory,
              let wantHobbyCategory = signUpWithAppleData?.wantHobbyCategory,
              let gender = signUpWithAppleData?.gender,
              let birthDate = signUpWithAppleData?.birthDate,
              let phoneNumber = signUpWithAppleData?.phoneNumber,
              let nickname = signUpWithAppleData?.nickname,
              let email = signUpWithEmailData?.email,
              let password = signUpWithEmailData?.password
        else { return .error(fatalError()) }
        
        var parameters = Parameters()
        parameters.updateValue(jobCategory, forKey: "jobCategory")
        
        // 자기계발 카테고리 리퀘스트 시, 전달 모델 생각할것 ❗️
        var developmentCategory = wantDevelopCategory.map { String($0) }.joined(separator: ",")
        parameters.updateValue(developmentCategory, forKey: "wantDevelopCategory")
        
        // 취미 카테고리 리퀘스트 시, 전달 모델 생각할것 ❗️
        var hobbyCategory = wantHobbyCategory.map { String($0) }.joined(separator: ",")
        
        parameters.updateValue(hobbyCategory, forKey: "wantHobbyCategory")
        parameters.updateValue(gender, forKey: "gender")
        parameters.updateValue(birthDate, forKey: "birthDate")
        parameters.updateValue(nickname, forKey: "nickname")
        parameters.updateValue(phoneNumber, forKey: "phoneNumber")
        parameters.updateValue(email, forKey: "email")
        parameters.updateValue(password, forKey: "password")
        parameters.updateValue("APPLE", forKey: "type")
        
        return request(.post, "ASD", useAuthHeader: false, parameters: parameters)
    }
    
    func verificatePhoneNumber(verificationNumber: String, phoneNumber: String) -> Observable<DataRequest> {
        var parameters = Parameters()
        parameters.updateValue(verificationNumber, forKey: "verificationNumber")
        parameters.updateValue(phoneNumber, forKey: "phoneNumber")
        
        return request(.post, "ASDASD", useAuthHeader: false, parameters: parameters)
    }
    
    func sendVerificationMessage(phoneNumber: String) -> Observable<DataRequest> {
        var parameters = Parameters()
        parameters.updateValue(phoneNumber, forKey: "phoneNumber")
        
        return request(.post, "GAAD", useAuthHeader: false, parameters: parameters)
    }
    
    func checkNickNameDuplication(nickname: String) -> Observable<DataRequest> {
        var parameters = Parameters()
        parameters.updateValue(nickname, forKey: "nickname")
        
        return request(.get, "ASDA", useAuthHeader: false, parameters: parameters, encoding: URLEncoding.default)
    }
    
    func checkPhoneNumberDuplication(phoneNumber: String) -> Observable<DataRequest> {
        var parameters = Parameters()
        parameters.updateValue(phoneNumber, forKey: "phoneNumber")
        
        return request(.get, "ASDAS", useAuthHeader: false, parameters: parameters, encoding: URLEncoding.default)
    }
    
    public func setUserPassword(phoneNumber: String, password: String) -> Observable<DataRequest> {
        var parameters = Parameters()
        parameters.updateValue(phoneNumber, forKey: "phoneNumber")
        parameters.updateValue(password, forKey: "password")
        
        return request(.post, "ASDASD", useAuthHeader: false, parameters: parameters)
    }
}
