import UIKit
import SnapKit
import Shared

class SearchView: UIView {
    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "검색어를 입력해주세요."
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        searchBar.layer.cornerRadius = 16
        searchBar.backgroundImage = UIImage()
        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = .white
            textField.leftViewMode = .never
            textField.clearButtonMode = .never
        }
        
        return searchBar
    }()
    
    var tagViewOne = TagViewOne()
    var tagViewTwo = TagViewTwo()
     
    var backButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconArrowLeft24.image, for: .normal)
        button.tintColor = SharedDSKitAsset.Colors.gr100.color
        
        return button
    }()
    
    var searchButton: UIButton = {
        let searchButton = UIButton()
        searchButton.setImage(SharedDSKitAsset.Icons.iconSearch24.image, for: .normal)
        searchButton.tintColor = SharedDSKitAsset.Colors.gr100.color
        
        return searchButton
    }()
    
    var recentSearchLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "최근 검색어", attributes: [
            .font: Fonts.SH03Bold.font,
            .foregroundColor: SharedDSKitAsset.Colors.gr100.color
        ])
        
        return label
    }()
    
    var recommendationLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "추천 검색어", attributes: [
            .font: Fonts.SH03Bold.font,
            .foregroundColor: SharedDSKitAsset.Colors.gr100.color
        ])
        
        return label
    }()
    
    var deleteButton: UIButton = {
        let button = UIButton()
        let title = "전체 삭제"
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: title.count))
        attributedString.addAttribute(.foregroundColor, value: SharedDSKitAsset.Colors.text03.color, range: NSRange(location: 0, length: title.count))
        button.setAttributedTitle(attributedString, for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        self.backgroundColor = .white
        
        [searchBar, backButton, recentSearchLabel, deleteButton, recommendationLabel, tagViewOne, tagViewTwo].forEach {
            self.addSubview($0)
        }
        
        searchBar.addSubview(searchButton)
        setLayout()
        setTags()
    }
    
    func setLayout() {
        let safeArea = self.safeAreaLayoutGuide
        
        searchBar.snp.makeConstraints { make in
            make.width.equalTo(295)
            make.height.equalTo(48)
            make.leading.equalTo(60)
            make.trailing.equalTo(-20)
            make.top.equalTo(safeArea.snp.top).offset(4)
        }
        
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.centerY.equalTo(searchBar.snp.centerY)
            make.leading.equalTo(safeArea.snp.leading).inset(20)
        }
        
        searchButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.trailing.equalTo(searchBar.snp.trailing).inset(12)
            make.centerY.equalToSuperview()
        }
        
        recentSearchLabel.snp.makeConstraints { make in
            make.width.equalTo(82)
            make.height.equalTo(25)
            make.leading.equalTo(safeArea.snp.leading).inset(20)
            make.trailing.equalTo(safeArea.snp.trailing).inset(273)
            make.top.equalTo(searchBar.snp.bottom).offset(20)
        }
        
        recommendationLabel.snp.makeConstraints { make in
            make.width.equalTo(82)
            make.height.equalTo(25)
            make.leading.equalTo(safeArea.snp.leading).inset(20)
            make.trailing.equalTo(safeArea.snp.trailing).inset(273)
            make.top.equalTo(searchBar.snp.bottom).offset(181)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(24)
            make.leading.equalTo(safeArea.snp.leading).inset(295)
            make.trailing.equalTo(safeArea.snp.trailing).inset(20)
            make.top.equalTo(searchBar.snp.bottom).offset(20.5)
        }
        
        tagViewOne.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(88)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(recentSearchLabel.snp.bottom).offset(16)
        }
        
        tagViewTwo.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(88)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(recommendationLabel.snp.bottom).offset(16)
        }
    }
    
    func setTags() {
        ["직무", "면접", "회사 정보"].forEach { tagViewOne.addTag(tag: $0) }
        ["직무", "면접", "핫 플레이스", "사이드 프로젝트", "맛집 투어", "회사 정보"].forEach { tagViewTwo.addTag(tag: $0) }
    }
}

