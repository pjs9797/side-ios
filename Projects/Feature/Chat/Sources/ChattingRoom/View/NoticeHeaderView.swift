//
//  NoticeHeaderView.swift
//  FeatureChat
//
//  Created by 강민성 on 12/5/23.
//

import UIKit
import Shared

public class NoticeHeaderView: UIView {
    
    private var noticeIcon: UIImageView = {
        var imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconNotice24.image
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private var noticeLabel: UILabel = {
        var label = UILabel()
        label.font = Fonts.Body01.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = SharedDSKitAsset.Colors.bgGray.color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubViews([noticeIcon, noticeLabel])
        
        noticeIcon.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.size.equalTo(24)
            make.centerY.equalToSuperview()
        }
        
        noticeLabel.snp.makeConstraints { make in
            make.leading.equalTo(noticeIcon.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(21)
            make.centerY.equalToSuperview()
            
        }
    }
    
}
