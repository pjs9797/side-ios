//
//  ChattingRoomSideMenuViewController.swift
//  FeatureChat
//
//  Created by 강민성 on 12/3/23.
//

import UIKit
import Shared

import SnapKit

class ChattingRoomSideMenuViewController: UIViewController {
    
    private var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
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
    
    private var trailingConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

/*
extension ChattingRoomSideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

extension ChattingRoomSideMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
*/
