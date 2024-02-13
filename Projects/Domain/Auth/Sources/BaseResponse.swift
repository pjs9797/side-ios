//
//  BaseResponse.swift
//  DomainAuthInterface
//
//  Created by 강민성 on 1/21/24.
//

import Foundation

public struct ErrorResponse: Decodable {
    public let path: String
    public let statusCode: Int
    public let detail: String
    public let reason: String
    public let error: String
    public let codeName: String
}
