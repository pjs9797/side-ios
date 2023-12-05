//
//  ChattingTextInputView.swift
//  FeatureChat
//
//  Created by 강민성 on 12/5/23.
//

import UIKit
import Shared

public class ChattingTextInputView: UIView {
    
    private var multimediaButton: UIButton = {
        var button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconArrowPlus24.image, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private var textFieldBackgroundView: UIView = {
        var view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.bgLightGray.color
        view.layer.cornerRadius = 24
        view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    private var textField: UITextField = {
        var textField = UITextField()
        textField
        return textField
    }()
    
    private var sendMessageButton: UIButton = {
        var button = UIButton()
        
        return button
    }
    
}
