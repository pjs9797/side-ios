//
//  TPSecondaryButton.swift
//  SharedDSKit
//
//  Created by yoonyeosong on 2023/11/20.
//

import UIKit


public class TPSecondaryButton: UIView {
    public var smallEnabledSecondaryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = SharedDSKitAsset.Colors.gr50
            .color.cgColor
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color
                             , for: .normal)
        
        return button
    }()
    
    public var largeEnabledSecondaryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = SharedDSKitAsset.Colors.gr50.color.cgColor
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        return button
        
    }()
    
    public var xlargeEnabledSecondaryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = SharedDSKitAsset.Colors.gr50.color.cgColor
        button.titleLabel?.font = Fonts.H01.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        return button
    }()
    
    public var smallFocusedSecondaryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
        button.backgroundColor = UIColor(red: 236/255, green: 244/255, blue: 226/255, alpha: 1)
        return button
    }()
    
    public var largeFocusedSecondaryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
        button.backgroundColor = UIColor(red: 236/255, green: 244/255, blue: 226/255, alpha: 1)
        return button
    }()
    
    public var xlargeFocusedSecondaryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        button.titleLabel?.font = Fonts.H01.font
        button.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
        button.backgroundColor = UIColor(red: 236/255, green: 244/255, blue: 226/255, alpha: 1)
        return button
    }()
    
    public var smallPressedSecondaryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
        button.backgroundColor = UIColor(red: 236/255, green: 244/255, blue: 226/255, alpha: 1)
        return button
    }()
    
    public var largePressedSecondaryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
        button.backgroundColor = UIColor(red: 236/255, green: 244/255, blue: 226/255, alpha: 1)
        return button
    }()
    
    public var xlargePressedSecondaryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        button.titleLabel?.font = Fonts.H01.font
        button.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
        button.backgroundColor = UIColor(red: 236/255, green: 244/255, blue: 226/255, alpha: 1)
        return button
    }()
    
    public var smallDisabledSecondaryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        return button
    }()
    
    public var largeDisabledSecondaryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        return button
    }()
    
    public var xlargeDisabledSecondaryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        button.titleLabel?.font = Fonts.H01.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        return button
    }()
    
    public var smallErrorSecondaryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitleColor(SharedDSKitAsset.Colors.red.color, for: .normal)
        return button
    }()
    
    public var largeErrorSecondaryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
        button.titleLabel?.font = Fonts.SH02.font
        button.setTitleColor(SharedDSKitAsset.Colors.red.color, for: .normal)
        return button
    }()
    
    public var xlargeErrorSecondaryButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
        button.titleLabel?.font = Fonts.H01.font
        button.setTitleColor(SharedDSKitAsset.Colors.red.color, for: .normal)
        return button
    }()
}
