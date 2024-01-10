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

    var musicButton: UIButton = {
        let button = UIButton()
        return button
    }()

    var musicLabel: UILabel = {
        let label = UILabel()
        label.text = "음악 · 악기"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()

    var musicImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconMusic.image
        imageView.layer.cornerRadius = 36
        return imageView
    }()

    var cultureButton: UIButton = {
        let button = UIButton()
        return button
    }()

    var cultureLabel: UILabel = {
        let label = UILabel()
        label.text = "문화 · 예술"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()

    var cultureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconArt.image
        imageView.layer.cornerRadius = 36
        return imageView
    }()

    var sportsButton: UIButton = {
        let button = UIButton()
        return button
    }()

    var sportsLabel: UILabel = {
        let label = UILabel()
        label.text = "운동 · 스포츠"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()

    var sportsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconSports.image
        imageView.layer.cornerRadius = 36
        return imageView
    }()

    var driveButton: UIButton = {
        let button = UIButton()
        return button
    }()

    var driveLabel: UILabel = {
        let label = UILabel()
        label.text = "여행 · 드라이브"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()

    var driveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconDrive.image
        imageView.layer.cornerRadius = 36
        return imageView
    }()

    var craftsButton: UIButton = {
        let button = UIButton()
        return button
    }()

    var craftsLabel: UILabel = {
        let label = UILabel()
        label.text = "공예"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()

    var craftsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconCrafts.image
        imageView.layer.cornerRadius = 36
        return imageView
    }()

    var danceButton: UIButton = {
        let button = UIButton()
        return button
    }()

    var danceLabel: UILabel = {
        let label = UILabel()
        label.text = "댄스 · 무용"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()

    var danceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconDance.image
        imageView.layer.cornerRadius = 36
        return imageView
    }()

    var friendsButton: UIButton = {
        let button = UIButton()
        return button
    }()

    var friendsLabel: UILabel = {
        let label = UILabel()
        label.text = "사교 · 동네친구"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()

    var friendsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconFriends.image
        imageView.layer.cornerRadius = 36
        return imageView
    }()

    var hotPlaceButton: UIButton = {
        let button = UIButton()
        return button
    }()

    var hotPlaceLabel: UILabel = {
        let label = UILabel()
        label.text = "핫플투어"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()

    var hotPlaceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconHotplace.image
        imageView.layer.cornerRadius = 36
        return imageView
    }()

    var bookButton: UIButton = {
        let button = UIButton()
        return button
    }()

    var bookLabel: UILabel = {
        let label = UILabel()
        label.text = "독서 · 인문학"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()

    var bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconBook.image
        imageView.layer.cornerRadius = 36
        return imageView
    }()

    var languageButton: UIButton = {
        let button = UIButton()
        return button
    }()

    var languageLabel: UILabel = {
        let label = UILabel()
        label.text = "외국어 · 언어"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()

    var languageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconLanguage.image
        imageView.layer.cornerRadius = 36
        return imageView
    }()

    var photoButton: UIButton = {
        let button = UIButton()
        return button
    }()

    var photoLabel: UILabel = {
        let label = UILabel()
        label.text = "사진 · 영상"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()

    var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconPhoto.image
        imageView.layer.cornerRadius = 36
        return imageView
    }()

    var etcButton: UIButton = {
        let button = UIButton()
        return button
    }()

    var etcLabel: UILabel = {
        let label = UILabel()
        label.text = "그 외"
        label.font = Fonts.SH01Bold.font
        label.textColor = SharedDSKitAsset.Colors.text01.color
        return label
    }()

    var etcImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconEtc.image
        imageView.layer.cornerRadius = 36
        return imageView
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
        addSubViews([progressBar, musicButton, cultureButton, sportsButton, driveButton, craftsButton, danceButton, friendsButton, hotPlaceButton, bookButton, languageButton, photoButton, etcButton,hobbySubLabel, hobbyMainLabel, nextButton])
        musicButton.addSubViews([musicLabel, musicImageView])
        cultureButton.addSubViews([cultureLabel, cultureImageView])
        sportsButton.addSubViews([sportsLabel, sportsImageView])
        driveButton.addSubViews([driveLabel, driveImageView])
        craftsButton.addSubViews([craftsLabel, craftsImageView])
        danceButton.addSubViews([danceLabel, danceImageView])
        friendsButton.addSubViews([friendsLabel, friendsImageView])
        hotPlaceButton.addSubViews([hotPlaceLabel, hotPlaceImageView])
        bookButton.addSubViews([bookLabel, bookImageView])
        languageButton.addSubViews([languageLabel, languageImageView])
        photoButton.addSubViews([photoLabel, photoImageView])
        etcButton.addSubViews([etcLabel, etcImageView])

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
        musicButton.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(28)
            make.top.equalTo(hobbySubLabel.snp.bottom).offset(32)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        musicLabel.snp.makeConstraints { make in
            make.bottom.equalTo(musicButton.snp.bottom).offset(-4)
            make.centerX.equalToSuperview()
        }
        musicImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalToSuperview()
        }
        cultureButton.snp.makeConstraints{ make in
            make.leading.equalTo(musicButton.snp.trailing).offset(20)
            make.top.equalTo(hobbySubLabel.snp.bottom).offset(32)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        cultureLabel.snp.makeConstraints { make in
            make.bottom.equalTo(cultureButton.snp.bottom).offset(-4)
            make.centerX.equalToSuperview()
        }
        cultureImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalToSuperview()
        }
        sportsButton.snp.makeConstraints{ make in
            make.leading.equalTo(cultureButton.snp.trailing).offset(20)
            make.top.equalTo(hobbySubLabel.snp.bottom).offset(32)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        sportsLabel.snp.makeConstraints { make in
            make.bottom.equalTo(sportsButton.snp.bottom).offset(-4)
            make.centerX.equalToSuperview()
        }
        sportsImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalToSuperview()
        }
        driveButton.snp.makeConstraints{ make in
            make.top.equalTo(musicButton.snp.bottom).offset(32)
            make.leading.equalTo(musicButton)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        driveLabel.snp.makeConstraints { make in
            make.bottom.equalTo(driveButton.snp.bottom).offset(-4)
            make.centerX.equalToSuperview()
        }
        driveImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalToSuperview()
        }
        craftsButton.snp.makeConstraints{ make in
            make.top.equalTo(musicButton.snp.bottom).offset(32)
            make.leading.equalTo(driveButton.snp.trailing).offset(20)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        craftsLabel.snp.makeConstraints { make in
            make.bottom.equalTo(craftsButton.snp.bottom).offset(-4)
            make.centerX.equalToSuperview()
        }
        craftsImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalToSuperview()
        }
        danceButton.snp.makeConstraints{ make in
            make.top.equalTo(musicButton.snp.bottom).offset(32)
            make.leading.equalTo(craftsButton.snp.trailing).offset(20)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        danceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(danceButton.snp.bottom).offset(-4)
            make.centerX.equalToSuperview()
        }
        danceImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalToSuperview()
        }
        friendsButton.snp.makeConstraints{ make in
            make.top.equalTo(driveButton.snp.bottom).offset(32)
            make.leading.equalTo(musicButton)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        friendsLabel.snp.makeConstraints { make in
            make.bottom.equalTo(friendsButton.snp.bottom).offset(-4)
            make.centerX.equalToSuperview()
        }
        friendsImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalToSuperview()
        }
        hotPlaceButton.snp.makeConstraints{ make in
            make.top.equalTo(driveButton.snp.bottom).offset(32)
            make.leading.equalTo(friendsButton.snp.trailing).offset(20)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        hotPlaceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(hotPlaceButton.snp.bottom).offset(-4)
            make.centerX.equalToSuperview()
        }
        hotPlaceImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalToSuperview()
        }
        bookButton.snp.makeConstraints { make in
            make.top.equalTo(driveButton.snp.bottom).offset(32)
            make.leading.equalTo(hotPlaceButton.snp.trailing).offset(20)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        bookLabel.snp.makeConstraints { make in
            make.bottom.equalTo(bookButton.snp.bottom).offset(-4)
            make.centerX.equalToSuperview()
        }
        bookImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalToSuperview()
        }
        languageButton.snp.makeConstraints { make in
            make.top.equalTo(friendsButton.snp.bottom).offset(32)
            make.leading.equalTo(musicButton)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        languageLabel.snp.makeConstraints { make in
            make.bottom.equalTo(languageButton.snp.bottom).offset(-4)
            make.centerX.equalToSuperview()
        }
        languageImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalToSuperview()
        }
        photoButton.snp.makeConstraints { make in
            make.top.equalTo(friendsButton.snp.bottom).offset(32)
            make.leading.equalTo(languageButton.snp.trailing).offset(20)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        photoLabel.snp.makeConstraints { make in
            make.bottom.equalTo(photoButton.snp.bottom).offset(-4)
            make.centerX.equalToSuperview()
        }
        photoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalToSuperview()
        }
        etcButton.snp.makeConstraints { make in
            make.top.equalTo(friendsButton.snp.bottom).offset(32)
            make.leading.equalTo(photoButton.snp.trailing).offset(20)
            make.width.equalTo(98.33)
            make.height.equalTo(100)
        }
        etcLabel.snp.makeConstraints { make in
            make.bottom.equalTo(etcButton.snp.bottom).offset(-4)
            make.centerX.equalToSuperview()
        }
        etcImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalToSuperview()
        }
        nextButton.snp.makeConstraints{ make in
            make.width.equalTo(375)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
        }

    }
}
