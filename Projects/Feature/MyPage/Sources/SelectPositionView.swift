//
//  SelectPositionView.swift
//  FeatureMyPageInterface
//
//  Created by coco on 2023/12/25.
//

import UIKit
import Shared

// TODO: iphoneSE에 맞춰 mainContainerView사이즈 조절 필요
class SelectPositionView: UIView {
    let dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.black.color
        view.alpha = 0.5
        return view
    }()
    let mainContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.bgWhite.color
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "직무"
        label.font = Fonts.SH03Bold.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    let contentView = PositionTagView()
    let topBarView = UIView()
    let barLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 3
        return view
    }()
    let positionTag = ["기획 · 전략 · 경영", "개발", "데이터 · AI · ML", "마케팅 · 광고 · 홍보", "디자인", "미디어 · 전시 · 예술", "유통 · 물류", "금융", "재무 · 회계 · 세무", "인사 · 노무", "영업 · 고객", "의료 · 바이오 · 제약",  "연구 · RND", "엔지니어링 · 설계", "품질 · 생산", "교육", "체육 · 스포츠직", "법률 · 법무직", "공공 · 복지", "서비스직", "기타"]

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        addSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .clear
        positionTag.forEach {
            contentView.addTag(tag: $0, image: SharedDSKitAsset.Icons.iconCamera16.image)
        }
    }
    
    func addSubview() {
        [dimmedView, mainContainerView].forEach {
            self.addSubview($0)
        }
        
        [topBarView, mainLabel, contentView].forEach {
            mainContainerView.addSubview($0)
        }
        
        topBarView.addSubview(barLineView)
    }
    
    func setupConstraints() {
        dimmedView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        mainContainerView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        topBarView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(53)
        }
        
        barLineView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(8)
            $0.height.equalTo(4)
            $0.width.equalTo(56)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(topBarView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        contentView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.top.equalTo(mainLabel.snp.bottom).offset(16)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(32)
            $0.height.equalTo(480)
        }
    }
}
