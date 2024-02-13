//
//  SignInView.swift
//  FeatureSignIn
//
//  Created by 강민성 on 11/6/23.
//

import UIKit
import Shared
import SnapKit
import AuthenticationServices

class SignInView: UIView {
    
    let firstLabel: UILabel = {
        let label = UILabel()
        label.text = "퇴근 후에 사부작"
        label.font = Fonts.SH03.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        label.textAlignment = .center
        
        return label
    }()
    
    let secondLabel: UILabel = {
        let label = UILabel()
        label.text = "SABUZAC"
        label.font = Fonts.H07.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        label.textAlignment = .center
        
        return label
    }()
    
    let thirdLabel: UILabel = {
        let label = UILabel()
        label.text = "가치있는 정보가 모이는 사부작에서\n당신의 직장인 커뮤니티를 시작해보세요"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    let continueWithEmailButton: UIButton = {
        let button = UIButton()
        button.setTitle("이메일로 계속하기", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    let signInWithEmailView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let signInWithEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "이미 이메일 계정이 있으신가요?"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        
        return label
    }()
    
    let signInWithEmailButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
        button.setUnderline()
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        self.backgroundColor = .white
        
        signInWithEmailView.addSubViews([signInWithEmailLabel, signInWithEmailButton])
        addSubViews([firstLabel, secondLabel, thirdLabel, continueWithEmailButton, signInWithEmailView])
        
        firstLabel.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(100)
        }
        
        secondLabel.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(52)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.top.equalTo(firstLabel.snp.bottom)
            
        }
        
        thirdLabel.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(48)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.top.equalTo(secondLabel.snp.bottom).offset(16)
        }
        
        continueWithEmailButton.snp.makeConstraints { make in
            make.bottom.equalTo(signInWithEmailView.snp.top).offset(-24)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(52)
        }
        
        signInWithEmailView.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-40)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(24)
        }
        
        signInWithEmailLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(43)
        }
        
        signInWithEmailButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-43)
        }
    }
}

extension UIButton {
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
}
