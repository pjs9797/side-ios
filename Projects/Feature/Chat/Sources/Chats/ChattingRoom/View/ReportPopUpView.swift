//
//  ReportPopUpView.swift
//  FeatureChat
//
//  Created by 강민성 on 1/1/24.
//

import UIKit
import Shared

class ReportPopUpView: UIView {
    
    private let stackView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private var causeTableView: UITableView = {
        var tableView = UITableView()
        
        return tableView
    }()
}
