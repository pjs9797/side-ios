//
//  TPFabButton.swift
//  SharedDSKit
//
//  Created by yoonyeosong on 2023/11/21.
//

import UIKit

public class TPFabButton: UIView {
    public var fapOffButton: UIButton = {
        var button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconFabOff.image, for: .normal)
        return button
    }()
    
    public var fapOnButton: UIButton = {
        var button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconFabOn.image, for: .normal)
        return button
    }()

}
