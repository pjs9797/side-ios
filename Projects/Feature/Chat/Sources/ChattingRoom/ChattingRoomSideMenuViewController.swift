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

protocol ChattingRoomSideMenuDelegate: AnyObject {
    func menuButtonTapped()
}

struct SideMenuItem {
    var roomTitle: String
    var date: String
    var albumImage: [UIImage]
    var members: [String]
    let viewController: ChattingRoomViewController
}

class ChattingRoomSideMenuViewController: UIViewController {
    
    weak var delegate: ChattingRoomSideMenuDelegate?
    
    var tableViewDataSource = [MemberListDataModel]()
    
    var collectionViewDataSource = [UIImage]()
    
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
    
    private var calendarButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(SharedDSKitAsset.Icons.iconCalendar24.image, for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.bgLightGray.color
        button.setTitle("일정", for: .normal)
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitleColor(SharedDSKitAsset.Colors.text02.color, for: .normal)
        
        return button
    }()
    
    private var voteButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(SharedDSKitAsset.Icons.iconVote24.image, for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.bgLightGray.color
        button.setTitle("투표", for: .normal)
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitleColor(SharedDSKitAsset.Colors.text02.color, for: .normal)
        
        return button
    }()
    
    private var titleAndButtonsView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var albumTitleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "앨범"
        label.font = Fonts.SH02Bold.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    private var goToAlbumViewButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(SharedDSKitAsset.Icons.iconArrowRight16.image, for: .normal)
        return button
    }()
    
    private var memberListTitleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "멤버"
        label.font = Fonts.SH02Bold.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    private let albumCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collectionView
    }()
    
    private let memberListTableView: UITableView = {
        var tableView = UITableView()
        tableView.bounces = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private var albumsStackView: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        view.backgroundColor = .clear
        mocking()
        mockingCollectionView()
        setUp()
        configureSubviews()
        configureTapGesture()
        render()
    }
    
    private func render() {
        
        configureSubviews()
        
        // 애니메이션
        view.frame.origin.x = self.view.frame.size.width
        
        topConstraint = sideMenuView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.size.height)
        topConstraint.isActive = true
        
        trailingConstraint = sideMenuView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.size.width)
        trailingConstraint.isActive = true
        
        leadingConstraint = sideMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.size.width)
        leadingConstraint.isActive = true
        
        sideMenuView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(44)
        }
        
        sideMenuView.heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.845).isActive = true
        sideMenuView.widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.845).isActive = true
        sideMenuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
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
            make.width.equalTo(((view.frame.size.width * 0.845 - 2) / 3))
            make.leading.bottom.equalToSuperview()
            make.top.equalTo(roomDateLabel.snp.bottom).offset(24)
        }
        
        noticeButton.alignTextBelow(spacing: 4)
        
        calendarButton.snp.makeConstraints { make in
            make.width.equalTo(((view.frame.size.width * 0.845 - 2) / 3))
            make.bottom.equalToSuperview()
            make.leading.equalTo(noticeButton.snp.trailing).offset(1)
            make.trailing.equalTo(voteButton.snp.leading).offset(-1)
            make.top.equalTo(roomDateLabel.snp.bottom).offset(24)
        }
        
        calendarButton.alignTextBelow(spacing: 4)
        
        voteButton.snp.makeConstraints { make in
            make.width.equalTo(((view.frame.size.width * 0.845 - 2) / 3))
            make.bottom.trailing.equalToSuperview()
            make.top.equalTo(roomDateLabel.snp.bottom).offset(24)
        }
        
        voteButton.alignTextBelow(spacing: 4)
        
        // 두번째 스택뷰
        albumsStackView.snp.makeConstraints { make in
            make.top.equalTo(titleAndButtonsView.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(103)
        }
        
        albumTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-36)
            make.height.equalTo(22)
        }
        
        goToAlbumViewButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(albumTitleLabel.snp.trailing)
            make.trailing.equalToSuperview()
            make.height.equalTo(22)
        }
        
        albumCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
            make.top.equalTo(albumTitleLabel.snp.bottom).offset(16)
        }
        
        // 세번째 스택뷰
        membersStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(albumsStackView.snp.bottom).offset(40)
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
        
        titleAndButtonsView.addSubViews([roomTitleLabel, roomDateLabel, noticeButton, calendarButton, voteButton])
        
        albumsStackView.addSubViews([albumTitleLabel, albumCollectionView, goToAlbumViewButton])
        
        membersStackView.addSubViews([memberListTitleLabel, memberListTableView])
        
        sideMenuView.addSubViews([titleAndButtonsView, albumsStackView, membersStackView, buttonsFooterView])
        
        view.addSubview(sideMenuView)
        
    }
    
    private func setUp() {
        memberListTableView.delegate = self
        memberListTableView.dataSource = self
        
        albumCollectionView.delegate = self
        albumCollectionView.dataSource = self
        
        memberListTableView.register(MemberListTableViewCell.self, forCellReuseIdentifier: MemberListTableViewCell.className)
        
        albumCollectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.className)
    }
    
    private func mocking() {
        self.tableViewDataSource = [
            .member(data: MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "청계산 다람쥐", isAdmin: true, isMe: false)),
            .member(data: MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "김혁", isAdmin: false, isMe: true)),
            .member(data: MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "Hardmedia201821", isAdmin: false, isMe: false)),
            .member(data: MemberListCellMockData(image: SharedDSKitAsset.Icons.testPhoto.image, name: "몽이건강해", isAdmin: false, isMe: false))
        ]
        self.memberListTableView.reloadData()
    }
    
    private func mockingCollectionView() {
        self.collectionViewDataSource = [
            SharedDSKitAsset.Icons.testPhoto.image,
            SharedDSKitAsset.Icons.testPhoto.image,
            SharedDSKitAsset.Icons.testPhoto.image,
            SharedDSKitAsset.Icons.testPhoto.image
        ]
        self.albumCollectionView.reloadData()
    }
    
    func show() {
        self.view.frame.origin.x = 0
        self.view.frame.origin.y = 0
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        UIView.animate(withDuration: 0.5) {
            self.leadingConstraint.constant = 60
            self.trailingConstraint.constant = 0
            self.topConstraint.constant = 44
            self.view.layoutIfNeeded()
        }
    }
    
    func hide() {
        self.view.backgroundColor = .clear
        UIView.animate(withDuration: 0.5) {
            self.leadingConstraint.constant = self.view.frame.size.width
            self.topConstraint.constant = self.view.frame.size.height
            self.trailingConstraint.constant = -self.view.frame.size.width
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.view.frame.origin.x = self.view.frame.size.width
            self.view.frame.origin.y = self.view.frame.size.height
        }
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.delegate = self
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapped() {
        hide()
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
            let cell = tableView.dequeueReusableCell(withIdentifier: MemberListTableViewCell.className, for: indexPath) as! MemberListTableViewCell
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

extension ChattingRoomSideMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionViewDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.className, for: indexPath) as! AlbumCollectionViewCell
        cell.photoImageView.image = collectionViewDataSource[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 65, height: 65)
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
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

            titleEdgeInsets = UIEdgeInsets(top: spacing, left: -image.size.width, bottom: -image.size.height, right: 0)
            imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
        }
}
