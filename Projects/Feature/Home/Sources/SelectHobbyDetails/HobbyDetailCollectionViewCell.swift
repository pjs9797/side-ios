import UIKit
import SnapKit
import Shared

class HobbyDetailCollectionViewCell: UICollectionViewCell {
    
    lazy var borderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 28
        view.layer.borderWidth = 1
        view.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        view.isHidden = true
        return view
    }()
    
    lazy var imgBgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        imageView.layer.cornerRadius = 24
        return imageView
    }()
    
    lazy var targetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 24
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.ST01.font
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        [borderView,imgBgImageView,targetImageView,titleLabel]
            .forEach{ self.contentView.addSubview($0) }
        
        borderView.snp.makeConstraints { make in
            make.width.height.equalTo(56)
            make.leading.top.equalToSuperview()
        }
        
        imgBgImageView.snp.makeConstraints { make in
            make.width.height.equalTo(48)
            make.centerX.centerY.equalTo(borderView)
        }
        
        targetImageView.snp.makeConstraints { make in
            make.width.height.equalTo(48)
            make.centerX.centerY.equalTo(borderView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(borderView.snp.bottom).offset(4)
        }
        
    }
    
    func configure(model: HobbyDetailModel){
        self.targetImageView.image = model.img
        self.titleLabel.text = model.title
        
        if(model.title == "기타"){
            targetImageView.snp.remakeConstraints { make in
                make.width.equalTo(20)
                make.height.equalTo(4)
                make.centerX.centerY.equalTo(borderView)
            }
        }
        else{
            targetImageView.snp.remakeConstraints { make in
                make.width.height.equalTo(48)
                make.centerX.centerY.equalTo(borderView)
            }
        }
    }
    
    func setSelectedState(isSelected: Bool) {
        borderView.isHidden = !isSelected
    }
    
}
