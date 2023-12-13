//
//  ChattingRoomViewController.swift
//  FeatureChat
//
//  Created by 강민성 on 12/1/23.
//

import UIKit
import FeatureChatInterface
import Shared

public class ChattingRoomViewController: UIViewController {
    
    weak var delegate: ChattingRoomSideMenuDelegate?
    
    var dataSource = [ConversationMockDataModel]()
    
    private var noticeView: NoticeHeaderView!
    
    private var conversationTableView: UITableView = {
        var tableView = UITableView()
        
        return tableView
    }()
    
    private var textInputView: ChattingTextInputView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        mocking()
        setUp()
        render()
    }
    
    private func mocking() {
        self.dataSource = [
            .firstConversation(data: FirstOthersConversationCellMockData(profileImage: SharedDSKitAsset.Icons.kakao.image, name: "테스트아이디1", message: "테스트내용입니다ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ", time: "12:01")),
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
        
        
        let barButtonItem = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconSave24.image, style: .plain, target: self, action: #selector(menuButtonTapped))
        
        navigationItem.setRightBarButton(barButtonItem, animated: false)
        
        let didTapTableViewGesture = UIGestureRecognizer(target: self.conversationTableView, action: #selector(didTapView))
        view.addGestureRecognizer(didTapTableViewGesture)
    }
    
    private func render() {
        
        view.addSubViews([noticeView, conversationTableView, textInputView])
        
        noticeView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(37)
        }
        
        // textInputView Auto-Layout
        NSLayoutConstraint.activate([
            textInputView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            textInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textInputView.heightAnchor.constraint(greaterThanOrEqualToConstant: 56)
        ])
        
        conversationTableView.snp.makeConstraints { make in
            make.top.equalTo(noticeView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(textInputView.snp.top)
        }
        
    }
    
    @objc private func menuButtonTapped() {
        delegate?.menuButtonTapped()
    }
    
    @objc private func didTapView() {
        textInputView.resignFirstResponder()
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
}
