//
//  ServiceTermsTableViewCell.swift
//  FeatureMyPageInterface
//
//  Created by coco on 2023/12/22.
//

import UIKit
import Shared

class ServiceTermsTableViewCell: UITableViewCell {

    let mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        label.font = Fonts.Body02.font
        return label
    }()
    
    let arrowIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconArrowRight16.image
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        addSubViews([mainLabel, arrowIcon])
        
        mainLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(safeAreaLayoutGuide).inset(16)
            make.leading.equalTo(safeAreaLayoutGuide)
        }
        
        arrowIcon.snp.makeConstraints { make in
            make.top.bottom.equalTo(safeAreaLayoutGuide).inset(20)
            make.leading.equalTo(mainLabel.snp.trailing).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide)
        }
    }
}

