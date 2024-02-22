//
//  SignInResponse.swift
//  FeatureSignInInterface
//
//  Created by 강민성 on 1/21/24.
//

import Foundation

public struct SignInResponse: Decodable {
    public let type: String
    public let result: SignInResult
}

public struct SignInResult: Decodable {
    public let accessToken, refreshToken, type: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken, refreshToken, type
    }
}
