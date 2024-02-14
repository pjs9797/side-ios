//
//  SettingsViewController.swift
//  FeatureMyPageInterface
//
//  Created by coco on 2023/12/20.
//

import UIKit
import Domain
import Shared

import RxSwift
import RxCocoa
import ReactorKit
import RxFlow

struct CellModel {
    let title: String
    let info: String
}

let cells: [CellModel] = [CellModel(title: "버전 정보", info: "v3.0"),
                          CellModel(title: "계정연동정보", info: "sabuzac@gmail.com"),
                          CellModel(title: "서비스 이용약관", info: ""),
                          CellModel(title: "개인정보처리방침", info: ""),
                          CellModel(title: "위치기반서비스 이용약관", info: ""),
                          CellModel(title: "로그아웃", info: ""),
                          CellModel(title: "회원 탈퇴", info: "")]

public class SettingsViewController: BaseMyPageViewController, ReactorKit.View {
    
    public typealias Reactor = SettingsReactor
    
    let settingsView = SettingsView()
    
    let menuTitle = [["title": "버전 정보", "info": "v3.0"],
                     ["title": "계정연동정보","info": "sabuzac@gmail.com"],
                     ["title": "서비스 이용약관", "info": ""],
                     ["title": "개인정보처리방침", "info": ""],
                     ["title": "위치기반서비스 이용약관", "info": ""],
                     ["title": "로그아웃", "info": ""],
                     ["title": "회원 탈퇴", "info": ""]]
    let cellObservable = Observable.of(cells).map { $0 }
    
    public override func loadView() {
        super.loadView()
        view = settingsView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    public override func configureUI() {
        super.configureUI()
        addNavigationTitleLabel("설정")
        addBackButton()
        render()
    }
    
    init(with reactor: SettingsReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        
        settingsView.tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        cellObservable.bind(to: settingsView.tableView.rx.items(cellIdentifier: SettingTableViewCell.className, cellType: SettingTableViewCell.self)) { [weak self] row, element, cell in
            cell.mainLabel.text = element.title
            cell.infoLabel.text = element.info
        }
        .disposed(by: disposeBag)
    }
    
    private func render() {
        settingsView.tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationBarArea.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension SettingsViewController {
    public func bind(reactor: SettingsReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: SettingsReactor) {
        backButton.rx.tap.map { Reactor.Action.didTapBackButton }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: SettingsReactor) {
        
    }
}

extension SettingsViewController: UITableViewDelegate {
    
}

//extension SettingsViewController: UITableViewDataSource {
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return menuTitle.count
//    }
//    
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if (indexPath.row >= 0 && indexPath.row < 2) || (indexPath.row >= 5 && indexPath.row < 7)  {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.className, for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
//            cell.mainLabel.text = menuTitle[indexPath.row]["title"]
//            cell.infoLabel.text = menuTitle[indexPath.row]["info"]
//            cell.selectionStyle = .none
//            return cell
//        } else {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: ServiceTermsTableViewCell.className, for: indexPath) as? ServiceTermsTableViewCell else { return UITableViewCell() }
//            cell.mainLabel.text = menuTitle[indexPath.row]["title"]
//            cell.selectionStyle = .none
//            return cell
//        }
//    }
//}
