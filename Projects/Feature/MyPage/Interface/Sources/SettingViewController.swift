//
//  SettingViewController.swift
//  FeatureMyPageInterface
//
//  Created by coco on 2023/12/20.
//

import UIKit
import Shared

class SettingViewController: UIViewController {
    let settingView = SettingView()
    let menuTitle = [["title": "버전 정보", "info": "v3.0"],
                     ["title": "계정연동정보","info": "sabuzac@gmail.com"],
                     ["title": "서비스 이용약관", "info": ""],
                     ["title": "개인정보처리방침", "info": ""],
                     ["title": "위치기반서비스 이용약관", "info": ""],
                     ["title": "로그아웃", "info": ""],
                     ["title": "회원 탈퇴", "info": ""]]
    
    override func loadView() {
        super.loadView()
        
        view = settingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingView.tableView.delegate = self
        settingView.tableView.dataSource = self
        
        setNavigationbar()
    }
    
    func setNavigationbar() {
        self.navigationController?.navigationBar.tintColor = SharedDSKitAsset.Colors.gr100.color
        self.navigationItem.title = "설정"
    }
}

extension SettingViewController: UITableViewDelegate {}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row >= 0 && indexPath.row < 2) || (indexPath.row >= 5 && indexPath.row < 7)  {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
            cell.mainLabel.text = menuTitle[indexPath.row]["title"]
            cell.infoLabel.text = menuTitle[indexPath.row]["info"]
            cell.selectionStyle = .none
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ServiceTermsTableViewCell.identifier, for: indexPath) as? ServiceTermsTableViewCell else { return UITableViewCell() }
            cell.mainLabel.text = menuTitle[indexPath.row]["title"]
            cell.selectionStyle = .none
            return cell
        }
    }
}
