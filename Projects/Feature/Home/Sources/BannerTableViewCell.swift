//
//  BannerTableViewCell.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/05.
//

import UIKit
import Shared

class BannerTableViewCell: UITableViewCell {
    
    
    let studyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.layer.cornerRadius = 28
        return button
    }()
    let studyLabel: UILabel = {
        let label = UILabel()
        label.text = "스터디 자격증"
        label.font = Fonts.ST01.font
        return label
    }()
    
    let sideProjectButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.layer.cornerRadius = 28
        return button
    }()
    let sideProjectLabel: UILabel = {
        let label = UILabel()
        label.text = "사이드 프로젝트"
        label.font = Fonts.ST01.font
        return label
    }()
    
    let jobChangeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.layer.cornerRadius = 28
        return button
    }()
    let jobChangeLabel: UILabel = {
        let label = UILabel()
        label.text = "이직 준비"
        label.font = Fonts.ST01.font
        return label
    }()
    
    
    let languageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.layer.cornerRadius = 28
        return button
    }()
    let languageLabel: UILabel = {
        let label = UILabel()
        label.text = "어학"
        label.font = Fonts.ST01.font
        return label
    }()
    
    let investmentButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.layer.cornerRadius = 28
        return button
    }()
    let investmentLabel: UILabel = {
        let label = UILabel()
        label.text = "재테크"
        label.font = Fonts.ST01.font
        return label
    }()
    
    let etcButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.layer.cornerRadius = 28
        return button
    }()
    let etcLabel: UILabel = {
        let label = UILabel()
        label.text = "기타"
        label.font = Fonts.ST01.font
        return label
    }()
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraint()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraint() {
       
        contentView.addSubViews([studyButton, sideProjectButton, jobChangeButton, languageButton, investmentButton, etcButton
                                ,studyLabel, sideProjectLabel, jobChangeLabel, languageLabel, investmentLabel, etcLabel])

        studyButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.top.equalToSuperview().offset(20)
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
        studyLabel.snp.makeConstraints { make in
            make.centerX.equalTo(studyButton)
            make.top.equalTo(studyButton.snp.bottom).offset(8)
        }
        sideProjectButton.snp.makeConstraints { make in
            make.leading.equalTo(studyButton.snp.trailing).offset(30)
            make.top.equalToSuperview().offset(20)
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
        sideProjectLabel.snp.makeConstraints { make in
            make.centerX.equalTo(sideProjectButton)
            make.top.equalTo(studyButton.snp.bottom).offset(8)
        }
        jobChangeButton.snp.makeConstraints { make in
            make.leading.equalTo(sideProjectButton.snp.trailing).offset(30)
            make.top.equalToSuperview().offset(20)
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
        jobChangeLabel.snp.makeConstraints { make in
            make.centerX.equalTo(jobChangeButton)
            make.top.equalTo(studyButton.snp.bottom).offset(8)
        }
        languageButton.snp.makeConstraints { make in
            make.leading.equalTo(jobChangeButton.snp.trailing).offset(30)
            make.top.equalToSuperview().offset(20)
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
        languageLabel.snp.makeConstraints { make in
            make.centerX.equalTo(languageButton)
            make.top.equalTo(studyButton.snp.bottom).offset(8)
        }
        investmentButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.top.equalTo(studyButton.snp.bottom).offset(40)
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
        investmentLabel.snp.makeConstraints { make in
            make.centerX.equalTo(investmentButton)
            make.top.equalTo(investmentButton.snp.bottom).offset(8)
        }
        etcButton.snp.makeConstraints { make in
            make.leading.equalTo(investmentButton.snp.trailing).offset(30)
            make.top.equalTo(sideProjectButton.snp.bottom).offset(40)
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
        etcLabel.snp.makeConstraints { make in
            make.centerX.equalTo(etcButton)
            make.top.equalTo(etcButton.snp.bottom).offset(8)
        }
   
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
