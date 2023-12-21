//
//  SelfDevelopViewController.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/05.
//

import UIKit

public class SelfDevelopViewController: UIViewController {
    var selfDevelopView = SelfDevelopView()
    
    let data = ["[디자이너 급구] 사이드 프로젝트","[백엔드] 사이드 플젝 하실분","three","four","five"]
    
    public override func loadView() {
        super.loadView()
        view = selfDevelopView
//        selfDevelopView.tableView.delegate = self
//        selfDevelopView.tableView.dataSource = self
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        selfDevelopView.tableView.delegate = self
        selfDevelopView.tableView.dataSource = self
    }

}

extension SelfDevelopViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 5
        }
        
    }
        
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            selfDevelopView.tableView.register(BannerTableViewCell.self, forCellReuseIdentifier: "BannerTableViewCell")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as? BannerTableViewCell else { return UITableViewCell()}
            selfDevelopView.tableView.rowHeight = 210
            cell.selectionStyle = .none
            return cell
        } else {
            selfDevelopView.tableView.register(CodingCustomTableViewCell.self, forCellReuseIdentifier: "CodingCustomTableViewCell")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CodingCustomTableViewCell", for: indexPath) as? CodingCustomTableViewCell else { return UITableViewCell() }
            cell.label.text = data[indexPath.row]
            selfDevelopView.tableView.rowHeight = 130
            cell.selectionStyle = .none
            return cell
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
   
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
  
}
