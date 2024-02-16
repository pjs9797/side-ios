import UIKit
import RxSwift
import ReactorKit
import Shared
import SnapKit

class LogoutSettingTableViewCell: UITableViewCell, ReactorKit.View {
    var disposeBag = DisposeBag()
    let mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        label.font = Fonts.Body02.font
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
        self.contentView.addSubview(mainLabel)
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}

extension LogoutSettingTableViewCell{
    func bind(reactor: LogoutSettingTableViewCellReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: LogoutSettingTableViewCellReactor){
        
    }
    
    private func bindState(reactor: LogoutSettingTableViewCellReactor){
        reactor.state.map { $0.mainLabelText }
            .distinctUntilChanged()
            .bind(to: mainLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
