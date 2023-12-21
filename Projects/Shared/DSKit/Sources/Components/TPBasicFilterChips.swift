//
//  TPBasicFilterChips.swift
//  SharedDSKit
//
//  Created by yoonyeosong on 2023/11/20.
//

import UIKit

class TPBasicFilterChips: UIView {
    public var smallEnabledChips: UIButton = {
        var chips = UIButton()

        chips.layer.cornerRadius = 20
        chips.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        chips.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        chips.titleLabel?.font = Fonts.Caption.font
        chips.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        chips.semanticContentAttribute = .forceRightToLeft
        return chips
    }()
    public var smallActiveChips: UIButton = {
        var chips = UIButton()

        chips.layer.cornerRadius = 20
        chips.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
        chips.setTitleColor(SharedDSKitAsset.Colors.white.color, for: .normal)
        chips.titleLabel?.font = Fonts.ST01.font
        chips.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        chips.semanticContentAttribute = .forceRightToLeft
        return chips
    }()
    public var largeEnabledChips: UIButton = { 
        var chips = UIButton()

        chips.layer.cornerRadius = 20
        chips.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        chips.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        chips.titleLabel?.font = Fonts.SH01.font
        chips.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        chips.semanticContentAttribute = .forceRightToLeft
        return chips

    }()

    public var largeActiveChips: UIButton = {
        var chips = UIButton()

        chips.layer.cornerRadius = 20
        chips.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
        chips.setTitleColor(SharedDSKitAsset.Colors.white.color, for: .normal)
        chips.titleLabel?.font = Fonts.SH01.font
        chips.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        chips.semanticContentAttribute = .forceRightToLeft

        return chips
    }()
}

