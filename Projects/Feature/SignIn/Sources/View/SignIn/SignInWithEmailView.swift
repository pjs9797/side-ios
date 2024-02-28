//
//  SignInWithEmailView.swift
//  FeatureSignInInterface
//
//  Created by 강민성 on 1/21/24.
//

import UIKit
import Shared

import SnapKit

class SignInWithEmailView: UIView {
    
    var emailInputView = InputView(inputViewLabelText: "이메일", textFieldPlaceholder: "이메일을 입력해 주세요")
    var passwordInputView = InputView(inputViewLabelText: "비밀번호", textFieldPlaceholder: "비밀번호를 입력해 주세요")
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    let forgotIdButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.setUnderline()
        
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.setUnderline()
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        passwordInputView.inputViewTextField.isSecureTextEntry = true
        passwordInputView.inputViewErrorLabel.numberOfLines = 2
        emailInputView.inputViewTextField.keyboardType = .emailAddress
        emailInputView.inputViewTextField.autocorrectionType = .no
        addSubViews([emailInputView, passwordInputView, signInButton, forgotIdButton, forgotPasswordButton])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
