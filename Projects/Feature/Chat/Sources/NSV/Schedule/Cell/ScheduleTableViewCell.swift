//
//  ScheduleTableViewCell.swift
//  FeatureChat
//
//  Created by 강민성 on 12/21/23.
//

import UIKit
import Shared
import SnapKit

class ScheduleTableViewCell: UITableViewCell {
    
    var scheduleTitleLabel: UILabel = {
        var label = UILabel()
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    var timeLabel: UILabel = {
        var label = UILabel()
        label.font = Fonts.Body01.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    
    var locationLabel: UILabel = {
        var label = UILabel()
        label.font = Fonts.Body01.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        return label
    }()
    
    var memberCountLabel: UILabel = {
        var label = UILabel()
        label.textColor = SharedDSKitAsset.Colors.text03.color
        label.font = Fonts.Body01.font
        return label
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
        contentView.addSubViews([scheduleTitleLabel, timeLabel, locationLabel, memberCountLabel])
        
        contentView.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.height.equalTo(80)
        }
        
        scheduleTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(24)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(scheduleTitleLabel.snp.bottom).offset(2)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(21)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(timeLabel)
            make.leading.equalTo(timeLabel.snp.trailing).offset(10)
            make.trailing.lessThanOrEqualTo(memberCountLabel.snp.leading)
        }
        
        memberCountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(timeLabel)
            make.trailing.equalToSuperview().offset(-16)
            make.width.equalTo(22)
        }
        
    }
}
