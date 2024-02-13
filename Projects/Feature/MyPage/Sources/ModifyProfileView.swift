//
//  ModifyProfileView.swift
//  FeatureMyPageInterface
//
//  Created by coco on 2023/12/22.
//

import UIKit
import Shared

class ModifyProfileView: UIView {
    let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    let contentView = UIView()
    let containerView = UIView()
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.userProfile.image
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    let photoImageView: UIView = {
        let view = UIView()
        let image = UIImageView(image: SharedDSKitAsset.Icons.iconCamera16.image)
        view.addSubview(image)
        view.layer.cornerRadius = 16
        view.backgroundColor = SharedDSKitAsset.Colors.bgLightGray.color
        image.snp.makeConstraints {
            $0.width.height.equalTo(16)
            $0.centerX.centerY.equalToSuperview()
        }
        return view
    }()
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    let usernameView = ModifyProfileTextField()
    let emailView = ModifyProfileTextField()
    let positionView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 12
        view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        return view
    }()
    var positionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "직무"
        label.alpha = 0.5
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.gr80.color
        return label
    }()
    var positionLabel: UILabel = {
        let label = UILabel()
        label.text = "기획·전략·경영"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    let titleLabel: UILabel = {
        var label = UILabel()
        label.text = "관심사"
        label.font = Fonts.SH03Bold.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    let firstSubTitleLabel: UILabel = {
        var label = UILabel()
        label.text = "자기계발"
        label.font = Fonts.SH01.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    let secondSubTitleLabel: UILabel = {
        var label = UILabel()
        label.text = "취미"
        label.font = Fonts.SH01.font
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
    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("저장", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.white.color, for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
        button.layer.cornerRadius = 16
        return button
    }()
    let selfDevelopTagView = TagView()
    let hobbyTagView = TagView()
    let developTag = ["사이드 프로젝트", "이직준비", "자격증 · 스터디", "제태크", "어학", "기타"]
    let hobbyTag = ["운동 · 스포츠", "여행/드라이브", "사교 · 동네친구", "핫플투어", "음악 · 악기", "문화 · 예술", "댄스 · 무용", "공에", "독서 · 인문학", "외국어 · 언어", "사진 · 영상", "그 외"]
    
    override init(frame: CGRect) {
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
        usernameView.titleLabel.text = "닉네임"
        usernameView.textField.text = "청계산 다람쥐"
        emailView.titleLabel.text = "생년월일"
        emailView.textField.text = "1991/02/19"
        developTag.forEach { selfDevelopTagView.addTag(tag: $0) }
        hobbyTag.forEach { hobbyTagView.addTag(tag: $0) }
    }
    
    func addSubviews() {
        addSubview(contentScrollView)
        contentScrollView.addSubview(contentView)
        
        [containerView, verticalStackView, titleLabel, firstSubTitleLabel, selfDevelopTagView, secondSubTitleLabel, hobbyTagView, saveButton].forEach {
            contentView.addSubview($0)
        }
        
        [mainImageView, photoImageView].forEach {
            containerView.addSubview($0)
        }
        
        [usernameView, emailView, positionView].forEach {
            verticalStackView.addArrangedSubview($0)
        }
        
        [positionTitleLabel, positionLabel].forEach {
            positionView.addSubview($0)
        }
    }
    
    func setupConstraints() {
        contentScrollView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.leading.trailing.bottom.equalTo(contentScrollView.contentLayoutGuide)
            $0.top.equalTo(contentScrollView.contentLayoutGuide)
            $0.width.equalTo(contentScrollView.frameLayoutGuide)
        }
        
        containerView.snp.makeConstraints {
            $0.width.height.equalTo(96)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(16)
        }
        
        mainImageView.snp.makeConstraints {
            $0.width.height.equalToSuperview()
        }
        
        photoImageView.snp.makeConstraints {
            $0.width.height.equalTo(32)
            $0.trailing.bottom.equalToSuperview()
        }
        
        verticalStackView.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
        }

        positionView.snp.makeConstraints {
            $0.height.equalTo(56)
        }

        positionTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        positionLabel.snp.makeConstraints {
            $0.top.equalTo(positionTitleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(8)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(verticalStackView.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        firstSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        selfDevelopTagView.snp.makeConstraints {
            $0.top.equalTo(firstSubTitleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(88)
        }

        secondSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(selfDevelopTagView.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        hobbyTagView.snp.makeConstraints {
            $0.top.equalTo(secondSubTitleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(232)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(hobbyTagView.snp.bottom).offset(56)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().offset(23)
            $0.height.equalTo(52)
        }
    }
}

// TODO: 만들어진 컴포넌트 가져온 내용이라 머지후 삭제필요
class TagView: UIView {
    /// 태그 버튼을 저장할 배열
    private var tagButtons = [UIButton]()
    /// 버튼 간 가로 간격
    private let horizontalSpacing: CGFloat = 8
    /// 버튼 간 세로 간격
    private let verticalSpacing: CGFloat = 8
    /// 버튼의 높이
    private let tagHeight: CGFloat = 40

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    /// 버튼이 클릭됐을 때 호출되는 메서드
    @objc private func buttonClicked(sender: UIButton) {
        print(#function)
    }

    /// 태그를 추가하는 메서드
    func addTag(tag: String) {
        let tagButton = UIButton()
        tagButton.setTitle(tag, for: .normal)
        tagButton.backgroundColor = SharedDSKitAsset.Colors.bgWhite.color
        tagButton.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        tagButton.layer.borderWidth = 1
        tagButton.layer.cornerRadius = 20

        let attribute = NSAttributedString(string: tag, attributes: [
            .font: Fonts.SH01.font,
            .foregroundColor: SharedDSKitAsset.Colors.gr100.color
        ])

        tagButton.setAttributedTitle(attribute, for: .normal)
        tagButton.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)

        self.addSubview(tagButton)
        tagButtons.append(tagButton)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        var xOffset: CGFloat = horizontalSpacing
        var yOffset: CGFloat = verticalSpacing
        let maxWidth = self.frame.width

        tagButtons.forEach { button in
            /// 20은 내부 여백
            let buttonSize = button.intrinsicContentSize.width + 32
            button.titleEdgeInsets = .init(top: 10, left: 16, bottom: 10, right: 16)

            /// 현재 줄에 버튼이 맞지 않으면 다음 줄로 이동
            if xOffset + buttonSize + horizontalSpacing > maxWidth {
                xOffset = horizontalSpacing
                yOffset += tagHeight + verticalSpacing
            }

            /// 버튼의 프레임 설정
            button.frame = CGRect(x: xOffset, y: yOffset, width: buttonSize, height: tagHeight)

            /// 다음 버튼의 x 오프셋 업데이트
            xOffset += buttonSize + horizontalSpacing
        }
    }
}
