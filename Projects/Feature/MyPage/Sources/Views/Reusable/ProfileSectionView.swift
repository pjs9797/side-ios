//
//  ProfileSectionView.swift
//  FeatureMyPage
//
//  Created by 강민성 on 2/13/24.
//

import UIKit
import Shared

class ProfileSectionView: UIView {

    let modifyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("프로필 수정", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.layer.borderColor = SharedDSKitAsset.Colors.text03.color.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        button.setUnderline()
        
        return button
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = SharedDSKitAsset.Icons.userProfile.image
        imageView.layer.cornerRadius = 8
        
        return imageView
    }()
    
    let profileNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "청계산 다람쥐"
        label.font = Fonts.SH03Bold.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        
        return label
    }()

    let jobCategoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "미디어 · 전시"
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "lkfjlkj789456@kakao.com"
        label.font = Fonts.Body01.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        
        return label
    }()
    
    let categoriesHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubViews([modifyButton, profileImageView, profileNameLabel, jobCategoryLabel, emailLabel, categoriesHorizontalStackView])
        
        modifyButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.size.equalTo(80)
        }
        
        profileNameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.top).offset(4)
            make.leading.equalTo(profileImageView.snp.trailing).offset(24)
        }
        
        jobCategoryLabel.snp.makeConstraints { make in
            make.top.equalTo(profileNameLabel.snp.bottom).offset(2)
            make.leading.equalTo(profileImageView.snp.trailing).offset(24)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(jobCategoryLabel.snp.bottom).offset(2)
            make.leading.equalTo(profileImageView.snp.trailing).offset(24)
        }
        
        categoriesHorizontalStackView.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(24)
            make.leading.equalTo(profileImageView.snp.trailing).offset(24)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
