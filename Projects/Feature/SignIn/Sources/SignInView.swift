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
        label.text = "퇴근하고 뭐하지?"
        label.font = Fonts.Body03.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        label.textAlignment = .center
        return label
    }()
    
    var secondLabel: UILabel = {
       var label = UILabel()
        label.text = "직장인 갓생"
        label.font = Fonts.H06.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        label.textAlignment = .center
        return label
    }()
    
    var thirdLabel: UILabel = {
        var label = UILabel()
        label.text = "가치있는 정보가 모이는 직갓생에서\n당신의 직장인 커뮤니티를 시작해보세요"
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
    
    var continueWithEmailButton: UIButton = {
        var button = UIButton()
        button.setTitle("이메일로 계속하기", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
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
        addSubViews([firstLabel, secondLabel, thirdLabel, signInWithKakaoButton, signInWithAppleButton, continueWithEmailButton])
        
        firstLabel.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(136)
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
            make.top.equalTo(thirdLabel.snp.bottom).offset(80)
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
