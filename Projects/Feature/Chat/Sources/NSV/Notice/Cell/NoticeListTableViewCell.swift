//
//  NoticeListTableViewCell.swift
//  FeatureChat
//
//  Created by 강민성 on 12/20/23.
//

import UIKit
import Shared
import SnapKit

class NoticeListTableViewCell: UITableViewCell {
    
    let noticeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let createdDateAndAdminLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body01.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    
    let pinnedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconPin16.image
        imageView.isHidden = true
        return imageView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func render() {
        contentView.addSubViews([noticeTitleLabel, createdDateAndAdminLabel, pinnedImageView])
        
        contentView.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.height.equalTo(80)
        }
        
        noticeTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(24)
        }
        
        createdDateAndAdminLabel.snp.makeConstraints { make in
            make.top.equalTo(noticeTitleLabel.snp.bottom).offset(2)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(21)
        }
        
        pinnedImageView.snp.makeConstraints { make in
            make.centerY.equalTo(noticeTitleLabel)
            make.trailing.equalToSuperview().offset(-20)
            make.size.equalTo(16)
        }
    }
}
