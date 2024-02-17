import UIKit
import RxSwift
import ReactorKit
import SnapKit
import Shared

class DevelopHobbyCollectionViewCell: UICollectionViewCell, ReactorKit.View {
    var disposeBag = DisposeBag()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.SH01.font
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderWidth = 1
        self.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
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
        self.contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension DevelopHobbyCollectionViewCell{
    func bind(reactor: DevelopHobbyCollectionViewReactor) {
        reactor.state.map { $0.title }
            .distinctUntilChanged()
            .bind(to: titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map{ $0.isSelected }
            .bind(onNext: { [weak self] status in
                if status {
                    self?.titleLabel.font = Fonts.SH01Bold.font
                    self?.titleLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
                    self?.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                }
                else{
                    self?.titleLabel.font = Fonts.SH01.font
                    self?.titleLabel.textColor = .black
                    self?.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                }
            })
            .disposed(by: disposeBag)
    }
}
