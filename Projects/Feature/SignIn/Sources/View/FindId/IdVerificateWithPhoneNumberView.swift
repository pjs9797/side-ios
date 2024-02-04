//
//  IdVerificateWithPhoneNumberView.swift
//  FeatureSignIn
//
//  Created by 강민성 on 2/1/24.
//

import UIKit
import Shared

import SnapKit

class IdVerificateWithPhoneNumberView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "휴대전화로 본인인증을\n진행해주세요."
        label.textColor = SharedDSKitAsset.Colors.text01.color
        label.font = Fonts.H02.font
        label.numberOfLines = 2
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "회원정보에 등록한 휴대전화 번호와 입력한 휴대전화\n번호가 같아야, 인증번호를 받을 수 있습니다."
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        label.numberOfLines = 2
        
        return label
    }()

    let phoneNumberVerificateInputView = VerificationInputView(inputViewLabelText: "전화번호", textFieldPlaceholder: "010-0000-0000")
    
    let verificationNumberInputView = VerificationNumberInputView(inputViewLabelText: "인증번호", textFieldPlaceholder: "인증번호 6자리를 입력해 주세요.")
    
    let verificationCompletedButton: UIButton = {
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
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        
    }
    
    private func render() {
        addSubViews([titleLabel, descriptionLabel,phoneNumberVerificateInputView, verificationNumberInputView, verificationCompletedButton])
    }
}
