//
//  GatheringDetailView.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/25.
//

import UIKit
import Shared

class GatheringDetailView: UIView {
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    var gatheringDetailCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "문화·예술"
        label.textColor = SharedDSKitAsset.Colors.text03.color
        label.font = Fonts.Body02.font
        return label
    }()
    
    var gatheringDetailTitle: UILabel = {
        let label = UILabel()
        label.text = "취미 뮤지컬 배우모임"
        label.textColor = .black
        label.font = Fonts.H03.font
        return label
    }()
    
    var gatheringDetailMainViewTag: UIButton = {
        let button = UIButton()
        button.setTitle("지속", for: .normal)
        return button
    }()
    
    var gatheringDetailMainView: UIImageView = {
        let view = UIImageView()
        view.image = SharedDSKitAsset.Icons.frame222.image
        return view
    }()
    
    var infoButton: UIButton = {
        let button = UIButton()
        button.setTitle("소개", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        return button
    }()
    
    var scheduleButton: UIButton = {
        let button = UIButton()
        button.setTitle("일정", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        return button
    }()
    
    var memberButton: UIButton = {
        let button = UIButton()
        button.setTitle("멤버(24)", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        return button
    }()
    
    var stickyInfoButton: UIButton = {
        let button = UIButton()
        button.setTitle("소개", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        return button
    }()
    
    var stickyScheduleButton: UIButton = {
        let button = UIButton()
        button.setTitle("일정", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        return button
    }()
    
    var stickyMemberButton: UIButton = {
        let button = UIButton()
        button.setTitle("멤버(24)", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        return button
    }()
    
    var infoView: UIView = {
        let view = UIView()
        return view
    }()
    
    var infoViewTitle: UILabel = {
        let label = UILabel()
        label.text = "소개"
        label.textColor = SharedDSKitAsset.Colors.text01.color
        label.font = Fonts.SH03Bold.font
        return label
    }()
    
    var infoViewContents: UILabel = {
        let label = UILabel()
        label.text = "노래 좋아하고 연기 좋아하면 다 들어오세요!\n초보자도 환영입니다:)\n한달에 한 번 이상은 참여해주실 분만 들어와주세용!"
        label.textColor = SharedDSKitAsset.Colors.text02.color
        label.font = Fonts.Body02.font
        label.numberOfLines = 3
        return label
    }()
    
    var scheduleView: UIView = {
        let view = UIView()
        return view
    }()
    
    var scheduleViewContentsView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        view.layer.cornerRadius = 16
        return view
    }()
   
    var scheduleViewContentsView2: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        view.layer.cornerRadius = 16
        return view
    }()
    
    var scheduleViewTitle: UILabel = {
        let label = UILabel()
        label.text = "일정"
        label.textColor = SharedDSKitAsset.Colors.text01.color
        label.font = Fonts.SH03Bold.font
        return label
    }()
    
    var scheduleViewContentsTime: UILabel = {
        let label = UILabel()
        label.text = "12.28(일) 17:00"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text02.color
        return label
    }()
    
    var scheduleViewContentsLocation: UILabel = {
        let label = UILabel()
        label.text = "스타벅스 광교점"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text02.color
        return label
    }()
    
    var scheduleViewContentsTime2: UILabel = {
        let label = UILabel()
        label.text = "12.28(일) 22:00"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text02.color
        return label
    }()
    
    var scheduleViewContentsLocation2: UILabel = {
        let label = UILabel()
        label.text = "스타벅스 강남역점"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text02.color
        return label
    }()
    
    var memberView: UIView = {
        let view = UIView()
        return view
    }()
    
    var memberViewTitle: UILabel = {
        let label = UILabel()
        label.text = "멤버"
        label.textColor = SharedDSKitAsset.Colors.text01.color
        label.font = Fonts.SH03Bold.font
        return label
    }()
    
    var memberViewContentsView: UIView = {
        let view = UIView()
        return view
    }()
    
    var memberViewContentsView2: UIView = {
        let view = UIView()
        return view
    }()
    
    var memberViewContentsName: UILabel = {
        let label = UILabel()
        label.text = "청계산 다람쥐"
        label.textColor = SharedDSKitAsset.Colors.text01.color
        label.font = Fonts.SH01.font
        return label
    }()
    
    var memberViewContentsName2: UILabel = {
        let label = UILabel()
        label.text = "구파발 파브로"
        label.textColor = SharedDSKitAsset.Colors.text01.color
        label.font = Fonts.SH01.font
        return label
    }()
    
    var memberViewContentsImage: UIImageView = {
        let view = UIImageView()
        view.image = SharedDSKitAsset.Icons.memberImg.image
        return view
    }()
    
    var memberViewContentsImage2: UIImageView = {
        let view = UIImageView()
        view.image = SharedDSKitAsset.Icons.memberImg2.image
        return view
    }()
    
    var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconHeart24.image, for: .normal)
        button.layer.borderColor = SharedDSKitAsset.Colors.gr50.color.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 16
        return button
    }()
    
    var joinButton: UIButton = {
        let button = UIButton()
        button.setTitle("참여하기", for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
        button.setTitleColor(SharedDSKitAsset.Colors.white.color, for: .normal)
        button.layer.cornerRadius = 16
        return button
    }()
    
    var buttonView: UIView = {
        let view = UIView()
        return view
    }()
    
    var buttonView2: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func render(){
        self.backgroundColor = .white
        scrollView.delegate = self
        addSubViews([scrollView])
        addSubViews([buttonView2])
        buttonView.addSubViews([infoButton, scheduleButton, memberButton])
        buttonView2.addSubViews([stickyInfoButton, stickyScheduleButton, stickyMemberButton])
        
        addSubViews([heartButton, joinButton])
        scrollView.addSubViews([gatheringDetailCategoryLabel, gatheringDetailTitle, gatheringDetailMainView, buttonView, infoView, scheduleView, memberView])
        
        infoView.addSubViews([infoViewTitle, infoViewContents])
        scheduleView.addSubViews([scheduleViewTitle, scheduleViewContentsView, scheduleViewContentsView2])
        memberView.addSubViews([memberViewTitle, memberViewContentsView, memberViewContentsView2])
        
        scheduleViewContentsView.addSubViews([scheduleViewContentsTime, scheduleViewContentsLocation])
        scheduleViewContentsView2.addSubViews([scheduleViewContentsTime2, scheduleViewContentsLocation2])
        
        memberViewContentsView.addSubViews([memberViewContentsImage, memberViewContentsName])
        memberViewContentsView2.addSubViews([memberViewContentsImage2, memberViewContentsName2])
        
        buttonView2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(116)
            make.left.right.equalToSuperview()
            make.height.equalTo(48)
        }
        
        gatheringDetailCategoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        gatheringDetailTitle.snp.makeConstraints { make in
            make.top.equalTo(gatheringDetailCategoryLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        gatheringDetailMainView.snp.makeConstraints { make in
            make.top.equalTo(gatheringDetailTitle.snp.bottom).offset(24)
            make.width.equalTo(393)
            make.height.equalTo(240)
            make.leading.equalToSuperview()
        }
        
        stickyInfoButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(131)
            make.height.equalTo(48)
        }

        stickyScheduleButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(stickyInfoButton.snp.trailing)
            make.width.equalTo(131)
            make.height.equalTo(48)
        }

        stickyMemberButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(stickyScheduleButton.snp.trailing)
            make.width.equalTo(131)
            make.height.equalTo(48)
        }
        
        infoButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(131)
            make.height.equalTo(48)
        }
        
        buttonView.snp.makeConstraints { make in
            make.top.equalTo(gatheringDetailMainView.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(48)
        }
        
        scheduleButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(infoButton.snp.trailing)
            make.width.equalTo(131)
            make.height.equalTo(48)
        }
        
        memberButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(scheduleButton.snp.trailing)
            make.width.equalTo(131)
            make.height.equalTo(48)
        }
    
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(116)
            make.bottom.equalToSuperview().offset(-95)
            make.leading.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        infoView.snp.makeConstraints { make in
            make.top.equalTo(infoButton.snp.bottom).offset(40)
            make.width.equalTo(335)
            make.height.equalTo(113)
            make.centerX.equalToSuperview()
        }
        
        scheduleView.snp.makeConstraints { make in
            make.top.equalTo(infoView.snp.bottom).offset(50)
            make.width.equalTo(335)
            make.height.equalTo(217)
            make.centerX.equalToSuperview()
        }
        
        memberView.snp.makeConstraints { make in
            make.top.equalTo(scheduleView.snp.bottom).offset(40)
            make.width.equalTo(335)
            make.height.equalTo(500)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    
        infoViewTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(4)
        }
        
        scheduleViewTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(4)
        }
        
        memberViewTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(4)
        }
        
        infoViewContents.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(infoViewTitle.snp.bottom).offset(16)
        }
        
        scheduleViewContentsView.snp.makeConstraints { make in
            make.top.equalTo(scheduleViewTitle.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(84)
        }
        
        scheduleViewContentsView2.snp.makeConstraints { make in
            make.top.equalTo(scheduleViewContentsView.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(84)
        }
        
        memberViewContentsView.snp.makeConstraints { make in
            make.top.equalTo(memberViewTitle.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(40)
        }
        
        memberViewContentsView2.snp.makeConstraints { make in
            make.top.equalTo(memberViewContentsView.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(40)
        }
        
        scheduleViewContentsTime.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        scheduleViewContentsLocation.snp.makeConstraints { make in
            make.top.equalTo(scheduleViewContentsTime.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
        }
        
        scheduleViewContentsTime2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        scheduleViewContentsLocation2.snp.makeConstraints { make in
            make.top.equalTo(scheduleViewContentsTime2.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
        }
        
        memberViewContentsImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        memberViewContentsImage2.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        memberViewContentsName.snp.makeConstraints { make in
            make.leading.equalTo(memberViewContentsImage.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
        }
        
        memberViewContentsName2.snp.makeConstraints { make in
            make.leading.equalTo(memberViewContentsImage2.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
        }
        
        heartButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-40)
            make.width.equalTo(52)
            make.height.equalTo(52)
        }
        
        joinButton.snp.makeConstraints { make in
            make.leading.equalTo(heartButton.snp.trailing).offset(8)
            make.bottom.equalToSuperview().offset(-40)
            make.width.equalTo(275)
            make.height.equalTo(52)
        }
    }
}

extension GatheringDetailView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let shouldShowSticky = scrollView.contentOffset.y >= buttonView.frame.minY
        buttonView2.isHidden = !shouldShowSticky
        buttonView.isHidden = shouldShowSticky
       
        if scrollView.contentOffset.y >= 345.0 && scrollView.contentOffset.y <= 355.0 {
            print("소개")
        }else if scrollView.contentOffset.y == 520.0 {
            print("일정")
        }else if scrollView.contentOffset.y == 720.0 {
            print("멤버")
        }
    }
}
