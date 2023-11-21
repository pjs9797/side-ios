//
//  ChattingListTableViewCell.swift
//  FeatureChat
//
//  Created by 강민성 on 11/21/23.
//

import UIKit
import SnapKit

class ChattingListTableViewCell: UITableViewCell {
    
    var roomImageView: UIImageView = {
       var imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    var roomTitleLabel: UILabel = {
       var label = UILabel()
        
        return label
    }()
    
    var messageCountLabel: UILabel = {
        var label = UILabel()
        
        return label
    }()

    var latestMessageLabel: UILabel = {
        var label = UILabel()
        
        return label
    }()
    
    var timestampLabel: UILabel = {
        var label = UILabel()
        
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func render() {
        contentView.addSubViews([roomImageView, roomTitleLabel, messageCountLabel, latestMessageLabel, timestampLabel])
        
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
        
        messageCountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(roomTitleLabel.snp.centerY)
            make.leading.equalTo(roomTitleLabel.snp.trailing).offset(8)
            make.size.equalTo(16)
        }
        
        timestampLabel.snp.makeConstraints { make in
            make.centerY.equalTo(messageCountLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(20)
            
        }
        
    }
}
