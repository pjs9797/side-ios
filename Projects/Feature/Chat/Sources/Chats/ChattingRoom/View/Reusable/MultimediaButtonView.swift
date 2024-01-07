//
//  MultimediaButtonView.swift
//  FeatureChat
//
//  Created by 강민성 on 1/3/24.
//

import UIKit
import Shared

class MultimediaButtonView: UIView {
    let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 28
        return button
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubViews([button, label])
        
        button.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(56)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

}
