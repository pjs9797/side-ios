//
//  BaseResponse.swift
//  DomainAuthInterface
//
//  Created by 강민성 on 1/21/24.
//

import Foundation

public struct BaseResponse: Decodable {
    let code: String
    let isSuccess: Bool
    public let message, result: String
}
