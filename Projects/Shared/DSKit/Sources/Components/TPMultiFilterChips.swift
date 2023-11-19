//
//  TPMultiFilterChips.swift
//  SharedDSKit
//
//  Created by yoonyeosong on 2023/11/19.
//

import UIKit

public class TPMultiFilterChips: UIView {


    public var enabledChips: UIButton = { //active되지 않았을 때, 다중선택 가능
        
        var chips = UIButton()

        chips.layer.cornerRadius = 20
        chips.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        chips.layer.borderWidth = 1

        chips.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        chips.titleLabel?.font = Fonts.SH01.font

        chips.imageView?.contentMode = .scaleAspectFit
        chips.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)

        return chips
    }()

    public var activeChips: UIButton = { //active되었을 때, 다중선택 가능
        var chips = UIButton()
        chips.layer.cornerRadius = 20
        chips.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        chips.layer.borderWidth = 1

        chips.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
        chips.titleLabel?.font = Fonts.SH01Bold.font

        chips.imageView?.contentMode = .scaleAspectFit
        chips.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)

        return chips

    }()
}
