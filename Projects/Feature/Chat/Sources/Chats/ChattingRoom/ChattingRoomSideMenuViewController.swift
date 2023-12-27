//
//  ChattingRoomSideMenuViewController.swift
//  FeatureChat
//
//  Created by 강민성 on 12/3/23.
//

import UIKit
import FeatureChatInterface
import Shared

import SnapKit
import SideMenu

protocol ChattingRoomSideMenuDelegate: AnyObject {
    func menuButtonTapped()
    func itemSelected(item: UIViewController)
}

class ChattingRoomSideMenuViewController: UIViewController {
    
    var tableViewDataSource = [MemberListDataModel]()
    
    private var buttonsFooterView = ButtonsFooterView()
    
    var sideMenuView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var roomTitleLabel: UILabel = {
        var label = UILabel()
        label.text = "영화관투어모임 영사모 >_<"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.SH03Bold.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    private var roomDateLabel: UILabel = {
        var label = UILabel()
        label.text = "개설일 2023.11.15"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    
    private var noticeButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(SharedDSKitAsset.Icons.iconNotice24.image, for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.bgLightGray.color
        button.setTitle("공지", for: .normal)
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitleColor(SharedDSKitAsset.Colors.text02.color, for: .normal)
        
        return button
    }()
    
    private var scheduleButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(SharedDSKitAsset.Icons.iconCalendar24.image, for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.bgLightGray.color
        button.setTitle("일정", for: .normal)
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitleColor(SharedDSKitAsset.Colors.text02.color, for: .normal)
        
        return button
    }()
    
    private var titleAndButtonsView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var memberListTitleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "멤버"
        label.font = Fonts.SH02Bold.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    private let memberListTableView: UITableView = {
        var tableView = UITableView()
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        return tableView
    }()
    
    private var membersStackView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var trailingConstraint: NSLayoutConstraint!
    private var topConstraint: NSLayoutConstraint!
    private var leadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        mocking()
        setUp()
        configureSubviews()
        render()
    }
    
    private func render() {
        
        configureSubviews()
        
        sideMenuView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-topbarHeight)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        // 첫번쨰 스택뷰
        titleAndButtonsView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(147)
        }
        
        roomTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(25)
        }
        
        roomDateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(roomTitleLabel.snp.bottom).offset(4)
            make.height.equalTo(17)
        }
        
        noticeButton.snp.makeConstraints { make in
            make.width.equalTo(((view.frame.size.width * 0.845 - 2) / 2))
            make.leading.bottom.equalToSuperview()
            make.top.equalTo(roomDateLabel.snp.bottom).offset(24)
        }
        
        noticeButton.alignTextBelow(spacing: 4)
        
        scheduleButton.snp.makeConstraints { make in
            make.width.equalTo(((view.frame.size.width * 0.845 - 2) / 2))
            make.bottom.equalToSuperview()
            make.leading.equalTo(noticeButton.snp.trailing).offset(1)
            make.trailing.equalToSuperview().offset(-1)
            make.top.equalTo(roomDateLabel.snp.bottom).offset(24)
        }
        
        scheduleButton.alignTextBelow(spacing: 4)
        
        // 두번째 스택뷰
        membersStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleAndButtonsView.snp.bottom).offset(40)
            make.bottom.equalTo(buttonsFooterView.snp.top)
        }
        
        memberListTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(22)
        }
        
        memberListTableView.snp.makeConstraints { make in
            make.top.equalTo(memberListTitleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        buttonsFooterView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(56)
        }
    }
    
    private func configureSubviews() {
        
        titleAndButtonsView.addSubViews([roomTitleLabel, roomDateLabel, noticeButton, scheduleButton])
        
        membersStackView.addSubViews([memberListTitleLabel, memberListTableView])
        
        sideMenuView.addSubViews([titleAndButtonsView, membersStackView, buttonsFooterView])
        
        view.addSubview(sideMenuView)
        
    }
    
    private func setUp() {
        memberListTableView.delegate = self
        memberListTableView.dataSource = self
        
        memberListTableView.register(MemberListTableViewCell.self, forCellReuseIdentifier: MemberListTableViewCell.className)
        
        noticeButton.addTarget(self, action: #selector(didTapNoticeButton), for: .touchUpInside)
        scheduleButton.addTarget(self, action: #selector(didTapScheduleButton), for: .touchUpInside)
    }
    
    private func mocking() {
        self.tableViewDataSource = [
            .member(data: MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "청계산 다람쥐", isAdmin: true, isMe: false)),
            .member(data: MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "김혁", isAdmin: false, isMe: true)),
            .member(data: MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "Hardmedia201821", isAdmin: false, isMe: false)),
            .member(data: MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "몽이건강해", isAdmin: false, isMe: false)),
            .member(data: MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "청계산 다람쥐", isAdmin: true, isMe: false)),
            .member(data: MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "김혁", isAdmin: false, isMe: true)),
            .member(data: MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "Hardmedia201821", isAdmin: false, isMe: false)),
            .member(data: MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "몽이건강해", isAdmin: false, isMe: false)),
            .member(data: MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "청계산 다람쥐", isAdmin: true, isMe: false)),
            .member(data: MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "김혁", isAdmin: false, isMe: true)),
            .member(data: MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "Hardmedia201821", isAdmin: false, isMe: false)),
            .member(data: MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "몽이건강해", isAdmin: false, isMe: false))
        ]
        self.memberListTableView.reloadData()
    }
    
    @objc private func didTapNoticeButton() {
        navigationController?.pushViewController(NSVViewController(selectedSegmentIndex: 0), animated: true)
    }
    
    @objc private func didTapScheduleButton() {
        navigationController?.pushViewController(NSVViewController(selectedSegmentIndex: 1), animated: true)
    }
}


extension ChattingRoomSideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.tableViewDataSource[indexPath.row] {
        case let .member(data):
            let cell = tableView.dequeueReusableCell(
                withIdentifier: MemberListTableViewCell.className, for: indexPath
            ) as! MemberListTableViewCell
            cell.profileImageView.image = data.image
            cell.nameLabel.text = data.name
            if data.isMe {
                cell.meLabel.isHidden = false
            }
            if data.isAdmin {
                cell.adminSubImageView.isHidden = false
            }
            return cell
        }
    }
}

extension ChattingRoomSideMenuViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let view = touch.view else { return false }
        if view === titleAndButtonsView || view.isDescendant(of: memberListTableView) {
            return false
        }
        return true
    }
}

extension UIButton {
    
    func alignTextBelow(spacing: CGFloat = 4.0) {
        guard let image = self.imageView?.image else {
            return
        }
        
        guard let titleLabel = self.titleLabel else {
            return
        }
        
        guard let titleText = titleLabel.text else {
            return
        }
        
        let titleSize = titleText.size(withAttributes: [
            NSAttributedString.Key.font: titleLabel.font as Any
        ])
        
        titleEdgeInsets = UIEdgeInsets(
            top: spacing,
            left: -image.size.width,
            bottom: -image.size.height,
            right: 0
        )
        imageEdgeInsets = UIEdgeInsets(
            top: -(titleSize.height + spacing),
            left: 0,
            bottom: 0,
            right: -titleSize.width
        )
    }
}

extension UIViewController {
    
    var topbarHeight: CGFloat {
        return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
        (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}
