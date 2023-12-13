//
//  ConversationMockData.swift
//  FeatureChat
//
//  Created by 강민성 on 12/5/23.
//

import UIKit

public enum ConversationMockDataModel {
    case myConversation(data: MyConversationCellMockData)
    case firstConversation(data: FirstOthersConversationCellMockData)
    case othersConversation(data: OthersConversationCellMockData)
}

public struct MyConversationCellMockData {
    public var message: String
    public var time: String
    
    public init(message: String, time: String) {
        self.message = message
        self.time = time
    }
}

public struct FirstOthersConversationCellMockData {
    public var profileImage: UIImage
    public var name: String
    public  var message: String
    public var time: String
    
    public init(profileImage: UIImage, name: String, message: String, time: String) {
        self.profileImage = profileImage
        self.name = name
        self.message = message
        self.time = time
    }
}

public struct OthersConversationCellMockData {
    public var message: String
    public var time: String
    
    public init(message: String, time: String) {
        self.message = message
        self.time = time
    }
}
