//
//  SelfDevelopView.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/05.
//

import UIKit
import Shared


class SelfDevelopView: UIView {
    let tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        self.backgroundColor = .white
        addSubViews([tableView])
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(149)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            
        }
        
    }
}
