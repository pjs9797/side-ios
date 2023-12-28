//
//  MockUpNoticeData.swift
//  FeatureChatInterface
//
//  Created by 강민성 on 12/20/23.
//

import UIKit
import Shared

public struct MockUpNoticeModel {
    public var id: Int
    public var title: String
    public var dateAndAdmin: String
    public var isPinned: Bool
    
    public init(id: Int, title: String, dateAndAdmin: String, isPinned: Bool) {
        self.id = id
        self.title = title
        self.dateAndAdmin = dateAndAdmin
        self.isPinned = isPinned
    }
}

