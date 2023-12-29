//
//  OthersConversationTableViewCell.swift
//  FeatureChat
//
//  Created by 강민성 on 12/5/23.
//

import UIKit
import Shared

public class OthersConversationTableViewCell: UITableViewCell {
    
    var messageBox: UITextView = {
        var textView = UITextView()
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.backgroundColor = SharedDSKitAsset.Colors.bgLightGray.color
        textView.textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        textView.layer.cornerRadius = 16
        textView.font = Fonts.Body02.font
        textView.textColor = SharedDSKitAsset.Colors.gr100.color
        return textView
    }()
    
    let timeLabel: UILabel = {
        var label = UILabel()
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        label.backgroundColor = .clear
        return label
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        render()
        layoutSubviews()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(
            top: 12,
            left: 0,
            bottom: 12,
            right: 0)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubViews([messageBox, timeLabel])
        
        messageBox.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(68)
            make.top.bottom.equalToSuperview()
            make.height.greaterThanOrEqualTo(48)
            make.width.lessThanOrEqualTo(251)
            make.centerY.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints { make in
            make.leading.equalTo(messageBox.snp.trailing).offset(8)
            make.bottom.equalTo(messageBox.snp.bottom)
        }
    }
    
}
