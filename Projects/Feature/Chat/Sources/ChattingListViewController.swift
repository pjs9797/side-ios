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
    var mockup = [MockUpChatModel(id: 1, image: SharedDSKitAsset.Icons.kakao.image, title: "영화관투어모임 영사모 >_<", latestMessage: "네 알겠습니다!", count: 122, timestamp: "12:01"), MockUpChatModel(id: 2, image: SharedDSKitAsset.Icons.kakao.image, title: "테스트", latestMessage: "테스트입니다", count: 2, timestamp: "12:01")]
}


class ChattingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var chattingListTableView: UITableView = {
        var tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    var mockUpData = MockUpChatData()
    
    
//    let disposeBag = DisposeBag()
    
//    init(mockup: [ChatMockData]) {
//        self.mockup = mockup
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup() {
        chattingListTableView.register(
            ChattingListTableViewCell.self,
            forCellReuseIdentifier: ChattingListTableViewCell.className
        )
    }
    
    func render() {
        view.addSubViews([chattingListTableView])
        
        chattingListTableView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockUpData.mockup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChattingListTableViewCell()
        let data = self.mockUpData.mockup[indexPath.row]
        
        cell.roomImageView.image = data.image
        cell.roomTitleLabel.text = data.title
        cell.latestMessageLabel.text = data.latestMessage
        cell.messageCountLabel.text = String(data.count)
        cell.timestampLabel.text = data.timestamp
        return cell
    }
}
