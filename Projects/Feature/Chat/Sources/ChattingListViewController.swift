//
//  ChattingListViewController.swift
//  FeatureChat
//
//  Created by 강민성 on 11/21/23.
//

import UIKit
import SnapKit

class ChattingListViewController: UIViewController {
    
    var chattingListTableView: UITableView = {
        var tableView = UITableView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup() {
        chattingListTableView.register(ChattingListTableViewCell.self,
                                       forCellReuseIdentifier: ChattingListTableViewCell.className)
    }
    
    func render() {
        view.addSubViews([chattingListTableView])
        
        chattingListTableView.snp.makeConstraints { make in
//            <#code#>
        }
    }
}
