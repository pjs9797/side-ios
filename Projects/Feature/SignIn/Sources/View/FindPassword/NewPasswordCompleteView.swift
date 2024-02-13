//
//  NewPasswordCompleteVIew.swift
//  FeatureSignIn
//
//  Created by 강민성 on 2/9/24.
//

import UIKit
import Shared

import SnapKit

class NewPasswordCompleteView: UIView {

    let okImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = SharedDSKitAsset.Icons.changeComplete.image
        
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "비밀번호 변경이 완료되었습니다."
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text02.color
        
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("로그인 하러가기", for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews([okImageView, label, button])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
