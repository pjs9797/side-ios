//
//  MockUpScheduleModel.swift
//  FeatureChat
//
//  Created by 강민성 on 12/21/23.
//

import UIKit
import Shared

public struct MockUpScheduleModel {
    public var id: Int
    public var title: String
    public var time: String
    public var location: String
    public var memberCount: String
    
    public init(id: Int, title: String, time: String, location: String, memberCount: String) {
        self.id = id
        self.title = title
        self.time = time
        self.location = location
        self.memberCount = memberCount
    }
}

