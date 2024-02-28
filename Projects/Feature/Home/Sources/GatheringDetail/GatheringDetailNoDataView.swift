//
//  GatheringDetailNoDataView.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/26.
//

import UIKit
import Shared

class GatheringDetailNoDataView: UIView {
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
    
    var stickyInfoButton: UIButton = {
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
    
    var stickyScheduleButton: UIButton = {
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
    
    var stickyMemberButton: UIButton = {
        let button = UIButton()
        button.setTitle("멤버(24)", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        return button
    }()
    
    var buttonView: UIView = {
        let view = UIView()
        return view
    }()
    
    var buttonView2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.isHidden = true
        return view
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
    
    var scheduleViewTitle: UILabel = {
        let label = UILabel()
        label.text = "일정"
        label.textColor = SharedDSKitAsset.Colors.text01.color
        label.font = Fonts.SH03Bold.font
        return label
    }()
    
    var scheduleViewText: UILabel = {
        let label = UILabel()
        label.text = "아직 일정이 없습니다"
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
    
    var memberViewText: UILabel = {
        let label = UILabel()
        label.text = "멤버가 되어보세요!"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text02.color
        return label
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
        addSubViews([heartButton, joinButton])
        addSubViews([scrollView])
        addSubViews([buttonView2])
        
        scrollView.addSubViews([gatheringDetailCategoryLabel, gatheringDetailTitle, gatheringDetailMainView, infoView, scheduleView, memberView, buttonView])
        buttonView.addSubViews([infoButton, scheduleButton, memberButton])
        buttonView2.addSubViews([stickyInfoButton, stickyScheduleButton, stickyMemberButton])
        infoView.addSubViews([infoViewTitle, infoViewContents])
        scheduleView.addSubViews([scheduleViewTitle, scheduleViewText])
        memberView.addSubViews([memberViewTitle, memberViewText])
        
        buttonView.snp.makeConstraints { make in
            make.top.equalTo(gatheringDetailMainView.snp.bottom).offset(8)
            make.width.equalToSuperview()
            make.height.equalTo(48)
        }
        
        buttonView2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(116)
            make.left.right.equalToSuperview()
            make.height.equalTo(48)
        }
        
        heartButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(52)
            make.height.equalTo(52)
        }
        
        joinButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.leading.equalTo(heartButton.snp.trailing).offset(8)
            make.width.equalTo(275)
            make.height.equalTo(52)
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
        
        infoButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(131)
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
    
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(116)
            make.bottom.equalToSuperview().offset(-90)
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
            make.height.equalTo(113)
            make.centerX.equalToSuperview()
        }
        
        memberView.snp.makeConstraints { make in
            make.top.equalTo(scheduleView.snp.bottom).offset(40)
            make.width.equalTo(335)
            make.height.equalTo(670)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
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
        
        memberViewText.snp.makeConstraints { make in
            make.top.equalTo(memberViewTitle.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
        infoViewContents.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(infoViewTitle.snp.bottom).offset(16)
        }

        scheduleViewText.snp.makeConstraints { make in
            make.top.equalTo(scheduleViewTitle.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
    }
}

extension GatheringDetailNoDataView: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let shouldShowSticky = scrollView.contentOffset.y >= buttonView.frame.minY
        buttonView2.isHidden = !shouldShowSticky
        buttonView.isHidden = shouldShowSticky
    }
}
