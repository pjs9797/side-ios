//
//  NewPasswordInputWithPhoneNumberView.swift
//  FeatureSignIn
//
//  Created by 강민성 on 2/9/24.
//

import UIKit
import Shared

import SnapKit

class NewPasswordInputWithPhoneNumberView: UIView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "새로운 비밀번호를 입력해 주세요."
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        label.font = Fonts.H02.font
        
        return label
    }()

    var passwordInputView = PasswordWithChipsInputView(inputViewLabelText: "비밀번호", textFieldPlaceholder: "비밀번호를 입력해 주세요.")
    
    var passwordConfirmInputView = InputView(inputViewLabelText: "비밀번호", textFieldPlaceholder: "비밀번호를 한번 더 입력해 주세요.")
    
    let changePasswordCompleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.setTitleColor(SharedDSKitAsset.Colors.textDisabled.color, for: .disabled)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.layer.borderWidth = 1
        button.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews([titleLabel, passwordInputView, passwordConfirmInputView, changePasswordCompleteButton])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}