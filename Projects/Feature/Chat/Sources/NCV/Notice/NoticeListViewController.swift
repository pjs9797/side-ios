//
//  NoticeViewController.swift
//  FeatureChat
//
//  Created by 강민성 on 12/20/23.
//

import UIKit
import Shared

import SnapKit
import FeatureChatInterface

public struct MockUpNoticeData {
    
    var mockup = [MockUpNoticeModel(id: 1, title: "들어오시면 바로 자기소개 부탁드려요~", dateAndAdmin: "2023. 11. 15 방장님님님", isPinned: true), MockUpNoticeModel(id: 2, title: "필독 !! 최근에 눈팅만 하는 분들이 늘어난 것 같은데 그러지맙시다", dateAndAdmin: "2023. 11. 15 방장님님님", isPinned: false), MockUpNoticeModel(id: 2, title: "필독 !! 최근에 눈팅만 하는 분들이 늘어난 것 같은데 그러지맙시다", dateAndAdmin: "2023. 11. 15 방장님님님", isPinned: false), MockUpNoticeModel(id: 2, title: "필독 !! 최근에 눈팅만 하는 분들이 늘어난 것 같은데 그러지맙시다", dateAndAdmin: "2023. 11. 15 방장님님님", isPinned: false)]
}


class NoticeListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var noticeListTableView: UITableView = {
        var tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .white
        return tableView
    }()
    
    var mockUpData = MockUpNoticeData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        render()
    }
    
    func setup() {
        noticeListTableView.register(
            NoticeListTableViewCell.self,
            forCellReuseIdentifier: NoticeListTableViewCell.className
        )
        
        noticeListTableView.delegate = self
        noticeListTableView.dataSource = self
    }
    
    func render() {
        view.addSubViews([noticeListTableView])
        
        noticeListTableView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockUpData.mockup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NoticeListTableViewCell()
        let data = self.mockUpData.mockup[indexPath.row]
        
        cell.noticeTitleLabel.text = data.title
        cell.createdDateAndAdminLabel.text = data.dateAndAdmin
        cell.pinnedImageView.isHidden = !data.isPinned
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let mockup = self.mockUpData.mockup[indexPath.row]
        
        let pinToggle = UIContextualAction(style: .normal, title: "") { (_, _, success: @escaping (Bool) -> Void) in
            self.mockUpData.mockup[indexPath.row].isPinned.toggle()
            self.noticeListTableView.reloadRows(at: [indexPath], with: .automatic)
            success(true)
        }
        pinToggle.image = mockup.isPinned ? SharedDSKitAsset.Icons.iconPin16.image : SharedDSKitAsset.Icons.iconPinGreen16.image
        pinToggle.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        
        return UISwipeActionsConfiguration(actions: [pinToggle])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = NoticeViewController()
        viewController.modalPresentationStyle = .custom
        viewController.transitioningDelegate = self
        
        self.present(viewController, animated: true, completion: nil)
        
//        navigationController?.pushViewController(viewController, animated: true)
    }
}


extension NoticeListViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentTransition()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissTransition()
    }
}

