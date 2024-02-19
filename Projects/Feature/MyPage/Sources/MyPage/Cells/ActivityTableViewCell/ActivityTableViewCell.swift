import UIKit
import RxSwift
import ReactorKit
import Shared
import SnapKit

class ActivityTableViewCell: UITableViewCell, ReactorKit.View {
    var disposeBag = DisposeBag()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.gr80.color
        return label
    }()
    let cntLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        label.textAlignment = .center
        return label
    }()
    let rightButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconArrowRight16.image, for: .normal)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
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
        [titleLabel, rightButton, cntLabel]
            .forEach{ self.contentView.addSubview($0) }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(24*Constants.standardHeight)
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(16*Constants.standardHeight)
            make.bottom.equalToSuperview().offset(-16*Constants.standardHeight)
        }
        
        rightButton.snp.makeConstraints { make in
            make.width.height.equalTo(16*Constants.standardHeight)
            make.trailing.equalToSuperview()
            make.centerY.equalTo(titleLabel)
        }
        
        cntLabel.snp.makeConstraints { make in
            make.trailing.equalTo(rightButton.snp.leading).offset(-16*Constants.standardWidth)
            make.centerY.equalTo(titleLabel)
        }
    }
}

extension ActivityTableViewCell{
    func bind(reactor: ActivityTableViewCellReactor) {
        reactor.state.map { $0.titleLabelText }
            .distinctUntilChanged()
            .bind(to: titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map{ $0.cntLabelText }
            .distinctUntilChanged()
            .bind(to: cntLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
