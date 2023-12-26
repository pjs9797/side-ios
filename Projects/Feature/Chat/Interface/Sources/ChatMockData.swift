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
    public var isAlarmOn: Bool
    
    public init(id: Int, image: UIImage, title: String, latestMessage: String, count: Int, timestamp: String, isAlarmOn: Bool) {
        self.id = id
        self.image = image
        self.title = title
        self.latestMessage = latestMessage
        self.count = count
        self.timestamp = timestamp
        self.isAlarmOn = isAlarmOn
    }
}

public struct DMMockUpChatModel {
    public var id: Int
    public var image: UIImage
    public var title: String
    public var latestMessage: String
    public var count: Int
    public var timestamp: String
    public var isAlarmOn: Bool
    
    public init(id: Int, image: UIImage, title: String, latestMessage: String, count: Int, timestamp: String, isAlarmOn: Bool) {
        self.id = id
        self.image = image
        self.title = title
        self.latestMessage = latestMessage
        self.count = count
        self.timestamp = timestamp
        self.isAlarmOn = isAlarmOn
    }
}
