//
//  TPTextButton.swift
//  SharedDSKit
//
//  Created by yoonyeosong on 2023/11/21.
//

import UIKit

public class TPTextButton: UIView {
    public var enabledTextButton: UIButton = {// 텍스트 버튼
        let button = UIButton()
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        return button
    }()
    
    public var enabledSmallTextIconButton: UIButton = { //small 텍스트 + 아이콘 버튼
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH02.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr100
            .color, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    public var enabledLargeTextIconButton: UIButton = {//large 텍스트 + 아이콘 버튼
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH03.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr100
            .color, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    public var enabledSmallIconTextButton: UIButton = {//small 아이콘 + 텍스트 버튼
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH02.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr100
            .color, for: .normal)
        return button
    }()
    
    public var enabledLargeIconTextButton: UIButton = {//large 아이콘 + 텍스트 버튼
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH03.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr100
            .color, for: .normal)
        return button
    }()
    
    public var focusedTextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
        return button
    }()
    
    public var focusedSmallTextIconButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH02.font
        button.setTitleColor(SharedDSKitAsset.Colors.green
            .color, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    public var focusedLargeTextIconButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH03.font
        button.setTitleColor(SharedDSKitAsset.Colors.green
            .color, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    public var focusedSmallIconTextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH02.font
        button.setTitleColor(SharedDSKitAsset.Colors.green
            .color, for: .normal)
        return button
    }()
    
    public var focusedLargeIconTextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH03.font
        button.setTitleColor(SharedDSKitAsset.Colors.green
            .color, for: .normal)
        return button
    }()
    
    public var pressedTextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
        return button
    }()
    
    public var pressedSmallTextIconButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH02.font
        button.setTitleColor(SharedDSKitAsset.Colors.green
            .color, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    public var pressedLargeTextIconButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH03.font
        button.setTitleColor(SharedDSKitAsset.Colors.green
            .color, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    public var pressedSmallIconTextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH02.font
        button.setTitleColor(SharedDSKitAsset.Colors.green
            .color, for: .normal)
        return button
    }()
    
    public var pressedLargeIconTextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH03.font
        button.setTitleColor(SharedDSKitAsset.Colors.green
            .color, for: .normal)
        return button
    }()
    
    public var disabledSmallTextIconButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH02.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr30
            .color, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    public var disabledLargeTextIconButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH03.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr30
            .color, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    public var disabledSmallIconTextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH02.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr30
            .color, for: .normal)
        return button
    }()
    
    public var disabledLargeIconTextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH03.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr30
            .color, for: .normal)
        return button
    }()
    
    public var errorTextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.red.color, for: .normal)
        return button
    }()
    
    public var errorSmallTextIconButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH02.font
        button.setTitleColor(SharedDSKitAsset.Colors.red
            .color, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    public var errorLargeTextIconButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH03.font
        button.setTitleColor(SharedDSKitAsset.Colors.red
            .color, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    public var errorSmallIconTextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH02.font
        button.setTitleColor(SharedDSKitAsset.Colors.red
            .color, for: .normal)
        return button
    }()
    
    public var errorLargeIconTextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.SH03.font
        button.setTitleColor(SharedDSKitAsset.Colors.red
            .color, for: .normal)
        return button
    }()
    
    
}

extension UIButton {
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: title.count))
        setAttributedTitle(attributedString, for: .normal)
    }
}
