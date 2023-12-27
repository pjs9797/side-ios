//
//  MakeScheduleResuableView.swift
//  FeatureChat
//
//  Created by 강민성 on 12/21/23.
//

import UIKit
import Shared

class MakeScheduleResuableView: UIView {

    var image: UIImageView = {
       var imageView = UIImageView()
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    var textField: UITextField = {
        var textField = UITextField()
        textField.setPlaceholderColor(SharedDSKitAsset.Colors.textDisabled.color)
        textField.font = Fonts.Body02.font
        return textField
    }()
    
    var line: UIView = {
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
        addSubViews([image, textField, line])
        
        image.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(image.snp.trailing).offset(16)
            make.height.equalTo(24)
        }
        
        line.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
