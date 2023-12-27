//
//  ScheduleDetailViewController.swift
//  FeatureChat
//
//  Created by 강민성 on 12/25/23.
//

import UIKit
import Shared

import FeatureChatInterface

public struct MockUpScheduleMemberList {
    var mockup = [MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "청계산 다람쥐", isAdmin: true, isMe: true), MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "청계산 다람쥐", isAdmin: false, isMe: false), MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "청계산 다람쥐", isAdmin: true, isMe: false), MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "청계산 다람쥐", isAdmin: true, isMe: false), MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "청계산 다람쥐", isAdmin: true, isMe: false), MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "청계산 다람쥐", isAdmin: true, isMe: false), MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "청계산 다람쥐", isAdmin: true, isMe: false),MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "청계산 다람쥐", isAdmin: true, isMe: false)]
}

class ScheduleDetailViewController: UIViewController, UIScrollViewDelegate {
    
    var memberListMockData = MockUpScheduleMemberList()
    var scheduleDetailView = ScheduleDetailView()
    
    var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var footerView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var joinButton = TPTextButton().enabledLargeIconTextButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        render()
    }
    
    private func setUp() {
        // 테이블 뷰
        scheduleDetailView.memberListTableView.register(MemberListTableViewCell.self, forCellReuseIdentifier: MemberListTableViewCell.className)
        scheduleDetailView.memberListTableView.delegate = self
        scheduleDetailView.memberListTableView.dataSource = self
        
        // 버튼
        joinButton.setTitle("참여하기", for: .normal)
        joinButton.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
        joinButton.layer.cornerRadius = 16
        joinButton.setTitleColor(.white, for: .normal)
        
        joinButton.addTarget(self, action: #selector(didTapJoinButton), for: .touchUpInside)
        
        // 네비게이션
        navigationItem.title = "상세 일정"
        let dismissBarButtonItem = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconArrowClose24.image, style: .plain, target: self, action: #selector(tapDismiss))
        navigationItem.setLeftBarButton(dismissBarButtonItem, animated: true)
    }

    
    private func render() {
        view.addSubViews([scrollView, footerView])
        
        scrollView.addSubview(scheduleDetailView)
        footerView.addSubview(joinButton)
        
        scheduleDetailView.backgroundColor = .white
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(footerView.snp.top)
        }
        
        scheduleDetailView.snp.makeConstraints { make in
            make.leading.equalTo(scrollView.contentLayoutGuide.snp.leading)
            make.trailing.equalTo(scrollView.contentLayoutGuide.snp.trailing)
            make.top.equalTo(scrollView.contentLayoutGuide.snp.top)
            make.bottom.equalTo(scrollView.contentLayoutGuide.snp.bottom)
            make.width.equalTo(scrollView.snp.width)
            make.height.greaterThanOrEqualTo(view.snp.height)
        }
        
        footerView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(76)
        }
        
        joinButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
    }
    
    @objc private func tapDismiss() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapJoinButton() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ScheduleDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListMockData.mockup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemberListTableViewCell.className) as? MemberListTableViewCell else { return UITableViewCell() }
        let data = self.memberListMockData.mockup[indexPath.row]
        cell.nameLabel.text = data.name
        cell.profileImageView.image = data.image
        if data.isMe {
            cell.meLabel.isHidden = false
        }
        if data.isAdmin {
            cell.adminSubImageView.isHidden = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
}
