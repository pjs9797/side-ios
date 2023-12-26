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
    var mockup = [MockUpChatModel(id: 1, image: SharedDSKitAsset.Icons.kakao.image, title: "영화관투어모임 영사모 >_<", latestMessage: "네 알겠습니다!", count: 122, timestamp: "12:01", isAlarmOn: true), MockUpChatModel(id: 2, image: SharedDSKitAsset.Icons.kakao.image, title: "테스트", latestMessage: "테스트입니다", count: 2, timestamp: "12:01", isAlarmOn: false)]
}

public struct DMMockData {
    var dmMockup = [DMMockUpChatModel(id: 1, image: SharedDSKitAsset.Icons.kakao.image, title: "DMDMDMDMDMDMDMDMDM", latestMessage: "DMDMDMDMDMDMDM", count: 122, timestamp: "12:01", isAlarmOn: true), DMMockUpChatModel(id: 2, image: SharedDSKitAsset.Icons.kakao.image, title: "DMDMDMDMDM", latestMessage: "DMDMDMDMDMDMDM", count: 2, timestamp: "12:01", isAlarmOn: false)]
}


public class ChattingListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UnderlineSegmentedControl(items: ["모임", "쪽지"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    var chattingListTableView: UITableView = {
        var tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .white
        return tableView
    }()
    
    var mockUpData = MockUpChatData()
    var DMMockUpData = DMMockData()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        render()
    }
    
    func setup() {
        
        navigationItem.title = "채팅"
        
        let attributes = [
            NSAttributedString.Key.font: Fonts.SH03Bold.font
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
        
        chattingListTableView.register(
            ChattingListTableViewCell.self,
            forCellReuseIdentifier: ChattingListTableViewCell.className
        )
        
        chattingListTableView.delegate = self
        chattingListTableView.dataSource = self
        
        self.segmentedControl.addTarget(self, action: #selector(segmentedControlSelected), for: .valueChanged)
    }
    
    @objc private func segmentedControlSelected() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            chattingListTableView.reloadData()
            break
            
        case 1:
            chattingListTableView.reloadData()
            break
        default:
            break
        }
    }
    
    func render() {
        view.addSubViews([chattingListTableView, segmentedControl])
        
        chattingListTableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(segmentedControl.snp.bottom)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(49)
        }
        
        
        self.segmentedControl.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor:
                    SharedDSKitAsset.Colors.text03.color,
                .font: Fonts.Body02.font
            ],
            for: .normal)
        self.segmentedControl.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor:
                    SharedDSKitAsset.Colors.green.color,
                .font: Fonts.SH02Bold.font
            ],
            for: .selected
        )
        self.segmentedControl.selectedSegmentIndex = 0
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return mockUpData.mockup.count
            
        case 1:
            return DMMockUpData.dmMockup.count
            
        default:
            return 0
        }
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let chatCell = tableView.dequeueReusableCell(withIdentifier: ChattingListTableViewCell.className) as? ChattingListTableViewCell else { return UITableViewCell() }
        guard let DMCell = tableView.dequeueReusableCell(withIdentifier: ChattingListTableViewCell.className) as? ChattingListTableViewCell else { return UITableViewCell() }
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let data = self.mockUpData.mockup[indexPath.row]
            chatCell.roomImageView.image = data.image
            chatCell.roomTitleLabel.text = data.title
            chatCell.latestMessageLabel.text = data.latestMessage
            chatCell.countLabel.text = String(data.count)
            chatCell.timestampLabel.text = data.timestamp
            return chatCell
            
        case 1:
            let data = self.DMMockUpData.dmMockup[indexPath.row]
            DMCell.roomImageView.image = data.image
            DMCell.roomTitleLabel.text = data.title
            DMCell.latestMessageLabel.text = data.latestMessage
            DMCell.countLabel.text = String(data.count)
            DMCell.timestampLabel.text = data.timestamp
            return DMCell
            
        default:
            break
        }
        
        return chatCell
    }
    
    public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let mockup = self.mockUpData.mockup[indexPath.row]
            
            let alarmToggle = UIContextualAction(style: .normal, title: "") { (_, _, success: @escaping (Bool) -> Void) in
                self.mockUpData.mockup[indexPath.row].isAlarmOn.toggle()
                self.chattingListTableView.reloadRows(at: [indexPath], with: .automatic)
                success(true)
            }
            alarmToggle.image = mockup.isAlarmOn ? SharedDSKitAsset.Icons.bellDefault.image : SharedDSKitAsset.Icons.bellOff.image
            alarmToggle.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
            
            return UISwipeActionsConfiguration(actions: [alarmToggle])
            
        default:
            return nil
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ChattingRoomViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 79
    }
}
