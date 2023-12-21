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
    
    var selfDevelopmentButton1: UIButton = {
        let button = UIButton()
        button.setTitle("사이드 프로젝트", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.cornerRadius = 36
        button.titleLabel?.font = Fonts.SH01Bold.font
        return button
    }()
    
    var selfDevelopmentButton2: UIButton = {
        let button = UIButton()
        button.setTitle("이직준비", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.cornerRadius = 36
        button.titleLabel?.font = Fonts.SH01Bold.font
        return button
    }()
    
    var selfDevelopmentButton3: UIButton = {
        let button = UIButton()
        button.setTitle("자격증·스터디", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.cornerRadius = 36
        button.titleLabel?.font = Fonts.SH01Bold.font
        return button
    }()
    
    var selfDevelopmentButton4: UIButton = {
        let button = UIButton()
        button.setTitle("재테크", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.cornerRadius = 36
        button.titleLabel?.font = Fonts.SH01Bold.font
        return button
    }()
    
    var selfDevelopmentButton5: UIButton = {
        let button = UIButton()
        button.setTitle("외국어", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.cornerRadius = 36
        button.titleLabel?.font = Fonts.SH01Bold.font
        return button
    }()
    
    var selfDevelopmentButton6: UIButton = {
        let button = UIButton()
        button.setTitle("기타", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        button.titleLabel?.font = Fonts.SH01Bold.font
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.cornerRadius = 36
        button.titleLabel?.font = Fonts.SH01Bold.font
        return button
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
        addSubViews([progressBar, selfDevelopmentButton1, selfDevelopmentButton2, selfDevelopmentButton3, selfDevelopmentButton4, selfDevelopmentButton5, selfDevelopmentButton6, selfDevelopmentSubLabel, selfDevelopmentMainLabel, nextButton])
        
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
        selfDevelopmentButton1.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(28)
            make.top.equalTo(selfDevelopmentSubLabel.snp.bottom).offset(60)
            make.width.equalTo(72)
            make.height.equalTo(72)
        }
        selfDevelopmentButton2.snp.makeConstraints{ make in
            make.leading.equalTo(selfDevelopmentButton1.snp.trailing).offset(56)
            make.top.equalTo(selfDevelopmentSubLabel.snp.bottom).offset(60)
            make.width.equalTo(72)
            make.height.equalTo(72)
        }
        selfDevelopmentButton3.snp.makeConstraints{ make in
            make.leading.equalTo(selfDevelopmentButton2.snp.trailing).offset(56)
            make.top.equalTo(selfDevelopmentSubLabel.snp.bottom).offset(60)
            make.width.equalTo(72)
            make.height.equalTo(72)
        }
        selfDevelopmentButton4.snp.makeConstraints{ make in
            make.top.equalTo(selfDevelopmentButton1.snp.bottom).offset(60)
            make.leading.equalTo(selfDevelopmentButton1)
            make.width.equalTo(72)
            make.height.equalTo(72)
        }
        selfDevelopmentButton5.snp.makeConstraints{ make in
            make.top.equalTo(selfDevelopmentButton1.snp.bottom).offset(60)
            make.leading.equalTo(selfDevelopmentButton4.snp.trailing).offset(56)
            make.width.equalTo(72)
            make.height.equalTo(72)
            
        }
        selfDevelopmentButton6.snp.makeConstraints{ make in
            make.top.equalTo(selfDevelopmentButton1.snp.bottom).offset(60)
            make.leading.equalTo(selfDevelopmentButton5.snp.trailing).offset(56)
            make.width.equalTo(72)
            make.height.equalTo(72)
        }
        nextButton.snp.makeConstraints{ make in
            make.width.equalTo(375)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
        }
        
    }
}
