//
//  MakeScheduleView.swift
//  FeatureChat
//
//  Created by 강민성 on 12/21/23.
//

import UIKit
import Shared

class MakeScheduleView: UIView {

    var titleTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "일정 제목을 적어주세요."
        textField.setPlaceholderColor(SharedDSKitAsset.Colors.textDisabled.color)
        textField.font = Fonts.Body03.font
        return textField
    }()
    
    var separatorLine1: UIView = {
        var view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        return view
    }()
    
    var timeImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.clock.image
        return imageView
    }()
    
    var timeButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .clear
        return button
    }()
    
    var dateLabel: UILabel = {
        var label = UILabel()
        label.text = "날짜와 시간 선택해주세요"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.textDisabled.color
        return label
    }()
    
    var timeLabel: UILabel = {
        var label = UILabel()
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.textDisabled.color
        return label
    }()
    
    var separatorLine2: UIView = {
        var view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        return view
    }()
    
    var locationView: MakeScheduleResuableView = {
        var view = MakeScheduleResuableView()
        view.image.image = SharedDSKitAsset.Icons.iconPlace24.image
        view.textField.placeholder = "위치를 입력해주세요."
        view.textField.setPlaceholderColor(SharedDSKitAsset.Colors.textDisabled.color)
        return view
    }()
    
    var maximumMemberView: MakeScheduleResuableView = {
        var view = MakeScheduleResuableView()
        view.image.image = SharedDSKitAsset.Icons.iconMy24.image
        view.textField.placeholder = "최대 인원을 입력해주세요."
        view.textField.setPlaceholderColor(SharedDSKitAsset.Colors.textDisabled.color)
        return view
    }()
    
    var budgetView: MakeScheduleResuableView = {
        var view = MakeScheduleResuableView()
        view.image.image = SharedDSKitAsset.Icons.iconWallet24.image
        view.textField.placeholder = "1인당 필요한 금액을 입력해주세요."
        view.textField.setPlaceholderColor(SharedDSKitAsset.Colors.textDisabled.color)
        return view
    }()
    
    var descriptionTextView: UITextView = {
        var textView = UITextView()
        textView.backgroundColor = .clear
        return textView
    }()
    
    var separatorLine3: UIView = {
        var view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        
        timeButton.addSubViews([dateLabel, timeLabel])
        
        addSubViews([titleTextField, separatorLine1, timeImageView, timeButton, separatorLine2, locationView, maximumMemberView, budgetView, descriptionTextView, separatorLine3])
        
        
        
        titleTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            make.height.equalTo(56)
        }
        
        separatorLine1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(titleTextField.snp.bottom).offset(1)
            make.height.equalTo(1)
        }
        
        timeImageView.snp.makeConstraints { make in
            make.top.equalTo(separatorLine1).offset(16)
            make.leading.equalToSuperview().offset(20)
            make.size.equalTo(24)
        }
        
        timeButton.snp.makeConstraints { make in
            make.centerY.equalTo(timeImageView)
            make.leading.equalTo(timeImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(56)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        separatorLine2.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(timeButton.snp.bottom).offset(1)
            make.height.equalTo(1)
        }
        
        locationView.snp.makeConstraints { make in
            make.top.equalTo(separatorLine2.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(56)
        }
        
        maximumMemberView.snp.makeConstraints { make in
            make.top.equalTo(locationView.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(56)
        }
        
        budgetView.snp.makeConstraints { make in
            make.top.equalTo(maximumMemberView.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(56)
        }
        
        descriptionTextView.snp.makeConstraints { make in
            make.top.equalTo(budgetView)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(keyboardLayoutGuide.snp.top)
        }
        
        separatorLine3.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(descriptionTextView.snp.bottom).offset(1)
            make.height.equalTo(1)
        }
        
    }
}
