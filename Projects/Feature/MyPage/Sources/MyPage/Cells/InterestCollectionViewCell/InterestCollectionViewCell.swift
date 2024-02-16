import UIKit
import RxSwift
import ReactorKit
import SnapKit
import Shared

class InterestCollectionViewCell: UICollectionViewCell, ReactorKit.View {
    var disposeBag = DisposeBag()
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
        self.layer.cornerRadius = 12.5
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
        self.contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension InterestCollectionViewCell{
    func bind(reactor: InterestCollectionViewCellReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: InterestCollectionViewCellReactor){
        
    }
    
    private func bindState(reactor: InterestCollectionViewCellReactor){
        reactor.state.map { $0.titleLabelText }
            .distinctUntilChanged()
            .bind(to: titleLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
