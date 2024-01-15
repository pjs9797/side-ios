//
//  InquiryView.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/26.
//

import UIKit
import Shared

class InquiryView: UIView {
    var textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.tintColor = .black
        textView.font = Fonts.Body02.font
        return textView
    }()
    
    var underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        return view
    }()

    override init(frame: CGRect){
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        self.backgroundColor = .white
        
        addSubViews([textView, underlineView])
        
        textView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(116)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(240)
        }
        
        underlineView.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(8)
            make.width.equalTo(335)
            make.centerX.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
