//
//  ChattingRoomViewController.swift
//  FeatureChat
//
//  Created by 강민성 on 12/1/23.
//

import UIKit
import Shared

public struct MockUpConversationData {
    var mockup = [
        ConversationCellMockData(image: SharedDSKitAsset.Icons.kakao.image, name: "테스트아이디1", message: "이것은테스트입니다아아아아아아아아아아아아아아아아아아아아ㅏ아아아ㅏ아아ㅏㅏㅏㅏ아ㅏ", time: "12:01"),
        ConversationCellMockData(image: SharedDSKitAsset.Icons.kakao.image, name: "테스트아이디1", message: "아아아아아아ㅏ아아아ㅏ아아ㅏㅏㅏㅏ아ㅏ어ㅏ어아ㅓㅇ앙ㅇㅇㅇㅇㅇ", time: "12:01"),
        ConversationCellMockData(image: SharedDSKitAsset.Icons.kakao.image, name: "My", message: "네에", time: "12:02"),
        ConversationCellMockData(image: SharedDSKitAsset.Icons.kakao.image, name: "My", message: "이것은테스트입니다아아아아아아아아아아아아아아아아아아아아ㅏ아아아ㅏ아아ㅏㅏㅏㅏ아ㅏ어디까지길어지나한번보자꾸나아아아아아아아아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ", time: "12:02"),
        ConversationCellMockData(image: SharedDSKitAsset.Icons.kakao.image, name: "테스트아이디1", message: "이것은테스트입니다아아아아아아아아아아아아아아아아아아아아ㅏ아아아ㅏ아아ㅏㅏㅏㅏ아ㅏ", time: "12:01"),
        ConversationCellMockData(image: SharedDSKitAsset.Icons.kakao.image, name: "테스트아이디2", message: "채팅한사람이바뀔때", time: "12:03"),
        ConversationCellMockData(image: SharedDSKitAsset.Icons.kakao.image, name: "테스트아이디1", message: "테스트해보기", time: "12:03")
        
    ]
}

class ChattingRoomViewController: UIViewController {
    
    weak var delegate: ChattingRoomSideMenuDelegate?
    
    private var noticeView: NoticeHeaderView!
    
    private var conversationTableView: UITableView = {
        var tableView = UITableView()
        
        return tableView
    }()
    
    private var textInputField: UITextField = {
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        render()
    }
    
    private func setUp() {
        conversationTableView.delegate = self
        conversationTableView.dataSource = self
        
        conversationTableView.register(MyConversationTableViewCell.self, forCellReuseIdentifier: MyConversationTableViewCell.className)
        conversationTableView.register(FirstOthersConversationTableViewCell.self, forCellReuseIdentifier: FirstOthersConversationTableViewCell.className)
        conversationTableView.register(OthersConversationTableViewCell.self, forCellReuseIdentifier: OthersConversationTableViewCell.className)
        
        
        let barButtonItem = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconSave24.image, style: .plain, target: self, action: #selector(menuButtonTapped))
        
        navigationItem.setRightBarButton(barButtonItem, animated: false)
    }
    
    private func render() {
        
        view.addSubViews([noticeView, conversationTableView])
        
        
    }
    
    @objc private func menuButtonTapped() {
        delegate?.menuButtonTapped()
    }
    
}

extension ChattingRoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
