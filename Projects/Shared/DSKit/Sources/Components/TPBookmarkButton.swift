//
//  TPBookmarkButton.swift
//  SharedDSKit
//
//  Created by yoonyeosong on 2023/11/21.
//

import UIKit

public class TPBookmarkButton: UIView {
    public var smallBookmarkButton: UIButton = {
        var button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconHeart24.image, for: .normal)
        return button
    }()
    
    public var smallFilledBookmarkButton: UIButton = {
        var button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconHeartcolor24.image, for: .normal)
        return button
    }()
   
    public var largeBookmarkButton: UIButton = {
        var button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconHeart32.image, for: .normal)
        return button
    }()
    
    public var largeFilledBookmarkButton: UIButton = {
        var button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconHeartcolor32.image, for: .normal)
        return button
    }()
    
    public var boxBookmarkButton: UIButton = {
        var button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconBoxheart24.image, for: .normal)
        return button
    }()
    
    public var boxFilledBookmarkButton: UIButton = {
        var button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconBoxheartcolor24.image, for: .normal)
        return button
    }()
}
