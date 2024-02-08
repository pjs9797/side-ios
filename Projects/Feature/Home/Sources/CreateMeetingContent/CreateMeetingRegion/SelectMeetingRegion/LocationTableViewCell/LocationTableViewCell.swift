import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Shared

class LocationTableViewCell: UITableViewCell, ReactorKit.View{
    public var disposeBag = DisposeBag()
    let locationNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Fonts.Body02.font
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
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
        self.contentView.addSubview(locationNameLabel)
        
        locationNameLabel.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
}

extension LocationTableViewCell{
    func bind(reactor: LocationTableViewCellReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: LocationTableViewCellReactor){
        locationNameLabel.text = reactor.currentState.locationName
    }
    
    private func bindState(reactor: LocationTableViewCellReactor){
        
    }
}
