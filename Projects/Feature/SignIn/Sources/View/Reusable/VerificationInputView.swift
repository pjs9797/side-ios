//
//  VerificationInputView.swift
//  FeatureSignIn
//
//  Created by 강민성 on 1/29/24.
//

import UIKit
import Shared

import SnapKit

class VerificationInputView: UIView {
    
    let inputViewLabelText: String? = nil
    let textFieldPlaceholder: String? = nil

    let inputViewLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일"
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.gr80.color
        
        return label
    }()
    
    let verificateButton: UIButton = {
        let button = UIButton()
        button.setTitle("인증하기", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.text01.color, for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.textDisabled.color, for: .disabled)
        button.titleLabel?.font = Fonts.Caption.font
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 12
        button.layer.borderColor = SharedDSKitAsset.Colors.gr50.color.cgColor
        
        return button
    }()
    
    var verificationInputViewTextField = VerificationInputViewTextField()
    
    let inputViewErrorLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.red.color
        label.textAlignment = .left
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    convenience init(inputViewLabelText: String, textFieldPlaceholder: String) {
        self.init()
        self.inputViewLabel.text = inputViewLabelText
        self.verificationInputViewTextField.attributedPlaceholder = NSAttributedString(string: textFieldPlaceholder, attributes: [NSAttributedString.Key.font : Fonts.Body02.font, NSAttributedString.Key.foregroundColor : SharedDSKitAsset.Colors.gr30.color])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        verificationInputViewTextField.rightView = verificateButton
        verificationInputViewTextField.addSubViews([inputViewLabel])
        addSubViews([verificationInputViewTextField, inputViewErrorLabel])
        
        inputViewLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview()
            make.height.equalTo(17)
        }
        
        verificationInputViewTextField.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        
        inputViewErrorLabel.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(verificationInputViewTextField.snp.bottom).offset(8)
        }
    }
}
