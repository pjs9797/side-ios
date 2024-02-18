import UIKit
import SnapKit
import Shared
import RxSwift
import ReactorKit

class HobbyDetailCollectionViewCell: UICollectionViewCell, ReactorKit.View {
    var disposeBag = DisposeBag()
    let borderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 28*Constants.standardHeight
        view.layer.borderWidth = 1
        view.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        view.isHidden = true
        return view
    }()
    let imgBgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        imageView.layer.cornerRadius = 24*Constants.standardHeight
        return imageView
    }()
    lazy var targetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 24*Constants.standardHeight
        return imageView
    }()
    let titleLabel: UILabel = {
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
    
    private func layout(){
        [borderView,imgBgImageView,targetImageView,titleLabel]
            .forEach{ self.contentView.addSubview($0) }
        
        borderView.snp.makeConstraints { make in
            make.width.height.equalTo(56*Constants.standardHeight)
            make.leading.top.equalToSuperview()
        }
        
        imgBgImageView.snp.makeConstraints { make in
            make.width.height.equalTo(48*Constants.standardHeight)
            make.centerX.centerY.equalTo(borderView)
        }
        
        targetImageView.snp.makeConstraints { make in
            make.width.height.equalTo(48*Constants.standardHeight)
            make.centerX.centerY.equalTo(borderView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(borderView.snp.bottom).offset(4*Constants.standardHeight)
        }
    }
    
    func setSelectedState(isSelected: Bool) {
        borderView.isHidden = !isSelected
    }
}

extension HobbyDetailCollectionViewCell{
    func bind(reactor: HobbyDetailCollectionViewCellReactor) {
        reactor.state.map{ $0.targetImage }
            .distinctUntilChanged()
            .bind(to: targetImageView.rx.image)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.title }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] title in
                self?.titleLabel.text = title
                if(title == "기타"){
                    self?.targetImageView.snp.remakeConstraints { make in
                        make.width.equalTo(20*Constants.standardWidth)
                        make.height.equalTo(4*Constants.standardHeight)
                        make.centerX.centerY.equalTo(self?.borderView ?? UIView())
                    }
                }
                else{
                    self?.targetImageView.snp.remakeConstraints { make in
                        make.width.height.equalTo(48*Constants.standardHeight)
                        make.centerX.centerY.equalTo(self?.borderView ?? UIView())
                    }
                }
            })
            .disposed(by: disposeBag)
    }
}
