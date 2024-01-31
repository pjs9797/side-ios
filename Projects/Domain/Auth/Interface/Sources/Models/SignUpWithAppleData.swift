//
//  SignUpWithAppleData.swift
//  DomainAuthInterface
//
//  Created by 강민성 on 1/18/24.
//

import Foundation

public class SignUpWithAppleData {
    public var jobCategory: String? = nil
    public var wantDevelopCategory: [String]? = nil
    public var wantHobbyCategory: [String]? = nil
    public var gender: String? = nil
    public var birthDate: String? = nil
    public var nickname: String? = nil
    public var socialID: String? = nil
    public var phoneNumber: String? = nil
    public var type: String = "APPLE"
    
    public init() {}
}
