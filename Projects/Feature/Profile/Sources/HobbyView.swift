//
//  HobbyView.swift
//  FeatureProfile
//
//  Created by yoonyeosong on 2023/11/20.
//

import UIKit
import SharedDSKit

class HobbyView: UIView {
    var progressBar: UIProgressView = {
            let progressBar = UIProgressView()
            progressBar.progress = 6/6
            progressBar.tintColor = SharedDSKitAsset.Colors.gr100.color
            progressBar.trackTintColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            return progressBar
        }()

        var hobbyMainLabel: UILabel = {
            let label = UILabel()
            label.text = "퇴근 후 즐기고싶은 취미생활은 무엇인가요?"
            label.font = Fonts.H01.font
            label.textColor = SharedDSKitAsset.Colors.gr100.color
            return label
        }()

        var hobbySubLabel: UILabel = {
            let label = UILabel()
            label.text = "*중복선택 가능"
            label.font = Fonts.Body02.font
            label.textColor = SharedDSKitAsset.Colors.text03.color
            return label

        }()

        var hobbyButton1: UIButton = {
            let button = UIButton()
            button.setTitle("맛집·카페", for: .normal)
            button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
            button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            button.layer.borderWidth = 1
            button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            button.layer.cornerRadius = 36
            button.titleLabel?.font = Fonts.SH01Bold.font
            return button
        }()

        var hobbyButton2: UIButton = {
            let button = UIButton()
            button.setTitle("문화·공연", for: .normal)
            button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
            button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            button.layer.borderWidth = 1
            button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            button.layer.cornerRadius = 36
            button.titleLabel?.font = Fonts.SH01Bold.font
            return button
        }()

        var hobbyButton3: UIButton = {
            let button = UIButton()
            button.setTitle("운동·스포츠", for: .normal)
            button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
            button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            button.layer.borderWidth = 1
            button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            button.layer.cornerRadius = 36
            button.titleLabel?.font = Fonts.SH01Bold.font
            return button
        }()

        var hobbyButton4: UIButton = {
            let button = UIButton()
            button.setTitle("여행·드라이브", for: .normal)
            button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
            button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            button.layer.borderWidth = 1
            button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            button.layer.cornerRadius = 36
            button.titleLabel?.font = Fonts.SH01Bold.font
            return button
        }()

        var hobbyButton5: UIButton = {
            let button = UIButton()
            button.setTitle("댄스·무용", for: .normal)
            button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
            button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            button.layer.borderWidth = 1
            button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            button.layer.cornerRadius = 36
            button.titleLabel?.font = Fonts.SH01Bold.font
            return button
        }()

