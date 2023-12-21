//
//  PaddingLabel.swift
//  FeatureChat
//
//  Created by 강민성 on 11/28/23.
//

import UIKit

class PaddingLabel: UILabel {
    private var padding = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    
    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        
        return contentSize
    }
}
