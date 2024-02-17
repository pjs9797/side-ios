import UIKit
import RxSwift
import ReactorKit
import SnapKit
import Shared

class PositionCollectionViewCell: UICollectionViewCell, ReactorKit.View {
    var disposeBag = DisposeBag()
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.ST01.font
        label.textColor = SharedDSKitAsset.Colors.gr80.color
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        self.layer.cornerRadius = 20*Constants.standardHeight
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
    
    private func layout(){
        [iconImageView,titleLabel]
            .forEach{ self.contentView.addSubview($0) }
        
        iconImageView.snp.makeConstraints { make in
            make.width.height.equalTo(16*Constants.standardHeight)
            make.leading.equalToSuperview().offset(16*Constants.standardWidth)
            make.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(20*Constants.standardHeight)
            make.leading.equalTo(iconImageView.snp.trailing).offset(8*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-16*Constants.standardWidth)
            make.centerY.equalTo(iconImageView)
        }
    }
}

extension PositionCollectionViewCell{
    func bind(reactor: PositionCollectionViewReactor) {
        reactor.state.map{ $0.image }
            .distinctUntilChanged()
            .bind(to: iconImageView.rx.image)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.title }
            .distinctUntilChanged()
            .bind(to: titleLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
