import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Shared

class AlbumCollectionViewCell: UICollectionViewCell, ReactorKit.View {
    var disposeBag = DisposeBag()
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    let checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 12*Constants.standardHeight
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
            make.width.height.equalTo(24*Constants.standardHeight)
            make.trailing.equalToSuperview().offset(-8*Constants.standardWidth)
            make.top.equalToSuperview().offset(8*Constants.standardHeight)
        }
    }
}

extension AlbumCollectionViewCell{
    func bind(reactor: AlbumCollectionViewCellReactor) {
        reactor.state.map { $0.image }
            .distinctUntilChanged()
            .bind(to: photoImageView.rx.image)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isSelected }
            .distinctUntilChanged()
            .map { $0 ? SharedDSKitAsset.Icons.frame419.image : nil }
            .bind(to: checkImageView.rx.image)
            .disposed(by: disposeBag)
    }
}
