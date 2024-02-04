//
//  ForgotPasswordView.swift
//  FeatureSignIn
//
//  Created by 강민성 on 2/4/24.
//

import UIKit
import Shared

import SnapKit

public class ForgotPasswordView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호 찾는 방법을\n선택해 주세요."
        label.font = Fonts.H02.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        label.numberOfLines = 2
        
        return label
    }()
    
    let findWithPhoneNumberButton: UIButton = {
        let button = UIButton()
        button.setTitle("휴대폰 인증", for: .normal)
        button.titleLabel?.font = Fonts.SH03Bold.font
        button.setTitleColor(SharedDSKitAsset.Colors.text01.color, for: .normal)
        button.setImage(SharedDSKitAsset.Icons.iconPhone24.image, for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    let findWithEmailButton: UIButton = {
        let button = UIButton()
        button.setTitle("이메일 인증", for: .normal)
        button.titleLabel?.font = Fonts.SH03Bold.font
        button.setTitleColor(SharedDSKitAsset.Colors.text01.color, for: .normal)
        button.setImage(SharedDSKitAsset.Icons.iconMail24.image, for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubViews([titleLabel, findWithPhoneNumberButton, findWithEmailButton])
    }
}
