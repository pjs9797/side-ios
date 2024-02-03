//
//  InputViewTextField.swift
//  FeatureSignIn
//
//  Created by 강민성 on 1/21/24.
//

import UIKit
import SharedDSKit

class InputViewTextField: UITextField {
    
    var inputViewFormIncorrectImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "exclamationmark.circle.fill")
        imageView.tintColor = SharedDSKitAsset.Colors.red.color
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .black
        layer.borderWidth = 1.0
        layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        rightView = inputViewFormIncorrectImageView
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 16, y: 25, width: bounds.width - 104, height: bounds.height - 33)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 16, y: 25, width: bounds.width - 104, height: bounds.height - 33)
    }
    
    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.width - 72, y: 16, width: 24, height: 24)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.width - 40 , y: 16, width: 24, height: 24)
    }
    
    private func configure() {
        attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요", attributes: [NSAttributedString.Key.font : Fonts.Body02.font, NSAttributedString.Key.foregroundColor : SharedDSKitAsset.Colors.gr30.color])
        clearButtonMode = .whileEditing
        rightViewMode = .always
        font = Fonts.Body02.font
        layer.cornerRadius = 16
    }
    
}
