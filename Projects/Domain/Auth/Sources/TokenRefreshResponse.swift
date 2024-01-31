//
//  TokenRefreshResponse.swift
//  DomainAuth
//
//  Created by 강민성 on 1/18/24.
//

import Foundation

struct TokenRefreshResponse: Decodable {
    let code: Int
    let isSuccess: Bool
    let message: String
    let result: TokenRefreshResult
}

struct TokenRefreshResult: Decodable {
    let accessToken: String
}
