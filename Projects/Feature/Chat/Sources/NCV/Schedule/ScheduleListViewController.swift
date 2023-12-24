//
//  ScheduleViewController.swift
//  FeatureChat
//
//  Created by 강민성 on 12/20/23.
//

import UIKit
import Shared

import SnapKit
import FeatureChatInterface

public struct MockUpScheduleData {
    
    var mockup = [MockUpScheduleModel(id: 1, title: "주말 영어 스터디", time: "2023. 11. 15 오후 17:00", location: "스타벅스 강남역점", memberCount: "5/6"),MockUpScheduleModel(id: 2, title: "주말 영어 스터디", time: "2023. 11. 15 오후 17:00", location: "스타벅스 강남역점", memberCount: "5/6"),MockUpScheduleModel(id: 3, title: "주말 영어 스터디", time: "2023. 11. 15 오후 17:00", location: "스타벅스 강남역점", memberCount: "5/6")]
}


class ScheduleListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var scheduleListTableView: UITableView = {
        var tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .white
        return tableView
    }()
    
    var mockUpData = MockUpScheduleData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        render()
    }
    
    func setup() {
        scheduleListTableView.register(
            ScheduleTableViewCell.self,
            forCellReuseIdentifier: ScheduleTableViewCell.className
        )
        
        scheduleListTableView.delegate = self
        scheduleListTableView.dataSource = self
    }
    
    func render() {
        view.addSubViews([scheduleListTableView])
        
        scheduleListTableView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockUpData.mockup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ScheduleTableViewCell()
        let data = self.mockUpData.mockup[indexPath.row]
        
        cell.scheduleTitleLabel.text = data.title
        cell.timeLabel.text = data.time
        cell.locationLabel.text = data.location
        cell.memberCountLabel.text = data.memberCount
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = NoticeViewController()
        viewController.modalPresentationStyle = .custom
        viewController.transitioningDelegate = self
        
        self.present(viewController, animated: true, completion: nil)
        
//        navigationController?.pushViewController(viewController, animated: true)
    }
}


extension ScheduleListViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentTransition()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissTransition()
    }
}


