//
//  TPCheckbox.swift
//  SharedDSKit
//
//  Created by yoonyeosong on 2023/11/23.
//

import UIKit
<<<<<<< HEAD
import RxCocoa
=======
<<<<<<< HEAD
=======
//import RxCocoa
>>>>>>> 3b6e89f ([FEAT] 타임피커뷰 개발)
>>>>>>> caef135 ([FEAT] 타임피커뷰 개발)

public class TPCheckbox: UIView {
    public var enabledUnselectedCheckboxButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconUnselected.image, for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        return button
    }()
    
    public var enabledUnselectedSubCheckboxButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconLargeUnselected.image, for: .normal)
        button.titleLabel?.font = Fonts.SH03Bold.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        return button
        
    }()
    
    public var pressedUnselectedCheckboxButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconPressedUnselected.image, for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        return button
    }()
    
    public var pressedUnselectedSubCheckboxButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconLargePressedUnselected.image, for: .normal)
        button.titleLabel?.font = Fonts.SH03.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        return button
    }()
    
    
    
    
    public var disabledUnselectedCheckboxButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconDisabledUnselected.image, for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        return button
    }()
    
    public var disabledUnselectedSubCheckboxButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconLargeDisabledUnselected.image, for: .normal)
        button.titleLabel?.font = Fonts.SH03Bold.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        return button
    }()
    
    
    
    public var errorUnselectedCheckboxButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconErrorUnselected.image, for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        return button
    }()
    
    

}
