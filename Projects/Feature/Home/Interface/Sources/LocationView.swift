import UIKit
import SnapKit
import Shared

class LocationView: UIView {
    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "읍,면,동으로 검색하세요."
        searchBar.layer.borderWidth = 1
        searchBar.layer.cornerRadius = 16
        searchBar.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        searchBar.backgroundImage = UIImage()
        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = SharedDSKitAsset.Colors.gr10.color
            textField.leftViewMode = .never
            textField.clearButtonMode = .never
        }
        
        return searchBar
    }()
    
    var searchButton: UIButton = {
        let searchButton = UIButton()
        searchButton.setImage(SharedDSKitAsset.Icons.iconSearch24.image, for: .normal)
        searchButton.tintColor = SharedDSKitAsset.Colors.gr100.color
        
        return searchButton
    }()
    
    var leftBarbutton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = SharedDSKitAsset.Colors.gr100.color
        
        return button
    }()
    
    let containerView = UIView()
    var settingButton: UIButton = {
        let button = UIButton()
        let attribute = NSAttributedString(string: "현재위치로 설정", attributes: [
            .font: Fonts.Body03.font,
            .foregroundColor: SharedDSKitAsset.Colors.gr100.color
        ])
        
        button.setAttributedTitle(attribute, for: .normal)
        return button
    }()
    
    var leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "scope")
        imageView.tintColor = SharedDSKitAsset.Colors.gr100.color
        
        return imageView
    }()
    
    var rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconArrowRight16.image
        imageView.tintColor = SharedDSKitAsset.Colors.gr100.color
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        addViews()
        setLayout()
    }
    
    func addViews() {
        [searchBar, containerView].forEach {
            self.addSubview($0)
        }
        
        searchBar.addSubview(searchButton)
        
        [settingButton, leftImageView, rightImageView].forEach {
            containerView.addSubview($0)
        }
    }
    
    func setLayout() {
        let safeArea = self.safeAreaLayoutGuide
        
        searchBar.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(56)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(safeArea.snp.top).offset(16)
        }
        
        searchButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        leftBarbutton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        
        containerView.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(43)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(safeArea.snp.top).offset(80)
        }
        
        settingButton.snp.makeConstraints { make in
            make.width.equalTo(118)
            make.height.equalTo(27)
            make.centerY.equalToSuperview()
            make.leading.equalTo(containerView.snp.leading).inset(20)
        }
        
        leftImageView.snp.makeConstraints { make in
            make.width.height.equalTo(16)
            make.centerY.equalToSuperview()
            make.leading.equalTo(containerView.snp.leading)
        }
        
        rightImageView.snp.makeConstraints { make in
            make.width.height.equalTo(16)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(containerView.snp.trailing)
        }
    }
}
