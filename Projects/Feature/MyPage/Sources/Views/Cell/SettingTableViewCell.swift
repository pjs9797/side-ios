//
//  InfoTableViewCell.swift
//  FeatureMyPageInterface
//
//  Created by coco on 2023/12/22.
//

import UIKit
import Shared
import SnapKit

class SettingTableViewCell: UITableViewCell {

    let mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        label.font = Fonts.Body02.font
        return label
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.gr30.color
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        addSubViews([mainLabel, infoLabel])
        
        mainLabel.snp.makeConstraints {
            $0.top.bottom.equalTo(safeAreaLayoutGuide).inset(16)
            $0.leading.equalTo(safeAreaLayoutGuide)
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.bottom.equalTo(safeAreaLayoutGuide).inset(16)
            $0.leading.equalTo(mainLabel.snp.trailing).offset(16)
            $0.trailing.equalTo(safeAreaLayoutGuide)
        }
    }
}
