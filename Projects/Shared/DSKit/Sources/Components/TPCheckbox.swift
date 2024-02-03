//
//  TPCheckbox.swift
//  SharedDSKit
//
//  Created by yoonyeosong on 2023/11/23.
//

import UIKit

public class TPCheckbox: UIView {
    
    public let enabledCheckboxButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconUnselected.image, for: .normal)
        button.setImage(SharedDSKitAsset.Icons.iconSelected.image, for: .selected)
        return button
    }()
    
    public let enabledCheckboxLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubViews([enabledCheckboxButton, enabledCheckboxLabel])
        
        enabledCheckboxButton.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
        }
        
        enabledCheckboxLabel.snp.makeConstraints { make in
            make.leading.equalTo(enabledCheckboxButton.snp.trailing).offset(8)
            make.top.bottom.trailing.equalToSuperview()
        }
    }
}
