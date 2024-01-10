//
//  SelfDevelopView.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/05.
//

import UIKit
import Shared


class SelfDevelopView: UIView {
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    let categoryView: UIView = {
        let view = UIView()
        return view
    }()
    
    let studyButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconStudy.image, for: .normal)
        button.layer.cornerRadius = 28
        return button
    }()
    
    let studyLabel: UILabel = {
        let label = UILabel()
        label.text = "스터디 · 자격증"
        label.font = Fonts.ST01.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    let sideButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconSide.image, for: .normal)
        button.layer.cornerRadius = 28
        return button
    }()
    
    let sideLabel: UILabel = {
        let label = UILabel()
        label.text = "사이드 프로젝트"
        label.font = Fonts.ST01.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    let changeJobButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconChangejob.image, for: .normal)
        button.layer.cornerRadius = 28
        return button
    }()
    
    let changeLabel: UILabel = {
        let label = UILabel()
        label.text = "이직 준비"
        label.font = Fonts.ST01.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    let languageButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconLanguage.image, for: .normal)
        button.layer.cornerRadius = 28
        return button
    }()
    
    let languageLabel: UILabel = {
        let label = UILabel()
        label.text = "어학"
        label.font = Fonts.ST01.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    let investmentButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconInvestment.image, for: .normal)
        button.layer.cornerRadius = 28
        return button
    }()
    
    let investmentLabel: UILabel = {
        let label = UILabel()
        label.text = "제테크"
        label.font = Fonts.ST01.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    let etcButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconEtc.image, for: .normal)
        button.layer.cornerRadius = 28
        return button
    }()
    
    let etcLabel: UILabel = {
        let label = UILabel()
        label.text = "기타"
        label.font = Fonts.ST01.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    let mockUpView: UIView = {
        let view = UIView()
        return view
    }()
    
    let mockUpImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.thumb3.image
        return imageView
    }()
    
    let mockUpTitle: UILabel = {
        let label = UILabel()
        label.text = "[디자이너 급구] 사이드 프로젝트"
        label.font = Fonts.SH02Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()
    
    let mockUpView2: UIView = {
        let view = UIView()
        return view
    }()
   
    let mockUpImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.thumb2.image
        return imageView
    }()
    
    let mockUpTitle2: UILabel = {
        let label = UILabel()
        label.text = "[백엔드] 사이드 플젝하실 백엔드개발자 구해요"
        label.font = Fonts.SH02Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()
    
    
    let mockUpView3: UIView = {
        let view = UIView()
        return view
    }()
    
    let mockUpImageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.thumb2.image
        return imageView
    }()
    
    let mockUpTitle3: UILabel = {
        let label = UILabel()
        label.text = "[백엔드] 사이드 플젝하실 백엔드개발자 구해요"
        label.font = Fonts.SH02Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()
    
    
    let mockUpView4: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let mockUpView5: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let shortMeetingTag: UIImageView = {
        let tag = UIImageView()
        tag.image = SharedDSKitAsset.Icons.iconShortTag.image
        return tag
    }()
    
    let onedayTag: UIImageView = {
        let tag = UIImageView()
        tag.image = SharedDSKitAsset.Icons.iconOnedayTag.image
        return tag
    }()
    
    let longTag: UIImageView = {
        let tag = UIImageView()
        tag.image = SharedDSKitAsset.Icons.iconLongTag.image
        return tag
    }()

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        self.backgroundColor = .white
        addSubViews([scrollView])
        
        scrollView.addSubViews([categoryView, mockUpView, mockUpView2, mockUpView3, mockUpView4, mockUpView5])
        
        categoryView.addSubViews([studyButton, sideButton, changeJobButton, languageButton, investmentButton, etcButton, studyLabel, sideLabel, changeLabel, languageLabel, investmentLabel, etcLabel])
        
        mockUpView.addSubViews([mockUpImageView, mockUpTitle, shortMeetingTag])
        mockUpView2.addSubViews([mockUpImageView2, mockUpTitle2, onedayTag])
        mockUpView3.addSubViews([mockUpImageView3, mockUpTitle3, longTag])
        
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(149)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        categoryView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(210)
        }
        studyButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(32)
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
        studyLabel.snp.makeConstraints { make in
            make.top.equalTo(studyButton.snp.bottom).offset(8)
            make.centerX.equalTo(studyButton.snp.centerX)
        }
        sideButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(studyButton.snp.trailing).offset(32)
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
        sideLabel.snp.makeConstraints { make in
            make.top.equalTo(sideButton.snp.bottom).offset(8)
            make.centerX.equalTo(sideButton.snp.centerX)
        }
        
        changeJobButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(sideButton.snp.trailing).offset(32)
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
        
        changeLabel.snp.makeConstraints { make in
            make.top.equalTo(changeJobButton.snp.bottom).offset(8)
            make.centerX.equalTo(changeJobButton.snp.centerX)
        }
        
        languageButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(changeJobButton.snp.trailing).offset(32)
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
        
        languageLabel.snp.makeConstraints { make in
            make.top.equalTo(languageButton.snp.bottom).offset(8)
            make.centerX.equalTo(languageButton.snp.centerX)
        }
        
        investmentButton.snp.makeConstraints { make in
            make.top.equalTo(studyLabel.snp.bottom).offset(16)
            make.width.equalTo(56)
            make.height.equalTo(56)
            make.leading.equalToSuperview().offset(32)
        }
        investmentLabel.snp.makeConstraints { make in
            make.top.equalTo(investmentButton.snp.bottom).offset(8)
            make.centerX.equalTo(investmentButton.snp.centerX)
        }
        
        etcButton.snp.makeConstraints { make in
            make.top.equalTo(sideLabel.snp.bottom).offset(16)
            make.width.equalTo(56)
            make.height.equalTo(56)
            make.leading.equalTo(investmentButton.snp.trailing).offset(32)
        }
        etcLabel.snp.makeConstraints { make in
            make.top.equalTo(etcButton.snp.bottom).offset(8)
            make.centerX.equalTo(etcButton.snp.centerX)
        }
        
        mockUpView.snp.makeConstraints { make in
            make.top.equalTo(categoryView.snp.bottom).offset(32)
            make.width.equalTo(335)
            make.centerX.equalToSuperview()
            make.height.equalTo(109)
        }
        
        mockUpImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        mockUpTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.leading.equalTo(mockUpImageView.snp.trailing).offset(16)
        }
        
        shortMeetingTag.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(mockUpImageView.snp.trailing).offset(16)
        }
        mockUpView2.snp.makeConstraints { make in
            make.top.equalTo(mockUpView.snp.bottom).offset(32)
            make.width.equalTo(335)
            make.centerX.equalToSuperview()
            make.height.equalTo(109)
        }
        
        mockUpImageView2.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        mockUpTitle2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.leading.equalTo(mockUpImageView2.snp.trailing).offset(16)
            make.trailing.equalToSuperview()
        }
        onedayTag.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(mockUpImageView2.snp.trailing).offset(16)
        }
        
        mockUpView3.snp.makeConstraints { make in
            make.top.equalTo(mockUpView2.snp.bottom).offset(32)
            make.width.equalTo(335)
            make.centerX.equalToSuperview()
            make.height.equalTo(109)
        }
        mockUpImageView3.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        mockUpTitle3.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.leading.equalTo(mockUpImageView3.snp.trailing).offset(16)
            make.trailing.equalToSuperview()
        }
        longTag.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(mockUpImageView3.snp.trailing).offset(16)
        }
        mockUpView4.snp.makeConstraints { make in
            make.top.equalTo(mockUpView3.snp.bottom).offset(32)
            make.width.equalTo(335)
            make.centerX.equalToSuperview()
            make.height.equalTo(109)
        }
        mockUpView5.snp.makeConstraints { make in
            make.top.equalTo(mockUpView4.snp.bottom).offset(32)
            make.width.equalTo(335)
            make.centerX.equalToSuperview()
            make.height.equalTo(109)
            make.bottom.equalToSuperview()
        }
    }
}
