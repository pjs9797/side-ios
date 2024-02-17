//
//  ActivityTableViewHeaderView.swift
//  FeatureMyPage
//
//  Created by 박중선 on 2/16/24.
//

import UIKit
import SnapKit
import Shared

class ActivityTableViewHeaderView: UITableViewHeaderFooterView {
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.SH01.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        self.contentView.addSubview(headerLabel)
        
        headerLabel.snp.makeConstraints { make in
            make.height.equalTo(20*Constants.standardHeight)
            make.leading.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8*Constants.standardHeight)
        }
    }
}
