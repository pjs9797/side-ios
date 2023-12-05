//
//  ConversationMockData.swift
//  FeatureChat
//
//  Created by 강민성 on 12/5/23.
//

import UIKit

public struct ConversationCellMockData {
    var image: UIImage
    var name: String
    var message: String
    var time: String
    
    public init(image: UIImage, name: String, message: String, time: String) {
        self.image = image
        self.name = name
        self.message = message
        self.time = time
    }
}
