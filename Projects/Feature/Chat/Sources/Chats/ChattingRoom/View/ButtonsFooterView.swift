//
//  ButtonsFooterView.swift
//  FeatureChat
//
//  Created by 강민성 on 12/13/23.
//

import UIKit
import Shared

public class ButtonsFooterView: UIView {
    
    var leaveButton: UIButton = {
        var button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconOut24.image, for: .normal)
        return button
    }()
    
    var reportButton: UIButton = {
        var button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconReport24.image, for: .normal)
        return button
    }()
    
    var alarmButton: UIButton = {
        var button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.bellOff.image, for: .normal)
        return button
    }()
    
    private var separatorLine: UIView = {
        var view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.gr50.color
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubViews([leaveButton, reportButton, alarmButton, separatorLine])
        
        separatorLine.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        leaveButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.size.equalTo(24)
        }
        
        alarmButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.size.equalTo(24)
        }
        
        reportButton.snp.makeConstraints { make in
            make.trailing.equalTo(alarmButton.snp.leading).offset(-24)
            make.centerY.equalToSuperview()
            make.size.equalTo(24)
        }
    }
    
}
