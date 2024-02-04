//
//  PasswordWithChipsInputView.swift
//  FeatureSignIn
//
//  Created by 강민성 on 2/4/24.
//

import UIKit

import UIKit
import Shared

import SnapKit

class PasswordWithChipsInputView: UIView {
    
    let inputViewLabelText: String? = nil
    let textFieldPlaceholder: String? = nil

    var inputViewLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일"
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.gr80.color
        
        return label
    }()
    
    var inputViewTextField = InputViewTextField()
    
    var inputViewErrorLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.red.color
        label.textAlignment = .left
        
        return label
    }()
    
    let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    let englishLabel: UILabel = {
        let label = UILabel()
        label.text = "영어"
        label.font = Fonts.Caption.font
        label.textAlignment = .center
        label.textColor =  SharedDSKitAsset.Colors.text03.color
        
        return label
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "숫자"
        label.font = Fonts.Caption.font
        label.textAlignment = .center
        label.textColor = SharedDSKitAsset.Colors.text03.color
        
        return label
    }()
    
    let symbolLabel: UILabel = {
        let label = UILabel()
        label.text = "특수문자"
        label.font = Fonts.Caption.font
        label.textAlignment = .center
        label.textColor = SharedDSKitAsset.Colors.text03.color
        
        return label
    }()
    
    let sixLabel: UILabel = {
        let label = UILabel()
        label.text = "6자리 이상"
        label.font = Fonts.Caption.font
        label.textAlignment = .center
        label.textColor = SharedDSKitAsset.Colors.text03.color
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        render()
    }
    
    convenience init(inputViewLabelText: String, textFieldPlaceholder: String) {
        self.init()
        self.inputViewLabel.text = inputViewLabelText
        self.inputViewTextField.attributedPlaceholder = NSAttributedString(string: textFieldPlaceholder, attributes: [NSAttributedString.Key.font : Fonts.Body02.font, NSAttributedString.Key.foregroundColor : SharedDSKitAsset.Colors.gr30.color])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        [englishLabel, numberLabel, symbolLabel, sixLabel].forEach {
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 12
            $0.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            $0.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        }
    }
    
    private func render() {
        labelStackView.addSubViews([englishLabel, numberLabel, symbolLabel, sixLabel])
        inputViewTextField.addSubViews([inputViewLabel])
        addSubViews([inputViewTextField, inputViewErrorLabel, labelStackView])
        
        inputViewLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview()
            make.height.equalTo(17)
        }
        
        inputViewTextField.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        
        inputViewErrorLabel.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(inputViewTextField.snp.bottom).offset(8)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.top.equalTo(inputViewTextField.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.width.equalTo(212)
            make.height.equalTo(24)
        }
    }
}
