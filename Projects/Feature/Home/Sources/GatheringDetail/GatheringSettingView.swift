//
//  GatheringSettingView.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2024/01/28.
//

import UIKit
import Shared

class GatheringSettingView: UIView {
    var dateTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "모임 개설일자"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()
    var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2023.05.04"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.textDisabled.color
        return label
    }()
    var modifyButton: UIButton = {
        let button = UIButton()
        button.setTitle("모임 상세 정보 수정하기", for: .normal)
        button.setImage(SharedDSKitAsset.Icons.iconArrowRight16.image, for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text01.color, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.contentHorizontalAlignment = .left
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 170, bottom: 0, right: 0)
        return button
    }()
    var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("모임 삭제하기", for: .normal)
        button.setImage(SharedDSKitAsset.Icons.iconArrowRight16.image, for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text01.color, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.contentHorizontalAlignment = .left
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 234, bottom: 0, right: 0)
        return button
    }()
    var waitingLabel: UILabel = {
        let label = UILabel()
        label.text = "승인 대기자"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()
    // 데이터가 없으므로 임의로 대기자 뷰 생성
    var waitingListView1: UIView = {
        let view = UIView()
        return view
    }()
    // 데이터가 없으므로 임의로 대기자 뷰 생성
    var waitingListView2: UIView = {
        let view = UIView()
        return view
    }()
    // 임의의 대기자 이미지 뷰
    var waitingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.waiting.image
        return imageView
    }()
    // 임의의 대기자 이미지 뷰
    var waitingImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.waiting2.image
        return imageView
    }()
    // 임의의 대기자 닉네임
    var waitingNickName: UILabel = {
        let label = UILabel()
        label.text = "청계산 다람쥐"
        label.font = Fonts.SH01.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()
    // 임의의 대기자 닉네임
    var waitingNickName2: UILabel = {
        let label = UILabel()
        label.text = "Hardmedia"
        label.font = Fonts.SH01.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()
    var agreeButton: UIButton = {
        let button = UIButton()
        button.setTitle("승인", for: .normal)
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitleColor(SharedDSKitAsset.Colors.text01.color, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        return button
    }()
    var disagreeButton: UIButton = {
        let button = UIButton()
        button.setTitle("거부", for: .normal)
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitleColor(SharedDSKitAsset.Colors.text01.color, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        return button
    }()
    var agreeButton2: UIButton = {
        let button = UIButton()
        button.setTitle("승인", for: .normal)
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitleColor(SharedDSKitAsset.Colors.text01.color, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        return button
    }()
    var disagreeButton2: UIButton = {
        let button = UIButton()
        button.setTitle("거부", for: .normal)
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitleColor(SharedDSKitAsset.Colors.text01.color, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        return button
    }()
    var reportButton: UIButton = {
        let button = UIButton()
        button.setTitle("모임 신고하기", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text01.color, for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        addSubViews([dateLabel, dateTitleLabel, modifyButton, deleteButton, waitingLabel, waitingListView1, waitingListView2, reportButton])
        waitingListView1.addSubViews([waitingImageView, waitingNickName, agreeButton, disagreeButton])
        waitingListView2.addSubViews([waitingImageView2, waitingNickName2, agreeButton2, disagreeButton2])
        
        dateTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(132)
            make.leading.equalToSuperview().offset(20)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(dateTitleLabel.snp.top)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        modifyButton.snp.makeConstraints { make in
            make.top.equalTo(dateTitleLabel.snp.bottom).offset(16)
            make.width.equalTo(335)
            make.height.equalTo(56)
            make.leading.equalToSuperview().offset(20)
        }
        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(modifyButton.snp.bottom)
            make.width.equalTo(335)
            make.height.equalTo(56)
            make.leading.equalToSuperview().offset(20)
        }
        waitingLabel.snp.makeConstraints { make in
            make.top.equalTo(deleteButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(20)
        }
        waitingListView1.snp.makeConstraints { make in
            make.top.equalTo(waitingLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(335)
            make.height.equalTo(40)
        }
        waitingListView2.snp.makeConstraints { make in
            make.top.equalTo(waitingListView1.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(335)
            make.height.equalTo(40)
        }
        waitingImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        waitingImageView2.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        waitingNickName.snp.makeConstraints { make in
            make.top.equalTo(waitingImageView.snp.top)
            make.leading.equalTo(waitingImageView.snp.trailing).offset(8)
        }
        waitingNickName2.snp.makeConstraints { make in
            make.top.equalTo(waitingImageView2.snp.top)
            make.leading.equalTo(waitingImageView2.snp.trailing).offset(8)
        }
        agreeButton.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.height.equalTo(32)
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(215)
        }
        disagreeButton.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.height.equalTo(32)
            make.top.equalToSuperview()
            make.leading.equalTo(agreeButton.snp.trailing).offset(8)
        }
        agreeButton2.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.height.equalTo(32)
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(215)
        }
        disagreeButton2.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.height.equalTo(32)
            make.top.equalToSuperview()
            make.leading.equalTo(agreeButton2.snp.trailing).offset(8)
        }
        reportButton.snp.makeConstraints { make in
            make.top.equalTo(waitingImageView2.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(335)
            make.height.equalTo(56)
        }
    }
}
