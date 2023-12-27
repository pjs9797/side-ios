//
//  ChattingListTableViewCell.swift
//  FeatureChat
//
//  Created by 강민성 on 11/21/23.
//

import UIKit
import Shared
import SnapKit

class ChattingListTableViewCell: UITableViewCell {
    
    var roomImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let roomTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    let countLabel: PaddingLabel = {
       let label = PaddingLabel(padding: UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4))
        label.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
        label.font = Fonts.Caption.font
        label.textColor = .white
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        
        return label
    }()
    
    let latestMessageLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body01.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    let timestampLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    
    var alarmImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.bellOff.image
        return imageView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        selectionStyle = .none
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func render() {
        contentView.addSubViews(
            [roomImageView, roomTitleLabel, countLabel, latestMessageLabel, timestampLabel, alarmImageView]
        )
        
        contentView.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.height.equalTo(80)
        }
        
        roomImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.size.equalTo(48)
        }
        
        roomTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18.5)
            make.leading.equalTo(roomImageView.snp.trailing).offset(16)
            make.height.equalTo(20)
        }
        
        latestMessageLabel.snp.makeConstraints { make in
            make.top.equalTo(roomTitleLabel.snp.bottom).offset(2)
            make.leading.equalTo(roomImageView.snp.trailing).offset(16)
            make.height.equalTo(20)
        }
        
        countLabel.snp.makeConstraints { make in
            make.centerY.equalTo(roomTitleLabel.snp.centerY)
            make.leading.equalTo(roomTitleLabel.snp.trailing).offset(8)
            make.height.equalTo(16)
        }
        
        timestampLabel.snp.makeConstraints { make in
            make.centerY.equalTo(countLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(20)
        }
        
        alarmImageView.snp.makeConstraints { make in
            make.centerY.equalTo(countLabel)
            make.leading.equalTo(countLabel.snp.trailing).offset(8)
            make.size.equalTo(16)
        }
        
    }
}