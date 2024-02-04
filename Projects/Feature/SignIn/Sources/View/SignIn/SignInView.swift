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
    
    var firstLabel: UILabel = {
       var label = UILabel()
        label.text = "퇴근 후에 사부작"
        label.font = Fonts.SH03.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        label.textAlignment = .center
        return label
    }()
    
    var secondLabel: UILabel = {
       var label = UILabel()
        label.text = "SABUZAC"
        label.font = Fonts.H07.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        label.textAlignment = .center
        return label
    }()
    
    var thirdLabel: UILabel = {
        var label = UILabel()
        label.text = "가치있는 정보가 모이는 사부작에서\n당신의 직장인 커뮤니티를 시작해보세요"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    var signInWithKakaoButton: UIButton = {
       var button = UIButton()
        button.backgroundColor = UIColor(red: 0.992, green: 0.898, blue: 0, alpha: 1)
        button.layer.cornerRadius = 16
        
        button.setTitle("카카오톡으로 계속하기", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        
        button.setImage(SharedDSKitAsset.Icons.kakao.image, for: .normal)
        
        button.titleEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 24)
        button.imageEdgeInsets = .init(top: 0, left: -24, bottom: 0, right: 120)
        return button
    }()
    
    let signInWithAppleButton = ASAuthorizationAppleIDButton(type: .signIn, style: .whiteOutline)
    
    let continueWithEmailButton: UIButton = {
        let button = UIButton()
        button.setTitle("이메일로 계속하기", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.setUnderline()
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
        addSubViews([firstLabel, secondLabel, thirdLabel, signInWithKakaoButton, signInWithAppleButton, continueWithEmailButton, signInWithEmailView])
        
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
        
        signInWithKakaoButton.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(52)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.top.equalTo(thirdLabel.snp.bottom).offset(232)
        }
        
        signInWithAppleButton.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(52)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.top.equalTo(signInWithKakaoButton.snp.bottom).offset(16)
        }
        
        continueWithEmailButton.snp.makeConstraints { make in
            make.width.equalTo(115)
            make.height.equalTo(24)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(signInWithAppleButton.snp.bottom).offset(24)
        }
        
        signInWithEmailView.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(24)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(continueWithEmailButton.snp.bottom).offset(32)
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
