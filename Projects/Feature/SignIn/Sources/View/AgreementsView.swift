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
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    var agreeAllCheckboxView = TPCheckbox()
    
    var checkbox1 = TPCheckbox()
    var checkbox2 = TPCheckbox()
    var checkbox3 = TPCheckbox()
    var checkbox4 = TPCheckbox()
    
    lazy var buttons = [agreeAllCheckboxView, checkbox1, checkbox2, checkbox3, checkbox4]
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        render()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        agreeAllCheckboxView.enabledCheckboxLabel.text = "모두 동의"
        checkbox1.enabledCheckboxLabel.text = "123"
        checkbox2.enabledCheckboxLabel.text = "45"
        checkbox3.enabledCheckboxLabel.text = "264"
        checkbox4.enabledCheckboxLabel.text = "1341"
    }
    
    private func render() {
        addSubViews([agreeAllCheckboxView, checkbox1, checkbox2, checkbox3, checkbox4])
        
        agreeAllCheckboxView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
        }
        
        checkbox1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(agreeAllCheckboxView.snp.bottom).offset(20)
        }
        
        checkbox2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(checkbox1.snp.bottom).offset(20)
        }
        
        checkbox3.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(checkbox2.snp.bottom).offset(20)
        }
        
        checkbox4.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(checkbox3.snp.bottom).offset(20)
        }
    }
    
}
