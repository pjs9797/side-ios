//
//  TPPrimeryButton.swift
//  SharedDSKit
//
//  Created by yoonyeosong on 2023/11/20.
//

import UIKit

class TPPrimeryButton: UIView {

    public var largeEnabledPrimeryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
        button.setTitleColor(SharedDSKitAsset.Colors.white.color, for: .normal)
        button.titleLabel?.font = Fonts.SH02.font
        return button
    }()

    public var xlargeEnabledPrimeryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
        button.setTitleColor(SharedDSKitAsset.Colors.white.color, for: .normal)
        button.titleLabel?.font = Fonts.H01.font
        return button
    }()

    public var largeFocusedPrimeryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor(red: 236/255, green: 244/255, blue: 226/255, alpha: 1)
        button.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
        button.titleLabel?.font = Fonts.SH02.font
        return button
    }()

    public var xlargeFocusedPrimeryButton: UIButton = {
        var button = UIButton()
        button.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor(red: 236/255, green: 244/255, blue: 226/255, alpha: 1)
        button.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
        button.titleLabel?.font = Fonts.H01.font
        return button
    }()

    public var largePressedPrimeryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor(red: 236/255, green: 244/255, blue: 226/255, alpha: 1)
        button.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
        button.titleLabel?.font = Fonts.SH02.font
        return button
    }()

    public var xlargePressedPrimeryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor(red: 236/255, green: 244/255, blue: 226/255, alpha: 1)
        button.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
        button.titleLabel?.font = Fonts.H01.font
        return button
    }()

    public var largeDisabledPrimeryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
        button.titleLabel?.font = Fonts.SH02.font
        return button
    }()

    public var xlargeDisabledPrimeryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
        button.titleLabel?.font = Fonts.H01.font
        return button
    }()

    public var largeErrorPrimeryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.backgroundColor = SharedDSKitAsset.Colors.red.color
        button.setTitleColor(SharedDSKitAsset.Colors.white.color, for: .normal)
        button.titleLabel?.font = Fonts.SH02.font
        return button
    }()

    public var xlargeErrorPrimeryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.backgroundColor = SharedDSKitAsset.Colors.red.color
        button.setTitleColor(SharedDSKitAsset.Colors.white.color, for: .normal)
        button.titleLabel?.font = Fonts.H01.font
        return button
    }()
}