        var hobbyButton6: UIButton = {
            let button = UIButton()
            button.setTitle("공예", for: .normal)
            button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
            button.titleLabel?.font = Fonts.SH01Bold.font
            button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            button.layer.borderWidth = 1
            button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            button.layer.cornerRadius = 36
            button.titleLabel?.font = Fonts.SH01Bold.font
            return button
        }()
    var hobbyButton7: UIButton = {
        let button = UIButton()
        button.setTitle("친구 만들기", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        button.titleLabel?.font = Fonts.SH01Bold.font
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.cornerRadius = 36
        button.titleLabel?.font = Fonts.SH01Bold.font
        return button
    }()
    var hobbyButton8: UIButton = {
        let button = UIButton()
        button.setTitle("독서·인문학", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        button.titleLabel?.font = Fonts.SH01Bold.font
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.cornerRadius = 36
        button.titleLabel?.font = Fonts.SH01Bold.font
        return button
    }()
    var hobbyButton9: UIButton = {
        let button = UIButton()
        button.setTitle("기타", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
        button.titleLabel?.font = Fonts.SH01Bold.font
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.layer.cornerRadius = 36
        button.titleLabel?.font = Fonts.SH01Bold.font
        return button
    }()

        var nextButton: UIButton = {
            let button = UIButton()
            button.setTitle("다음", for: .normal)
            button.layer.cornerRadius = 16
            button.layer.borderWidth = 1
            button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            button.setTitleColor(SharedDSKitAsset.Colors.gr30
                .color, for: .normal)
            button.titleLabel?.font = Fonts.SH02Bold.font
            return button
        }()

        override init(frame: CGRect) {
            super.init(frame: frame)
            render()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func render(){
            self.backgroundColor = .white
            addSubViews([progressBar, hobbyButton1, hobbyButton2, hobbyButton3, hobbyButton4, hobbyButton5, hobbyButton6, hobbyButton7, hobbyButton8, hobbyButton9, hobbySubLabel, hobbyMainLabel, nextButton])

            progressBar.snp.makeConstraints{ make in
                make.top.equalToSuperview().offset(100)
                make.centerX.equalToSuperview()
                make.width.equalToSuperview()
            }
            hobbyMainLabel.snp.makeConstraints{ make in
                make.top.equalToSuperview().offset(160)
                make.leading.equalToSuperview().offset(20)
            }
            hobbySubLabel.snp.makeConstraints{ make in
                make.top.equalTo(hobbyMainLabel.snp.bottom).offset(8)
                make.leading.equalToSuperview().offset(30)
            }
            hobbyButton1.snp.makeConstraints{ make in
                make.leading.equalToSuperview().offset(28)
                make.top.equalTo(hobbySubLabel.snp.bottom).offset(60)
                make.width.equalTo(72)
                make.height.equalTo(72)
            }
            hobbyButton2.snp.makeConstraints{ make in
                make.leading.equalTo(hobbyButton1.snp.trailing).offset(56)
                make.top.equalTo(hobbySubLabel.snp.bottom).offset(60)
                make.width.equalTo(72)
                make.height.equalTo(72)
            }
            hobbyButton3.snp.makeConstraints{ make in
                make.leading.equalTo(hobbyButton2.snp.trailing).offset(56)
                make.top.equalTo(hobbySubLabel.snp.bottom).offset(60)
                make.width.equalTo(72)
                make.height.equalTo(72)
            }
            hobbyButton4.snp.makeConstraints{ make in
                make.top.equalTo(hobbyButton1.snp.bottom).offset(60)
                make.leading.equalTo(hobbyButton1)
                make.width.equalTo(72)
                make.height.equalTo(72)
            }
            hobbyButton5.snp.makeConstraints{ make in
                make.top.equalTo(hobbyButton1.snp.bottom).offset(60)
                make.leading.equalTo(hobbyButton4.snp.trailing).offset(56)
                make.width.equalTo(72)
                make.height.equalTo(72)

            }
            hobbyButton6.snp.makeConstraints{ make in
                make.top.equalTo(hobbyButton1.snp.bottom).offset(60)
                make.leading.equalTo(hobbyButton5.snp.trailing).offset(56)
                make.width.equalTo(72)
                make.height.equalTo(72)
            }
            hobbyButton7.snp.makeConstraints{ make in
                make.top.equalTo(hobbyButton4.snp.bottom).offset(60)
                make.leading.equalTo(hobbyButton1)
                make.width.equalTo(72)
                make.height.equalTo(72)
            }
            hobbyButton8.snp.makeConstraints{ make in
                make.top.equalTo(hobbyButton4.snp.bottom).offset(60)
                make.leading.equalTo(hobbyButton7.snp.trailing).offset(56)
                make.width.equalTo(72)
                make.height.equalTo(72)
            }
            hobbyButton9.snp.makeConstraints { make in
                make.top.equalTo(hobbyButton4.snp.bottom).offset(60)
                make.leading.equalTo(hobbyButton8.snp.trailing).offset(56)
                make.width.equalTo(72)
                make.height.equalTo(72)
            }
            nextButton.snp.makeConstraints{ make in
                make.width.equalTo(375)
                make.height.equalTo(52)
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().offset(-40)
            }

        }
}
