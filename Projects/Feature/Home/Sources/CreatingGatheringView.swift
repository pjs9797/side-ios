//
//  CreatingGatheringView.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/06.
//

import UIKit
import Shared

public class CreatingGatheringView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        render()
    }
    // MARK: - UI
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    // MARK: Title input
    let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "모임을 설명해 주세요 : )"
        label.font = Fonts.H02.font
        return label
    }()
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "모임 게시글의 제목을 써주세요."
        label.font = Fonts.SH03Bold.font
        return label
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "게시글 제목에는 정확한 목적을 기재하면 지원률이 높아집니다!"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "제목을 입력해 주세요."
        textField.font = Fonts.Body02.font
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    // MARK: Region selection
    let regionLabel: UILabel = {
        let label = UILabel()
        label.text = "모임 지역을 선택해주세요."
        label.font = Fonts.SH03Bold.font
        return label
    }()
    let onlineLabel: UILabel = {
        let label = UILabel()
        label.text = "온라인"
        label.font = Fonts.Body02.font
        return label
    }()
    let onlineSwitch = UISwitch()
    let regionTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "읍,면,동으로 검색하세요."
        textField.font = Fonts.Body02.font
        textField.textColor = SharedDSKitAsset.Colors.textDisabled.color
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    // MARK: Member limit
    let memberLimitLabel: UILabel = {
        let label = UILabel()
        label.text = "모임에는 몇 명까지 가입할 수 있나요?"
        label.font = Fonts.SH03Bold.font
        return label
    }()
    let maximumLabel: UILabel = {
        let label = UILabel()
        label.text = "최대"
        label.font = Fonts.Body02.font
        return label
    }()
    let memberLimitTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "100"
        return textField
    }()
    let unitLabel: UILabel = {
        let label = UILabel()
        label.text = "명"
        label.font = Fonts.Body02.font
        return label
    }()
    
    // MARK: Date input
    let dateTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "모임 날짜는 언제인가요?"
        label.font = Fonts.SH03Bold.font
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "모임 날짜"
        label.font = Fonts.Caption.font
        return label
    }()
    // TODO: TextField에 date picker 붙이기
    let dateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "날짜 선택"
        textField.font = Fonts.Body02.font
        return textField
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "모임 시간"
        label.font = Fonts.Caption.font
        return label
    }()
    // TODO: TextField에 date picker 붙이기
    let timeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "시간 선택"
        textField.font = Fonts.Body02.font
        return textField
    }()
    
    // MARK: Thumbnail image selection
    let imageLabel: UILabel = {
        let label = UILabel()
        label.text = "대표 이미지를 골라주세요!"
        label.font = Fonts.SH03Bold.font
        return label
    }()
    let addImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("이미지 첨부", for: .normal)
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitleColor(SharedDSKitAsset.Colors.text02.color, for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        button.layer.cornerRadius = 16
        return button
    }()
    let setDefaultImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("기본 이미지로 설정하기", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        return button
    }()
    
    // MARK: Introduction
    let introductionLabel: UILabel = {
        let label = UILabel()
        label.text = "모임에 대한 소개글을 작성해주세요!"
        label.font = Fonts.SH03Bold.font
        return label
    }()
    // TODO: first responder이나 아니냐에 따라 Text색상이 바뀌면서 placeholder가 사라지도록 하기
    let introductionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "자유롭게 소개글을 작성해 보세요!"
        textView.textColor = SharedDSKitAsset.Colors.textDisabled.color
        textView.font = Fonts.Body02.font
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1
        textView.clipsToBounds = true
        textView.layer.cornerRadius = 16
        textView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return textView
    }()
    
    // MARK: StackViews
    let titleStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    let regionStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    let onlineStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    let memberLimitStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    let memberInputStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 1
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 16
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    let dateStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    let inputStackView: UIStackView = {
        let stackView = UIStackView()
         stackView.axis = .horizontal
         stackView.spacing = 8
        stackView.distribution = .fillEqually
         return stackView
     }()
    let dateInputStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 1
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 16
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    let timeInputStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 1
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 16
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    let imageSelectionStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .leading
        return stackView
    }()
    let introductionStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    // MARK: Create button
    let createButton: UIButton = {
        let button = UIButton()
        button.setTitle("모임 개설하기", for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.setTitleColor(SharedDSKitAsset.Colors.textDisabled.color, for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.layer.cornerRadius = 16
        return button
    }()
    
    private func render() {
        // 배경색 흰색으로 구성
        backgroundColor = .white
        
        // 버튼 텍스트에 밑줄 긋기
        let underlineAttributes: [NSAttributedString.Key: Any] = [
             .font: UIFont.systemFont(ofSize: 14),
             .foregroundColor: UIColor.lightGray,
             .underlineStyle: NSUnderlineStyle.single.rawValue
         ]
                
        let attributeString = NSMutableAttributedString(
            string: "기본 이미지로 설정하기",
            attributes: underlineAttributes
        )
        setDefaultImageButton.setAttributedTitle(attributeString, for: .normal)
        
        [mainTitleLabel, subtitleLabel, descriptionLabel, titleTextField].forEach { titleStackView.addArrangedSubview($0) }
        [onlineLabel, onlineSwitch].forEach { onlineStackView.addArrangedSubview($0) }
        [regionLabel, onlineStackView, regionTextField].forEach { regionStackView.addArrangedSubview($0) }
        [maximumLabel, memberLimitTextField, unitLabel].forEach { memberInputStackView.addArrangedSubview($0) }
        [memberLimitLabel,memberInputStackView].forEach { memberLimitStackView.addArrangedSubview($0) }
        [dateLabel, dateTextField].forEach { dateInputStackView.addArrangedSubview($0) }
        [timeLabel, timeTextField].forEach { timeInputStackView.addArrangedSubview($0) }
        [dateInputStackView, timeInputStackView].forEach { inputStackView.addArrangedSubview($0) }
        [dateTitleLabel, inputStackView].forEach { dateStackView.addArrangedSubview($0) }
        [imageLabel, addImageButton].forEach { imageSelectionStackView.addArrangedSubview($0) }
        [introductionLabel, introductionTextView].forEach { introductionStackView.addArrangedSubview($0) }
        
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [titleStackView, regionStackView, memberLimitStackView, dateStackView, imageSelectionStackView, setDefaultImageButton, introductionStackView, createButton].forEach{ contentView.addSubview($0) }
        let topPadding: CGFloat = 60
        let horizontalPadding: CGFloat = 20
        let interSpacing: CGFloat = 40
        let safeArea = self.safeAreaLayoutGuide
        
        // MARK: Scrollview
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
        
        contentView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.leading.trailing.bottom.equalTo(scrollView.contentLayoutGuide)
            $0.top.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        // MARK: titleStackView
        titleStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(horizontalPadding)
            $0.top.equalTo(contentView.snp.top).offset(topPadding)
        }
        
        //MARK: regionStackView
        regionStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(horizontalPadding)
            $0.top.equalTo(titleStackView.snp.bottom).offset(interSpacing)
        }
        
        // MARK: memberLimitStackView
        let memberLimitInputHeight: CGFloat = 56
        memberLimitStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(horizontalPadding)
            $0.top.equalTo(regionStackView.snp.bottom).offset(interSpacing)
            $0.height.equalTo(memberLimitInputHeight + 25)
        }
        
        // MARK: dateStackView
        dateStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(horizontalPadding)
            $0.top.equalTo(memberLimitStackView.snp.bottom).offset(interSpacing)
        }
        
        let dateInputHeight: CGFloat = 56
        dateInputStackView.snp.makeConstraints {
            $0.height.equalTo(dateInputHeight)
        }
        timeInputStackView.snp.makeConstraints {
            $0.height.equalTo(dateInputHeight)
        }
        
        // MARK: imageSelectionStackView
        imageSelectionStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(horizontalPadding)
            $0.top.equalTo(dateStackView.snp.bottom).offset(interSpacing)
        }
        let addImageButtonSize: CGFloat = 100
        addImageButton.snp.makeConstraints {
            $0.height.width.equalTo(addImageButtonSize)
        }
        setDefaultImageButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(horizontalPadding)
            $0.top.equalTo(imageSelectionStackView.snp.bottom).offset(24)
        }
        
        // MARK: introductionStackView
        let introductionTextViewheight: CGFloat = 176
        introductionTextView.snp.makeConstraints {
            $0.height.equalTo(introductionTextViewheight)
        }
        introductionStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(horizontalPadding)
            $0.top.equalTo(setDefaultImageButton.snp.bottom).offset(interSpacing)
        }
        
        // MARK: Creat button
        let createButtonHeight: CGFloat = 52
        createButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(horizontalPadding)
            $0.top.equalTo(introductionStackView.snp.bottom).offset(interSpacing)
            $0.bottom.equalTo(contentView.snp.bottom).inset(8)
            $0.height.equalTo(createButtonHeight)
        }
    }
}
