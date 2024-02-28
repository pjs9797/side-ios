//
//  MyPageView.swift
//  FeatureMyPageInterface
//
//  Created by coco on 2023/12/15.
//

import UIKit
import Shared
import SnapKit

public class MyPageView: UIView {
    let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    let contentView = UIView()
    let profileView = UIView()
    let modifyButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 수정", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.layer.borderColor = SharedDSKitAsset.Colors.text03.color.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        button.setUnderline()
        return button
    }()
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.userProfile.image
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    let profileTextView = UIView()
    let profileName: UILabel = {
        var label = UILabel()
        label.text = "청계산 다람쥐"
        label.font = Fonts.SH03Bold.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    let positionLabel: UILabel = {
        var label = UILabel()
        label.text = "미디어 · 전시"
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    let emailLabel: UILabel = {
        var label = UILabel()
        label.text = "lkfjlkj789456@kakao.com"
        label.font = Fonts.Body01.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    let hobbyHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    let firstHobbyLabel = UILabel()
    let secondHobbyLabel = UILabel()
    let thirdHobbyLabel = UILabel()
    let separateView: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.bgLightGray.color
        return view
    }()
    let tableView = UIView()
    let tableHeaderLabel: UILabel = {
        var label = UILabel()
        label.text = "내 활동"
        label.font = Fonts.SH03Bold.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        label.sizeToFit()
        return label
    }()
    let firstSectionLabel = UILabel()
    let secondSectionLabel = UILabel()
    let firstRowLabel = MypageCellView(title: "내 모임")
    let secondRowLabel = MypageCellView(title: "찜한 모임")
    let thirdRowLabel = MypageCellView(title: "내 플레이스")
    let thirdSectionLabel = UILabel()
    let fourthRowLabel = MypageCellView(title: "내가 쓴 글")
    let fifthRowLabel = MypageCellView(title: "댓글 단 글")
    let sixthRowLabel = MypageCellView(title: "좋아요 한 글")
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = SharedDSKitAsset.Colors.bgWhite.color
        setupHobbyLabel(firstHobbyLabel, title: "문화·예술")
        setupHobbyLabel(secondHobbyLabel, title: "이직준비")
        setupHobbyLabel(thirdHobbyLabel, title: "이직준비")
        setupSectionTitle(firstSectionLabel, title: "모임")
        setupSectionTitle(secondSectionLabel, title: "플레이스")
        setupSectionTitle(thirdSectionLabel, title: "Q&A")
    }
    
    func addSubviews() {
        addSubview(contentScrollView)
        contentScrollView.addSubview(contentView)
        
        [profileView, separateView, tableView].forEach {
            contentView.addSubview($0)
        }
        
        [modifyButton, mainImageView, profileName, positionLabel, emailLabel, hobbyHorizontalStackView].forEach {
            profileView.addSubview($0)
        }

        [firstHobbyLabel, secondHobbyLabel, thirdHobbyLabel].forEach {
            hobbyHorizontalStackView.addArrangedSubview($0)
        }

        [tableHeaderLabel, firstSectionLabel, firstRowLabel, secondRowLabel, secondSectionLabel, thirdRowLabel, thirdSectionLabel, fourthRowLabel, fifthRowLabel, sixthRowLabel].forEach {
            tableView.addSubview($0)
        }
    }
    
    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        contentScrollView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
        
        contentView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.leading.trailing.bottom.equalTo(contentScrollView.contentLayoutGuide)
            $0.top.equalTo(contentScrollView.contentLayoutGuide)
            $0.width.equalTo(contentScrollView.frameLayoutGuide)
        }
        
        profileView.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.width.equalToSuperview()
            $0.height.equalTo(192)
        }
        
        separateView.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom)
            $0.height.equalTo(10)
            $0.width.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(separateView.snp.bottom).offset(10)
            $0.bottom.equalTo(contentView.snp.bottom)
            $0.leading.trailing.equalTo(safeArea)
        }
        
        modifyButton.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.top).offset(16)
            $0.trailing.equalTo(profileView.snp.trailing).offset(-20)
        }
        
        mainImageView.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(mainImageView.snp.width).multipliedBy(1)
            $0.top.equalTo(modifyButton.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(20)
        }
        
        profileName.snp.makeConstraints {
            $0.top.equalTo(modifyButton.snp.bottom).offset(8)
            $0.leading.equalTo(mainImageView.snp.trailing).offset(24)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        positionLabel.snp.makeConstraints {
            $0.top.equalTo(profileName.snp.bottom).offset(2)
            $0.leading.equalTo(mainImageView.snp.trailing).offset(24)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(positionLabel.snp.bottom).offset(2)
            $0.leading.equalTo(mainImageView.snp.trailing).offset(24)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        hobbyHorizontalStackView.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(16)
            $0.leading.equalTo(mainImageView.snp.trailing).offset(24)
            $0.trailing.equalToSuperview().offset(-60)
            $0.height.equalTo(30)
        }
        
        tableHeaderLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.leading.equalTo(20)
        }
        
        firstSectionLabel.snp.makeConstraints {
            $0.top.equalTo(tableHeaderLabel.snp.bottom).offset(24)
            $0.leading.equalTo(20)
        }
        
        firstRowLabel.snp.makeConstraints {
            $0.top.equalTo(firstSectionLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        secondRowLabel.snp.makeConstraints {
            $0.top.equalTo(firstRowLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        secondSectionLabel.snp.makeConstraints {
            $0.top.equalTo(secondRowLabel.snp.bottom).offset(40)
            $0.leading.equalTo(20)
        }
        
        thirdRowLabel.snp.makeConstraints {
            $0.top.equalTo(secondSectionLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        thirdSectionLabel.snp.makeConstraints {
            $0.top.equalTo(thirdRowLabel.snp.bottom).offset(40)
            $0.leading.equalTo(20)
        }
        
        fourthRowLabel.snp.makeConstraints {
            $0.top.equalTo(thirdSectionLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        fifthRowLabel.snp.makeConstraints {
            $0.top.equalTo(fourthRowLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        sixthRowLabel.snp.makeConstraints {
            $0.top.equalTo(fifthRowLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(40)
        }
    }
    
    func setupHobbyLabel(_ label: UILabel, title: String) {
        label.text = title
        label.font = Fonts.ST01.font
        label.textColor = SharedDSKitAsset.Colors.gr80.color
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 12
        label.textAlignment = .center
        label.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        label.layer.backgroundColor = SharedDSKitAsset.Colors.gr10.color.cgColor
    }
    
    func setupSectionTitle(_ label: UILabel, title: String) {
        label.text = title
        label.textColor = SharedDSKitAsset.Colors.text03.color
        label.font = Fonts.SH01.font
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
