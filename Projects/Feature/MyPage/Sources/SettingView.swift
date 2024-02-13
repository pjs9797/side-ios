//
//  SettingView.swift
//  FeatureMyPageInterface
//
//  Created by coco on 2023/12/20.
//

import UIKit
import Shared

class SettingView: UIView {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 10
        tableView.separatorColor = SharedDSKitAsset.Colors.bgWhite.color
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        tableView.register(ServiceTermsTableViewCell.self, forCellReuseIdentifier: ServiceTermsTableViewCell.identifier)
        return tableView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = SharedDSKitAsset.Colors.bgWhite.color
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        self.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.bottom.equalTo(safeArea)
            $0.leading.trailing.equalTo(safeArea).inset(20)
        }
    }
}
