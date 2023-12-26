//
//  ChattingRoomViewController.swift
//  FeatureChat
//
//  Created by 강민성 on 12/1/23.
//

import UIKit
import FeatureChatInterface
import Shared
import SideMenu

public class ChattingRoomViewController: UIViewController {
    
    var dataSource = [ConversationMockDataModel]()
    
    private var noticeView = NoticeHeaderView()
    
    private var conversationTableView: UITableView = {
        var tableView = UITableView()
        tableView.backgroundView = nil
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()
    
    private var textInputView = ChattingTextInputView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        mocking()
        setUp()
        navigationItem.title = "영화관투어모임 영사모 >_<"
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        render()
        conversationTableView.reloadData()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        conversationTableView.endEditing(true)
    }
    
    private func mocking() {
        self.dataSource = [
            .firstConversation(data: FirstOthersConversationCellMockData(profileImage: SharedDSKitAsset.Icons.kakao.image, name: "테스트아이디1", message: "테스트내용입니다ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ", time: "12:01")),
            .myConversation(data: MyConversationCellMockData(message: "테스트입니다", time: "12:01")),
            .myConversation(data: MyConversationCellMockData(message: "132132테테테테테스스ㅡㅡㅡㅡ트ㅡㅡㅡㅡ", time: "12:02")),
            .firstConversation(data: FirstOthersConversationCellMockData(profileImage: SharedDSKitAsset.Icons.kakao.image, name: "테스트아이디2222222222222222222ㅇㅇㅇㅇㅇㅇㅇㅇㅇ", message: "어디까지길어지나ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ", time: "12:03")),
            .othersConversation(data: OthersConversationCellMockData(message: "가나다라ㅏ", time: "12:04")),
            .othersConversation(data: OthersConversationCellMockData(message: "4444321323151", time: "13:05")),
            .myConversation(data: MyConversationCellMockData(message: "테스트입니다", time: "12:01")),
            .myConversation(data: MyConversationCellMockData(message: "132132테테테테테스스ㅡㅡㅡㅡ트ㅡㅡㅡㅡ", time: "12:02")),
            .firstConversation(data: FirstOthersConversationCellMockData(profileImage: SharedDSKitAsset.Icons.kakao.image, name: "테스트아이디2222222222222222222ㅇㅇㅇㅇㅇㅇㅇㅇㅇ", message: "어디까지길어지나ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ", time: "12:03")),
            .othersConversation(data: OthersConversationCellMockData(message: "가나다라ㅏ", time: "12:04")),
            .othersConversation(data: OthersConversationCellMockData(message: "4444321323151", time: "13:05")),
            .myConversation(data: MyConversationCellMockData(message: "테스트입니다", time: "12:01")),
            .myConversation(data: MyConversationCellMockData(message: "132132테테테테테스스ㅡㅡㅡㅡ트ㅡㅡㅡㅡ", time: "12:02")),
            .firstConversation(data: FirstOthersConversationCellMockData(profileImage: SharedDSKitAsset.Icons.kakao.image, name: "테스트아이디2222222222222222222ㅇㅇㅇㅇㅇㅇㅇㅇㅇ", message: "어디까지길어지나ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ", time: "12:03")),
            .othersConversation(data: OthersConversationCellMockData(message: "가나다라ㅏ", time: "12:04")),
            .othersConversation(data: OthersConversationCellMockData(message: "4444321323151", time: "13:05")),
            .myConversation(data: MyConversationCellMockData(message: "테스트입니다", time: "12:01")),
            .myConversation(data: MyConversationCellMockData(message: "132132테테테테테스스ㅡㅡㅡㅡ트ㅡㅡㅡㅡ", time: "12:02")),
            .firstConversation(data: FirstOthersConversationCellMockData(profileImage: SharedDSKitAsset.Icons.kakao.image, name: "테스트아이디2222222222222222222ㅇㅇㅇㅇㅇㅇㅇㅇㅇ", message: "어디까지길어지나ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ", time: "12:03")),
            .othersConversation(data: OthersConversationCellMockData(message: "가나다라ㅏ", time: "12:04")),
            .othersConversation(data: OthersConversationCellMockData(message: "4444321323151", time: "13:05")),
            .myConversation(data: MyConversationCellMockData(message: "테스트입니다", time: "12:01")),
            .myConversation(data: MyConversationCellMockData(message: "132132테테테테테스스ㅡㅡㅡㅡ트ㅡㅡㅡㅡ", time: "12:02")),
            .firstConversation(data: FirstOthersConversationCellMockData(profileImage: SharedDSKitAsset.Icons.kakao.image, name: "테스트아이디2222222222222222222ㅇㅇㅇㅇㅇㅇㅇㅇㅇ", message: "어디까지길어지나ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ", time: "12:03")),
            .othersConversation(data: OthersConversationCellMockData(message: "가나다라ㅏ", time: "12:04")),
            .othersConversation(data: OthersConversationCellMockData(message: "4444321323151", time: "13:05"))
        ]
        self.conversationTableView.reloadData()
    }
    
    
    private func setUp() {
        conversationTableView.delegate = self
        conversationTableView.dataSource = self
        textInputView.textView.delegate = self
        
        conversationTableView.register(MyConversationTableViewCell.self, forCellReuseIdentifier: MyConversationTableViewCell.className)
        conversationTableView.register(FirstOthersConversationTableViewCell.self, forCellReuseIdentifier: FirstOthersConversationTableViewCell.className)
        conversationTableView.register(OthersConversationTableViewCell.self, forCellReuseIdentifier: OthersConversationTableViewCell.className)
        
        
        let sideMenuBarButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconList24.image, style: .plain, target: self, action: #selector(menuButtonTapped))
        
        let dismissBarButtonItem = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconArrowLeft24.image, style: .plain, target: self, action: #selector(tapDismiss))
        
        sideMenuBarButton.tintColor = SharedDSKitAsset.Colors.gr100.color
        dismissBarButtonItem.tintColor = SharedDSKitAsset.Colors.gr100.color
        
        navigationItem.setRightBarButton(sideMenuBarButton, animated: false)
        navigationItem.setLeftBarButton(dismissBarButtonItem, animated: true)
        
        let tap = UIGestureRecognizer(target: self, action: #selector(endEditing))
        conversationTableView.addGestureRecognizer(tap)
        self.view.addGestureRecognizer(tap)
        view.addGestureRecognizer(tap)
    }
    
    private func render() {
        
        view.addSubViews([noticeView, conversationTableView, textInputView])
        
        noticeView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(37)
        }
        
        conversationTableView.snp.makeConstraints { make in
            make.top.equalTo(noticeView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(textInputView.snp.top)
        }
        
        textInputView.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.keyboardLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        
    }
    
    @objc private func menuButtonTapped() {
        let sideMenuVC = ChattingRoomSideMenuViewController()
        let menu = SideMenuNavigationController(rootViewController: sideMenuVC)
        
        SideMenuManager.default.rightMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        menu.presentationStyle = .menuSlideIn
        menu.menuWidth = self.view.frame.width * 0.84
        menu.presentationStyle.presentingEndAlpha = 0.6
        
        present(menu, animated: true, completion: nil)
    }
    
    @objc private func endEditing() {
        textInputView.textView.endEditing(true)
        view.endEditing(true)
    }
    
    @objc private func tapDismiss() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension ChattingRoomViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.dataSource[indexPath.row] {
            
        case let .myConversation(data):
            let cell = tableView.dequeueReusableCell(withIdentifier: MyConversationTableViewCell.className, for: indexPath) as! MyConversationTableViewCell
            cell.messageBox.text = data.message
            cell.timeLabel.text = data.time
            return cell
            
        case let .firstConversation(data):
            let cell = tableView.dequeueReusableCell(withIdentifier: FirstOthersConversationTableViewCell.className, for: indexPath) as! FirstOthersConversationTableViewCell
            cell.profileImage.image = data.profileImage
            cell.nameLabel.text = data.name
            cell.messageBox.text = data.message
            cell.timeLabel.text = data.time
            return cell
            
        case let .othersConversation(data):
            let cell = tableView.dequeueReusableCell(withIdentifier: OthersConversationTableViewCell.className, for: indexPath) as! OthersConversationTableViewCell
            cell.messageBox.text = data.message
            cell.timeLabel.text = data.time
            return cell
        }
    }
}

extension ChattingRoomViewController: UITextViewDelegate {
    public func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "메세지를 입력해주세요." {
            textView.text = nil
            textView.textColor = SharedDSKitAsset.Colors.gr100.color
        }
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "메세지를 입력해주세요."
            textView.textColor = SharedDSKitAsset.Colors.gr30.color
        }
    }
}
