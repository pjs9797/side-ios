//
//  TokenUtils.swift
//  CoreNetwork
//
//  Created by 강민성 on 1/17/24.
//

import Foundation
import Security

import Alamofire

public class TokenUtils {
    
    public static let shared = TokenUtils()
    
    private let serviceIdentifier: String = Bundle.main.bundleIdentifier ?? "sideteam.io.tp"
    
    public func create(account: String, value: String) {
        let keychainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: serviceIdentifier,
            kSecAttrAccount: account,
            kSecValueData: value.data(using: .utf8, allowLossyConversion: false)!
        ]
        
        SecItemDelete(keychainQuery)
        
        let status: OSStatus = SecItemAdd(keychainQuery, nil)
        assert(status == noErr, "토큰 저장 실패")
    }
    
    public func read(account: String) -> String? {
        let keychainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: serviceIdentifier,
            kSecAttrAccount: account,
            kSecReturnData: kCFBooleanTrue,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(keychainQuery, &dataTypeRef)
        
        if(status == errSecSuccess) {
            let retrievedData = dataTypeRef as! Data
            let value = String(data: retrievedData, encoding: String.Encoding.utf8)
            
            return value
        }
        else {
            print("Error: status code \(status)")
            
            return nil
        }
    }
    
    func delete(account: String) {
        let keychainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: serviceIdentifier,
            kSecAttrAccount: account
        ]
        
        let status = SecItemDelete(keychainQuery)
        assert(status == noErr, "Failed: status code \(status)")
    }
}
