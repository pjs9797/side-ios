//
//  MyPageView.swift
//  FeatureMyPageInterface
//
//  Created by coco on 2023/12/15.
//

import UIKit
import Shared
import SnapKit

public class MyPageView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        return scrollView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let profileSectionView = ProfileSectionView()
    
    let separatorLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = SharedDSKitAsset.Colors.bgLightGray.color
        
        return view
    }()
    
    let tableSectionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "내 활동"
        label.font = Fonts.SH03Bold.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        label.sizeToFit()
        
        return label
    }()
    
    let tableSectionDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "모임"
        label.font = Fonts.SH01.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        label.sizeToFit()
        
        return label
    }()
    
    let clubsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MyPageCellView.self, forCellReuseIdentifier: MyPageCellView.className)
        tableView.isScrollEnabled = false
        tableView.rowHeight = 56
        tableView.backgroundColor = .red
        
        return tableView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        addSubViews([scrollView])
//        scrollView.addSubViews([containerView])
        scrollView.addSubViews([profileSectionView, separatorLine, clubsTableView, tableSectionTitleLabel, tableSectionDescriptionLabel])
//        containerView.addSubViews([profileSectionView, separatorLine, clubsTableView, tableSectionTitleLabel, tableSectionDescriptionLabel])
        
        
    }
}

extension UIButton {
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
}
