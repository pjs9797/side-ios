//
//  ChatMockData.swift
//  FeatureChatInterface
//
//  Created by 강민성 on 11/23/23.
//

import UIKit
import Shared

public struct MockUpChatModel {
    public var id: Int
    public var image: UIImage
    public var title: String
    public var latestMessage: String
    public var count: Int
    public var timestamp: String
    
    public init(id: Int, image: UIImage, title: String, latestMessage: String, count: Int, timestamp: String) {
        self.id = id
        self.image = image
        self.title = title
        self.latestMessage = latestMessage
        self.count = count
        self.timestamp = timestamp
    }
    
}

public struct MockUpChatData {
    public var mockup = [MockUpChatModel(id: 1, image: SharedDSKitAsset.Icons.kakao.image, title: "영화관투어모임 영사모 >_<", latestMessage: "네 알겠습니다!", count: 122, timestamp: "12:01"), MockUpChatModel(id: 2, image: SharedDSKitAsset.Icons.kakao.image, title: "테스트", latestMessage: "테스트입니다", count: 2, timestamp: "12:01")]
}
