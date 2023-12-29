//
//  ScheduleDetailView.swift
//  FeatureChat
//
//  Created by 강민성 on 12/25/23.
//

import UIKit
import Shared

class ScheduleDetailView: UIView {
    
    var titleAndMemberCountStackView: UIView = {
        var view = UIView()
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "주말 영어 스터디"
        label.font = Fonts.H02.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    let memberCountLabel: UILabel = {
        let label = UILabel()
        label.text = "15명 중 3명 참여 중"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    
    var informationStackView: UIView = {
        var view = UIView()
        return view
    }()
    
    var dateAndTimeStackView: UIView = {
        var view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    var dateAndTimeImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconCalendar24.image
        return imageView
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "20203. 11. 22"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "오후 17:00"
        label.font = Fonts.Body01.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    
    var locationImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconPlace24.image
        return imageView
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "서울시 서초구 문화회관"
        label.lineBreakMode = .byTruncatingTail
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    var maximumMemberImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconMy24.image
        return imageView
    }()
    
    let maximumMemberLabel: UILabel = {
        let label = UILabel()
        label.text = "최대 15명"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    var budgetImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconWallet24.image
        return imageView
    }()
    
    let budgetLabel: UILabel = {
        let label = UILabel()
        label.text = "5,000원"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    var descriptionStackView: UIView = {
        var view = UIView()
        return view
    }()
    
    let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "일정상세"
        label.font = Fonts.SH03Bold.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    let descriptionBodyLabel: UILabel = {
        let label = UILabel()
        label.text = "극 I라도 괜찮아요!\n지난 번 모임에도 무려 9분이나 참석해주셨는데 너무 알찼답니다~\n이번 스터디에서는 join관련해서 실제 쿼리작성해서\n실무 수행해볼 예정입니다!\n준비해올 것은 노트북뿐!"
        label.numberOfLines = 5
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    var separatorLine: UIView = {
        var view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        return view
    }()
    
    var memberListStackView: UIView = {
        var view = UIView()
        return view
    }()
    
    let memberListTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "참여멤버"
        label.font = Fonts.SH03Bold.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    let memberListCountLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    
    var memberListTableView: UITableView = {
        var tableView = UITableView()
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        titleAndMemberCountStackView.addSubViews([titleLabel, memberCountLabel])
        
        dateAndTimeStackView.addSubViews([dateAndTimeImageView ,dateLabel, timeLabel])
        
        informationStackView.addSubViews([
            dateAndTimeStackView,
            locationImageView,
            locationLabel,
            maximumMemberImageView,
            maximumMemberLabel,
            budgetImageView,
            budgetLabel
        ])
        
        descriptionStackView.addSubViews([descriptionTitleLabel, descriptionBodyLabel])
        
        memberListStackView.addSubViews([memberListTitleLabel, memberListCountLabel, memberListTableView])
        
        addSubViews([
            titleAndMemberCountStackView,
            informationStackView,
            separatorLine,
            descriptionStackView,
            memberListStackView
        ])
        
        titleAndMemberCountStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(60)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.equalTo(34)
        }
        
        memberCountLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview()
            make.height.equalTo(22)
        }
        
        informationStackView.snp.makeConstraints { make in
            make.top.equalTo(titleAndMemberCountStackView.snp.bottom).offset(40)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(189)
        }
        
        dateAndTimeStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(45)
        }
        
        dateAndTimeImageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.size.equalTo(24)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(dateAndTimeImageView.snp.trailing).offset(16)
            make.height.equalTo(24)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom)
            make.leading.equalTo(dateAndTimeImageView.snp.trailing).offset(16)
            make.height.equalTo(21)
        }
        
        locationImageView.snp.makeConstraints { make in
            make.top.equalTo(dateAndTimeStackView.snp.bottom).offset(24)
            make.leading.equalToSuperview()
            make.size.equalTo(24)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locationImageView)
            make.leading.equalTo(locationImageView.snp.trailing).offset(16)
            make.trailing.greaterThanOrEqualToSuperview()
        }
        
        maximumMemberImageView.snp.makeConstraints { make in
            make.top.equalTo(locationImageView.snp.bottom).offset(24)
            make.leading.equalToSuperview()
            make.size.equalTo(24)
        }
        
        maximumMemberLabel.snp.makeConstraints { make in
            make.centerY.equalTo(maximumMemberImageView)
            make.leading.equalTo(maximumMemberImageView.snp.trailing).offset(16)
        }
        
        budgetImageView.snp.makeConstraints { make in
            make.top.equalTo(maximumMemberImageView.snp.bottom).offset(24)
            make.leading.equalToSuperview()
            make.size.equalTo(24)
        }
        
        budgetLabel.snp.makeConstraints { make in
            make.centerY.equalTo(budgetImageView)
            make.leading.equalTo(budgetImageView.snp.trailing).offset(16)
        }
        
        separatorLine.snp.makeConstraints { make in
            make.top.equalTo(informationStackView.snp.bottom).offset(40)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(1)
        }
        
        descriptionStackView.snp.makeConstraints { make in
            make.top.equalTo(separatorLine.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(161)
        }
        
        descriptionTitleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.equalTo(24)
        }
        
        descriptionBodyLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionTitleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.greaterThanOrEqualTo(24)
        }
        
        memberListStackView.snp.makeConstraints { make in
            make.top.equalTo(descriptionStackView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
        
        memberListTitleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.equalTo(25)
        }
        
        memberListCountLabel.snp.makeConstraints { make in
            make.leading.equalTo(memberListTitleLabel.snp.trailing).offset(4)
            make.top.equalToSuperview()
        }
        
        memberListTableView.snp.makeConstraints { make in
            make.top.equalTo(memberListTitleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
