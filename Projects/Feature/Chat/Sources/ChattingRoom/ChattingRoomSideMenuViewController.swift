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

class ChattingRoomSideMenuViewController: UIViewController {
    
    weak var delegate: ChattingRoomSideMenuDelegate?
    
    var tableViewDataSource = [MemberListDataModel]()
    
    var collectionViewDataSource = [UIImage]()
    
    /*
    private var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    */
    private var roomTitleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.SH03Bold.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    private var roomDateLabel: UILabel = {
        var label = UILabel()
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
        button.titleLabel?.textColor = SharedDSKitAsset.Colors.gr80.color
        return button
    }()
    
    private var calendarButton: UIButton = {
       var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(SharedDSKitAsset.Icons.iconCalendar24.image, for: .normal)
         button.backgroundColor = SharedDSKitAsset.Colors.bgLightGray.color
         button.setTitle("일정", for: .normal)
         button.titleLabel?.font = Fonts.Caption.font
         button.titleLabel?.textColor = SharedDSKitAsset.Colors.gr80.color
        return button
    }()
    
    private var voteButton: UIButton = {
       var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(SharedDSKitAsset.Icons.iconVote24.image, for: .normal)
         button.backgroundColor = SharedDSKitAsset.Colors.bgLightGray.color
         button.setTitle("투표", for: .normal)
         button.titleLabel?.font = Fonts.Caption.font
         button.titleLabel?.textColor = SharedDSKitAsset.Colors.gr80.color
        return button
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
        var collectionView = UICollectionView()
        
        return collectionView
    }()
    
    private let memberListTableView: UITableView = {
        var tableView = UITableView()
        
        return tableView
    }()
    
    private var buttonsFooterView: ButtonsFooterView!
    
    private var trailingConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        mocking()
        mockingCollectionView()
        setUp()
        render()
    }
    
    private func render() {
        view.addSubViews([roomTitleLabel, roomDateLabel, noticeButton, calendarButton, voteButton, albumTitleLabel, albumCollectionView, goToAlbumViewButton, memberListTitleLabel, memberListTableView, buttonsFooterView])
        
        view.snp.makeConstraints { make in
            
        }
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
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        UIView.animate(withDuration: 0.5) {
            self.trailingConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    func hide() {
        self.view.backgroundColor = .clear
        UIView.animate(withDuration: 0.5) {
            self.trailingConstraint.constant = -self.view.frame.size.width
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.view.frame.origin.x = -self.view.frame.size.width
        }
    }

}


extension ChattingRoomSideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.tableViewDataSource[indexPath.row] {
        case let .member(data):
            let cell = tableView.dequeueReusableCell(withIdentifier: MemberListTableViewCell.className, for: indexPath) as! MemberListTableViewCell
            cell.profileImageView.image = data.image
            cell.nameLabel.text = data.name
            guard !data.isMe else {
                cell.meLabel.isHidden = false
            }
            guard !data.isAdmin else {
                cell.adminSubImageView.isHidden = false
            }
            return cell
        }
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

