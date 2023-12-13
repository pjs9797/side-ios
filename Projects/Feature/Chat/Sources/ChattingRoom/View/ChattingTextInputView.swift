//
//  ChattingTextInputView.swift
//  FeatureChat
//
//  Created by 강민성 on 12/5/23.
//

import UIKit
import Shared

public class ChattingTextInputView: UIView {
    
    private var multiMediaButton: UIButton = {
        var button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconArrowPlus24.image, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    public var textView: UITextView = {
        var textView = UITextView()
        textView.backgroundColor = SharedDSKitAsset.Colors.bgLightGray.color
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 56)
        textView.layer.cornerRadius = 24
        textView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        textView.layer.borderWidth = 1
        textView.text = "메세지를 입력해주세요."
        textView.font = Fonts.Body02.font
        textView.textColor = SharedDSKitAsset.Colors.gr30.color
        textView.isScrollEnabled = false
        textView.showsVerticalScrollIndicator = false
        textView.sizeToFit()
        return textView
    }()
    
    private var sendMessageButton: UIButton = {
        var button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconSend24.image, for: .normal)
        button.imageView?.tintColor = SharedDSKitAsset.Colors.lightGreen.color
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
        
        addSubViews([multiMediaButton, textView, sendMessageButton])
        
        multiMediaButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.size.equalTo(24)
        }
        
        textView.snp.makeConstraints { make in
            make.leading.equalTo(multiMediaButton.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-20)
            make.height.greaterThanOrEqualTo(40)
            make.centerY.equalToSuperview()
        }
        
        sendMessageButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-36)
            make.bottom.equalToSuperview().offset(-16)
            make.size.equalTo(24)
        }
    }
    
    
    
}
