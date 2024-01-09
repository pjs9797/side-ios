import UIKit
import SnapKit
import Shared

class AlbumCollectionViewCell: UICollectionViewCell {
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    let checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 12
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = SharedDSKitAsset.Colors.gr60.color.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(){
        self.contentView.addSubview(photoImageView)
        self.photoImageView.addSubview(checkImageView)
        
        photoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        checkImageView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.trailing.equalToSuperview().offset(-8)
            make.top.equalToSuperview().offset(8)
        }
    }
    
    func selectedPhoto(isSelected: Bool){
        if isSelected {
            checkImageView.image = SharedDSKitAsset.Icons.frame419.image
        }
        else{
            checkImageView.image = nil
        }
    }
}
