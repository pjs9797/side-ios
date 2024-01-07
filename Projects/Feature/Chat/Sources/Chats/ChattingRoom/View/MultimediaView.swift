//
//  MultimediaView.swift
//  FeatureChat
//
//  Created by 강민성 on 1/3/24.
//

import UIKit
import Shared

public class MultimediaView: UIView {
    
    let scheduleButtonView = MultimediaButtonView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        scheduleButtonView.button.setImage(SharedDSKitAsset.Icons.iconCalendarWhite24.image, for: .normal)
        scheduleButtonView.button.layer.backgroundColor = UIColor(red: 0.167, green: 0.664, blue: 0.821, alpha: 1).cgColor
        scheduleButtonView.label.text = "일정"
    }
    
    private func render() {
        addSubViews([scheduleButtonView])
        
        scheduleButtonView.snp.makeConstraints { make in
            make.width.equalTo(98.33)
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
    }
}
