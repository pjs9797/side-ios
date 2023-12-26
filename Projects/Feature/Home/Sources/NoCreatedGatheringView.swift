//
//  NoCreatedGathering.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/11.
//

import UIKit
import Shared

class NoCreatedGatheringView: UIView {
    let studyButton: UIButton = {
        let button = UIButton()
        button.setTitle("스터디/자격증", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        return button
    }()
    let sideProjectButton: UIButton = {
        let button = UIButton()
        button.setTitle("사이드프로젝트", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        return button
    }()
    let changeJobButton: UIButton = {
        let button = UIButton()
        button.setTitle("이직준비", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        return button
    }()
    let languageButton: UIButton = {
        let button = UIButton()
        button.setTitle("어학", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        return button
    }()
    let investmentButton: UIButton = {
        let button = UIButton()
        button.setTitle("재테크", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        return button
    }()
    let etcButton: UIButton = {
        let button = UIButton()
        button.setTitle("기타", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        return button
    }()
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: .zero, height: 50)
        return scrollView
    }()
    
    let noGatheringView: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        return view
    }()
    let whiteCircleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 40
        view.backgroundColor = .white
        return view
    }()
    let noGatherLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 개설된 모임이 없어요. 직접 모임을 개설해보세요!"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text02.color
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented.")
    }
    
    private func render() {
        self.backgroundColor = .white
        addSubViews([scrollView, noGatheringView])
        scrollView.addSubViews([studyButton, sideProjectButton, changeJobButton, languageButton, investmentButton, etcButton])
        noGatheringView.addSubViews([whiteCircleView,noGatherLabel])
        
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        studyButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview()
            make.width.equalTo(121)
            make.height.equalTo(48)
        }
        
        sideProjectButton.snp.makeConstraints { make in
            make.leading.equalTo(studyButton.snp.trailing)
            make.top.equalToSuperview()
            make.width.equalTo(133)
            make.height.equalTo(48)
        }
        
        changeJobButton.snp.makeConstraints { make in
            make.leading.equalTo(sideProjectButton.snp.trailing)
            make.top.equalToSuperview()
            make.width.equalTo(92)
            make.height.equalTo(48)
        }
        
        languageButton.snp.makeConstraints { make in
            make.leading.equalTo(changeJobButton.snp.trailing)
            make.top.equalToSuperview()
            make.width.equalTo(92)
            make.height.equalTo(48)
        }
        
        investmentButton.snp.makeConstraints { make in
            make.leading.equalTo(languageButton.snp.trailing)
            make.top.equalToSuperview()
            make.width.equalTo(92)
            make.height.equalTo(48)
        }
        
        etcButton.snp.makeConstraints { make in
            make.leading.equalTo(investmentButton.snp.trailing)
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(92)
            make.height.equalTo(48)
        }
        
        noGatheringView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.bottom)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().offset(-90)
        }
        
        whiteCircleView.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(210.5)
        }
        noGatherLabel.snp.makeConstraints { make in
            make.top.equalTo(whiteCircleView.snp.bottom).offset(20)
            make.width.equalTo(180)
            make.height.equalTo(48)
            make.centerX.equalToSuperview()
        }
    }
}
