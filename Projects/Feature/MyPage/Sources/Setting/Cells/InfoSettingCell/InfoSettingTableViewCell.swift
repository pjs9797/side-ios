import UIKit
import RxSwift
import ReactorKit
import Shared
import SnapKit

class InfoSettingTableViewCell: UITableViewCell, ReactorKit.View {
    var disposeBag = DisposeBag()
    let mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        label.font = Fonts.Body02.font
        return label
    }()
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.gr30.color
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        [mainLabel, infoLabel]
            .forEach { self.contentView.addSubview($0) }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}

extension InfoSettingTableViewCell{
    func bind(reactor: InfoSettingTableViewCellReactor) {
        reactor.state.map { $0.mainLabelText }
            .distinctUntilChanged()
            .bind(to: mainLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.infoLabelText }
            .distinctUntilChanged()
            .bind(to: infoLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
