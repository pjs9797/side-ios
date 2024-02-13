//
//  InputView.swift
//  FeatureSignInInterface
//
//  Created by 강민성 on 1/21/24.
//

import UIKit
import Shared

import SnapKit

class InputView: UIView {
    
    let inputViewLabelText: String? = nil
    let textFieldPlaceholder: String? = nil

    var inputViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "이메일"
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.gr80.color
        
        return label
    }()
    
    var inputViewTextField = InputViewTextField()
    
    var inputViewErrorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.red.color
        label.textAlignment = .left
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
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
    
    private func render() {
        addSubViews([inputViewTextField, inputViewErrorLabel, inputViewLabel])
        
        inputViewLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(17)
            make.width.equalTo(50)
        }
        
        inputViewTextField.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        
        inputViewErrorLabel.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(inputViewTextField.snp.bottom).offset(8)
        }
    }
}
