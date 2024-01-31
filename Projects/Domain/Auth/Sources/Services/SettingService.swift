//
//  SettingService.swift
//  CoreNetwork
//
//  Created by 강민성 on 1/17/24.
//

import Foundation

import CoreNetwork

public enum SignInType: String {
    case kakao
    case apple
    case email
}

public final class SettingService {
    
    static let shared = SettingService()
    
    private init() {}
    
    public var accessToken: String {
        get  {
            return TokenUtils.shared.read(account: "accessToken") ?? ""
        }
        
        set {
            return TokenUtils.shared.create(account: "accessToken", value: newValue)
        }
    }
    
    public var refreshToken: String {
        get {
            return TokenUtils.shared.read(account: "refreshToken") ?? ""
        }
        
        set {
            return TokenUtils.shared.create(account: "refreshToken", value: newValue)
        }
    }
    
    @UserDefault(key: "isSignedIn", defaultValue: false)
    public var isSignedIn: Bool
    
    @UserDefault(key: "kakaoAccessToken", defaultValue: "")
    public var kakaoAccessToken: String
    
    public var previousSignInType: SignInType {
        get {
            return SignInType(rawValue: UserDefaults.standard.string(forKey: "previousSignInTpye") ?? "email") ?? .email
        }
        
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "previousSignInType")
        }
    }
    
    public var isFirstAppLaunch: Bool {
        get {
            let isFirstLaunch = UserDefaults.standard.bool(forKey: "hadLaunchedBefore")
            if isFirstLaunch {
                UserDefaults.standard.set(true, forKey: "hadLaunchedBefore")
            }
            
            return isFirstLaunch
        }
    }
    
    func removeSettings() {
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key.description)
        }
    }
    
    func signOut() {
        isSignedIn = false
        accessToken = ""
        refreshToken = ""
        kakaoAccessToken = ""
    }
}
