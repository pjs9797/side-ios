//
//  selfDevelopmentView.swift
//  FeatureProfile
//
//  Created by yoonyeosong on 2023/11/20.
//

import UIKit
import Shared
import SnapKit

class SelfDevelopmentView: UIView {
    var progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.progress = 5/6
        progressBar.tintColor = SharedDSKitAsset.Colors.gr100.color
        progressBar.trackTintColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        return progressBar
    }()
    
    var selfDevelopmentMainLabel: UILabel = {
        let label = UILabel()
        label.text = "퇴근 후 하고싶은 자기계발은 무엇인가요?"
        label.font = Fonts.H01.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    var selfDevelopmentSubLabel: UILabel = {
        let label = UILabel()
        label.text = "*중복선택 가능"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
        
    }()
    
    var sideProjectButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    var sideProjectImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconSide.image
        imageView.layer.cornerRadius = 36
        return imageView
    }()
    
    var sideProjectLabel: UILabel = {
        let label = UILabel()
        label.text = "사이드 프로젝트"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()
    
    var changeJobButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    var changeJobImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconChangejob.image
        imageView.layer.cornerRadius = 36
        return imageView
    }()
    
    var changeJobLabel: UILabel = {
        let label = UILabel()
        label.text = "이직 준비"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()
    
    var studyButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    var studyLabel: UILabel = {
        let label = UILabel()
        label.text = "스터디 · 자격증"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()
    
    var studyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconStudy.image
        imageView.layer.cornerRadius = 36
        return imageView
    }()
    
    var investmentButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    var investmentLabel: UILabel = {
        let label = UILabel()
        label.text = "제테크"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()
    
    var investmentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconInvestment.image
        imageView.layer.cornerRadius = 36
        return imageView
    }()
    
    var languageButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    var languageLabel: UILabel = {
        let label = UILabel()
        label.text = "어학"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()
    
    var languageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconLanguage.image
        imageView.layer.cornerRadius = 36
        return imageView
    }()
    
    var etcButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    var etcLabel: UILabel = {
        let label = UILabel()
        label.text = "기타"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()
    
    var etcImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconEtc.image
        imageView.layer.cornerRadius = 36
        return imageView
    }()
    
    var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.setTitleColor(SharedDSKitAsset.Colors.gr30
            .color, for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render(){
        self.backgroundColor = .white
        addSubViews([progressBar, sideProjectButton, changeJobButton, studyButton, investmentButton, languageButton, etcButton, selfDevelopmentSubLabel, selfDevelopmentMainLabel, nextButton])
        sideProjectButton.addSubViews([sideProjectLabel, sideProjectImageView])
        changeJobButton.addSubViews([changeJobLabel, changeJobImageView])
        studyButton.addSubViews([studyLabel, studyImageView])
        investmentButton.addSubViews([investmentLabel, investmentImageView])
        languageButton.addSubViews([languageLabel, languageImageView])
        etcButton.addSubViews([etcLabel, etcImageView])
        
        progressBar.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        selfDevelopmentMainLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(160)
            make.leading.equalToSuperview().offset(20)
        }
        selfDevelopmentSubLabel.snp.makeConstraints{ make in
            make.top.equalTo(selfDevelopmentMainLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(30)
        }
        sideProjectButton.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(selfDevelopmentSubLabel.snp.bottom).offset(60)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        sideProjectLabel.snp.makeConstraints { make in
            make.bottom.equalTo(sideProjectButton.snp.bottom).offset(-4)
            make.centerX.equalTo(sideProjectButton.snp.centerX)
        }
        sideProjectImageView.snp.makeConstraints { make in
            make.top.equalTo(sideProjectButton.snp.top)
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalTo(sideProjectButton.snp.centerX)
        }
        changeJobButton.snp.makeConstraints{ make in
            make.leading.equalTo(sideProjectButton.snp.trailing).offset(20)
            make.top.equalTo(selfDevelopmentSubLabel.snp.bottom).offset(60)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        changeJobLabel.snp.makeConstraints { make in
            make.bottom.equalTo(changeJobButton.snp.bottom).offset(-4)
            make.centerX.equalTo(changeJobButton.snp.centerX)
        }
        changeJobImageView.snp.makeConstraints { make in
            make.top.equalTo(changeJobButton.snp.top)
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalTo(changeJobButton.snp.centerX)
        }
        
        studyButton.snp.makeConstraints{ make in
            make.leading.equalTo(changeJobButton.snp.trailing).offset(20)
            make.top.equalTo(selfDevelopmentSubLabel.snp.bottom).offset(60)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        studyLabel.snp.makeConstraints { make in
            make.bottom.equalTo(studyButton.snp.bottom).offset(-4)
            make.centerX.equalTo(studyButton.snp.centerX)
        }
        studyImageView.snp.makeConstraints { make in
            make.top.equalTo(studyButton.snp.top)
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalTo(studyButton.snp.centerX)
        }
        investmentButton.snp.makeConstraints{ make in
            make.top.equalTo(sideProjectButton.snp.bottom).offset(60)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        investmentLabel.snp.makeConstraints { make in
            make.bottom.equalTo(investmentButton.snp.bottom).offset(-4)
            make.centerX.equalTo(investmentButton.snp.centerX)
        }
        investmentImageView.snp.makeConstraints { make in
            make.top.equalTo(investmentButton.snp.top)
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalTo(investmentButton.snp.centerX)
        }
        languageButton.snp.makeConstraints{ make in
            make.top.equalTo(sideProjectButton.snp.bottom).offset(60)
            make.leading.equalTo(investmentButton.snp.trailing).offset(20)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        languageLabel.snp.makeConstraints { make in
            make.bottom.equalTo(languageButton.snp.bottom).offset(-4)
            make.centerX.equalTo(languageButton.snp.centerX)
        }
        languageImageView.snp.makeConstraints { make in
            make.top.equalTo(languageButton.snp.top)
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalTo(languageButton.snp.centerX)
        }
        etcButton.snp.makeConstraints{ make in
            make.top.equalTo(sideProjectButton.snp.bottom).offset(60)
            make.leading.equalTo(languageButton.snp.trailing).offset(20)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        etcLabel.snp.makeConstraints { make in
            make.bottom.equalTo(etcButton.snp.bottom).offset(-4)
            make.centerX.equalTo(etcButton.snp.centerX)
        }
        etcImageView.snp.makeConstraints { make in
            make.top.equalTo(etcButton.snp.top)
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalTo(etcButton.snp.centerX)
        }
        nextButton.snp.makeConstraints{ make in
            make.width.equalTo(375)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
        }
    }
}
