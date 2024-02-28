//
//  ServiceTermsTableViewCell.swift
//  FeatureMyPageInterface
//
//  Created by coco on 2023/12/22.
//

import UIKit
import Shared

class ServiceTermsTableViewCell: UITableViewCell {
    static let identifier = "ServiceTermsTableViewCell"

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
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        let safeArea = self.safeAreaLayoutGuide
        
        [mainLabel, arrowIcon].forEach {
            self.addSubview($0)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.bottom.equalTo(safeArea).inset(16)
            $0.leading.equalTo(safeArea)
        }
        
        arrowIcon.snp.makeConstraints {
            $0.top.bottom.equalTo(safeArea).inset(20)
            $0.leading.equalTo(mainLabel.snp.trailing).offset(16)
            $0.trailing.equalTo(safeArea)
        }
    }
}

