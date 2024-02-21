//
//  MyPageResponse.swift
//  FeatureMyPageInterface
//
//  Created by 강민성 on 2/21/24.
//

import Foundation

/*
 {
   "id": 0,
   "phoneNumber": "string",
   "nickname": "string",
   "email": "string",
   "birth": "2024-02-21",
   "profileImageUrl": "string",
   "jobMajor": "기획 · 전략 · 경영",
   "develops": [
     "사이드 프로젝트"
   ],
   "hobbies": [
     "사이드 프로젝트"
   ],
   "myClubCount": 0,
   "clubBookmarkCount": 0
 }
 */

public struct MyPageResponse: Decodable {
    public let result: MyPageResult
    
//    enum CodingKeys: String, CodingKey {
//        case phoneNumber, nickname, email, birth, profileImageUrl, jobMajor, hobbies, clubBookmarkCount
//    }
}

public struct MyPageResult: Decodable {
    let id : Int
    public let phoneNumber: String
    public let nickname: String
    public let email: String
    public let birth: String
    public let profileImageUrl: String
    public let jobMajor: String
    public let develops: [String]
    public let hobbies: [String]
    public let myClubCount: Int
    public let clubBookmarkCount: String
}
