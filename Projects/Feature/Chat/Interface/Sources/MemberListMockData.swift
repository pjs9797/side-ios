//
//  MemberListMockData.swift
//  FeatureChatInterface
//
//  Created by 강민성 on 12/13/23.
//

import UIKit

public enum MemberListDataModel {
    case member(data: MemberListCellMockData)
}

public struct MemberListCellMockData {
    public var image: UIImage
    public var name: String
    public var isAdmin: Bool
    public var isMe: Bool
    
    public init(image: UIImage, name: String, isAdmin: Bool, isMe: Bool) {
        self.image = image
        self.name = name
        self.isAdmin = isAdmin
        self.isMe = isMe
    }
}
