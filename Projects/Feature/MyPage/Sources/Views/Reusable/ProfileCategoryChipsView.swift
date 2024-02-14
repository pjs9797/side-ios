//
//  ProfileCategoryChipsView.swift
//  FeatureMyPage
//
//  Created by 강민성 on 2/13/24.
//

import UIKit
import Shared

class ProfileCategoryChipsView: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = Fonts.ST01.font
        textColor = SharedDSKitAsset.Colors.text02.color
        layer.borderWidth = 1
        layer.cornerRadius = 12
        textAlignment = .center
        layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
    }
    
    convenience init(text: String) {
        self.init()
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
