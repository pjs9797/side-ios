//
//  ChattingListViewController.swift
//  FeatureChat
//
//  Created by 강민성 on 11/21/23.
//

import UIKit
import Shared

import SnapKit
import FeatureChatInterface

public struct MockUpChatData {
    var mockup = [MockUpChatModel(id: 1, image: SharedDSKitAsset.Icons.kakao.image, title: "영화관투어모임 영사모 >_<", latestMessage: "네 알겠습니다!", count: 122, timestamp: "12:01", isAlarmOn: true), MockUpChatModel(id: 2, image: SharedDSKitAsset.Icons.kakao.image, title: "테스트", latestMessage: "테스트입니다", count: 2, timestamp: "12:01", isAlarmOn: false),MockUpChatModel(id: 1, image: SharedDSKitAsset.Icons.kakao.image, title: "영화관투어모임 영사모 >_<", latestMessage: "네 알겠습니다!", count: 122, timestamp: "12:01", isAlarmOn: true), MockUpChatModel(id: 2, image: SharedDSKitAsset.Icons.kakao.image, title: "테스트", latestMessage: "테스트입니다", count: 2, timestamp: "12:01", isAlarmOn: false),MockUpChatModel(id: 1, image: SharedDSKitAsset.Icons.kakao.image, title: "영화관투어모임 영사모 >_<", latestMessage: "네 알겠습니다!", count: 122, timestamp: "12:01", isAlarmOn: true), MockUpChatModel(id: 2, image: SharedDSKitAsset.Icons.kakao.image, title: "테스트", latestMessage: "테스트입니다", count: 2, timestamp: "12:01", isAlarmOn: false),MockUpChatModel(id: 1, image: SharedDSKitAsset.Icons.kakao.image, title: "영화관투어모임 영사모 >_<", latestMessage: "네 알겠습니다!", count: 122, timestamp: "12:01", isAlarmOn: true), MockUpChatModel(id: 2, image: SharedDSKitAsset.Icons.kakao.image, title: "테스트", latestMessage: "테스트입니다", count: 2, timestamp: "12:01", isAlarmOn: false),MockUpChatModel(id: 1, image: SharedDSKitAsset.Icons.kakao.image, title: "영화관투어모임 영사모 >_<", latestMessage: "네 알겠습니다!", count: 122, timestamp: "12:01", isAlarmOn: true), MockUpChatModel(id: 2, image: SharedDSKitAsset.Icons.kakao.image, title: "테스트", latestMessage: "테스트입니다", count: 2, timestamp: "12:01", isAlarmOn: false),MockUpChatModel(id: 1, image: SharedDSKitAsset.Icons.kakao.image, title: "영화관투어모임 영사모 >_<", latestMessage: "네 알겠습니다!", count: 122, timestamp: "12:01", isAlarmOn: true), MockUpChatModel(id: 2, image: SharedDSKitAsset.Icons.kakao.image, title: "테스트", latestMessage: "테스트입니다", count: 2, timestamp: "12:01", isAlarmOn: false),MockUpChatModel(id: 1, image: SharedDSKitAsset.Icons.kakao.image, title: "영화관투어모임 영사모 >_<", latestMessage: "네 알겠습니다!", count: 122, timestamp: "12:01", isAlarmOn: true), MockUpChatModel(id: 2, image: SharedDSKitAsset.Icons.kakao.image, title: "테스트", latestMessage: "테스트입니다", count: 2, timestamp: "12:01", isAlarmOn: false),MockUpChatModel(id: 1, image: SharedDSKitAsset.Icons.kakao.image, title: "영화관투어모임 영사모 >_<", latestMessage: "네 알겠습니다!", count: 122, timestamp: "12:01", isAlarmOn: true), MockUpChatModel(id: 2, image: SharedDSKitAsset.Icons.kakao.image, title: "테스트", latestMessage: "테스트입니다", count: 2, timestamp: "12:01", isAlarmOn: false)]
}

public class ChattingListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var chattingListTableView: UITableView = {
        var tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .white
        return tableView
    }()
    
    var mockUpData = MockUpChatData()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        render()
    }
    
    func setup() {
        navigationItem.title = "채팅"
        
        let attributes = [
            NSAttributedString.Key.font: Fonts.SH03Bold.font,
            NSAttributedString.Key.foregroundColor: SharedDSKitAsset.Colors.gr100.color
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
        navigationController?.hidesBarsOnSwipe = true
        
        chattingListTableView.register(
            ChattingListTableViewCell.self,
            forCellReuseIdentifier: ChattingListTableViewCell.className
        )
        
        chattingListTableView.delegate = self
        chattingListTableView.dataSource = self
    }
    
    func render() {
        view.addSubViews([chattingListTableView])
        
        chattingListTableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockUpData.mockup.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let chatCell = tableView.dequeueReusableCell(
            withIdentifier: ChattingListTableViewCell.className
        ) as? ChattingListTableViewCell else {
            return UITableViewCell()
        }
        
        let data = self.mockUpData.mockup[indexPath.row]
        chatCell.roomImageView.image = data.image
        chatCell.roomTitleLabel.text = data.title
        chatCell.latestMessageLabel.text = data.latestMessage
        chatCell.countLabel.text = String(data.count)
        chatCell.timestampLabel.text = data.timestamp
        chatCell.alarmImageView.isHidden = !data.isAlarmOn
        
        return chatCell
    }
    
    public func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let mockup = self.mockUpData.mockup[indexPath.row]
        
        let alarmToggle = UIContextualAction(style: .normal, title: "") {
            (_, _, success: @escaping (Bool) -> Void) in
            self.mockUpData.mockup[indexPath.row].isAlarmOn.toggle()
            self.chattingListTableView.reloadRows(at: [indexPath], with: .automatic)
            success(true)
        }
        
        alarmToggle.image = mockup.isAlarmOn ?
        SharedDSKitAsset.Icons.bellDefault.image : SharedDSKitAsset.Icons.bellOff.image
        alarmToggle.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        
        return UISwipeActionsConfiguration(actions: [alarmToggle])
    }
    
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ChattingRoomViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 79
    }
}
