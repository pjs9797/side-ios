//
//  MemberListTableViewCell.swift
//  FeatureChat
//
//  Created by 강민성 on 12/13/23.
//

import UIKit
import Shared

class MemberListTableViewCell: UITableViewCell {
    
    var profileImageView: UIImageView = {
       var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = SharedDSKitAsset.Icons.kakao.image
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    var adminSubImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = SharedDSKitAsset.Icons.chattingRoomAdmin.image
        imageView.backgroundColor = .clear
        imageView.isHidden = true
        return imageView
    }()
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.SH01.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    var meLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "me"
        label.textAlignment = .center
        label.textColor = .white
        label.font = Fonts.Caption.font
        label.backgroundColor = SharedDSKitAsset.Colors.gr100.color
        label.layer.cornerRadius = 8
        label.isHidden = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        render()
        backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        profileImageView.addSubview(adminSubImageView)
        addSubViews([profileImageView, nameLabel, meLabel])
        
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(8)
            make.size.equalTo(40)
        }
        
        adminSubImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.size.equalTo(16)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
        }
        
        meLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.trailing).offset(8)
            make.centerY.equalTo(nameLabel)
            make.height.equalTo(16)
            make.width.equalTo(31.36)
        }
    }
    
}
