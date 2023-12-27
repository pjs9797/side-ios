//
//  NoticeModel.swift
//  FeatureChatInterface
//
//  Created by 강민성 on 12/25/23.
//

import Foundation

public struct ScheduleModel {
    var title: String
    var currentMember: Int
    var maximumCount: Int
    var date: String
    var time: String
    var location: String
    var budget: String
    var description: String
    var memberList: [MemberListDataModel]
    
    public init(
        title: String,
        currentMember: Int,
        maximumCount: Int,
        date: String,
        time: String,
        location: String,
        budget: String,
        description: String,
        memberList: [MemberListDataModel])
    {
        self.title = title
        self.currentMember = currentMember
        self.maximumCount = maximumCount
        self.date = date
        self.time = time
        self.location = location
        self.budget = budget
        self.description = description
        self.memberList = memberList
    }
}
