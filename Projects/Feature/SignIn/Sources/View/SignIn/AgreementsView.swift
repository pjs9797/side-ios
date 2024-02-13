//
//  AgreementsView.swift
//  FeatureSignIn
//
//  Created by 강민성 on 1/10/24.
//

import UIKit
import Shared

import FeatureSignInInterface

import RxSwift
import RxCocoa
import ReactorKit

class AgreementsView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "약관에 동의해주세요"
        label.font = Fonts.H01.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "여러분의 개인정보와 서비스 이용권리\n잘 지켜드릴게요"
        label.numberOfLines = 2
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        
        return label
    }()
    
    let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        return view
    }()
    
    let agreeAllCheckboxView = TPCheckbox()
    
    let checkbox1 = TPCheckbox()
    let showAgreementButton1: UIButton = {
        let button = UIButton()
        button.setTitle("보기", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.setUnderline()
        
        return button
    }()
    
    let checkbox2 = TPCheckbox()
    let showAgreementButton2: UIButton = {
        let button = UIButton()
        button.setTitle("보기", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.setUnderline()
        
        return button
    }()
    
    let checkbox3 = TPCheckbox()
    let showAgreementButton3: UIButton = {
        let button = UIButton()
        button.setTitle("보기", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.setUnderline()
        
        return button
    }()
    
    let checkbox4 = TPCheckbox()
    let showAgreementButton4: UIButton = {
        let button = UIButton()
        button.setTitle("보기", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.setUnderline()
        
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        button.setTitle("가입하기", for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.textDisabled.color, for: .disabled)
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        render()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        agreeAllCheckboxView.enabledCheckboxLabel.font = Fonts.SH03Bold.font
        agreeAllCheckboxView.enabledCheckboxLabel.text = "모두 동의"
        checkbox1.enabledCheckboxLabel.text = "(필수) 만 14세 이상입니다."
        checkbox2.enabledCheckboxLabel.text = "(필수) 서비스 이용약관 동의"
        checkbox3.enabledCheckboxLabel.text = "(필수) 개인정보 처리방침 동의"
        checkbox4.enabledCheckboxLabel.text = "(필수) 위치기반 서비스 이용약관"
    }
    
    private func render() {
        addSubViews([titleLabel, descriptionLabel, agreeAllCheckboxView, separatorLine, checkbox1, showAgreementButton1, checkbox2, showAgreementButton2, checkbox3, showAgreementButton3, checkbox4, showAgreementButton4, signUpButton])
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(32)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
        }
        
        agreeAllCheckboxView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(32)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
        }
        
        separatorLine.snp.makeConstraints { make in
            make.top.equalTo(agreeAllCheckboxView.snp.bottom).offset(24)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(1)
        }
        
        checkbox1.snp.makeConstraints { make in
            make.top.equalTo(separatorLine.snp.bottom).offset(24)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
        }
        
        showAgreementButton1.snp.makeConstraints { make in
            make.centerY.equalTo(checkbox1)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        checkbox2.snp.makeConstraints { make in
            make.top.equalTo(checkbox1.snp.bottom).offset(24)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
        }
        
        showAgreementButton2.snp.makeConstraints { make in
            make.centerY.equalTo(checkbox2)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        checkbox3.snp.makeConstraints { make in
            make.top.equalTo(checkbox2.snp.bottom).offset(24)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
        }
        
        showAgreementButton3.snp.makeConstraints { make in
            make.centerY.equalTo(checkbox3)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        checkbox4.snp.makeConstraints { make in
            make.top.equalTo(checkbox3.snp.bottom).offset(24)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
        }
        
        showAgreementButton4.snp.makeConstraints { make in
            make.centerY.equalTo(checkbox4)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(52)
        }
    }
}
