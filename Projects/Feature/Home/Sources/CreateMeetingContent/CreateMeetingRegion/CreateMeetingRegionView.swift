import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Shared

class CreateMeetingRegionView: UIView, ReactorKit.View{
    public var disposeBag = DisposeBag()
    var selectMeetingRegionReactor: SelectMeetingRegionReactor
    let regionLabel: UILabel = {
        let label = UILabel()
        label.text = "모임 지역을 선택해주세요."
        label.font = Fonts.SH03Bold.font
        return label
    }()
    let onlineLabel: UILabel = {
        let label = UILabel()
        label.text = "온라인"
        label.font = Fonts.Body02.font
        return label
    }()
    let onlineSwitch: UISwitch = {
        let onlineSwitch = UISwitch()
        onlineSwitch.isOn = true
        return onlineSwitch
    }()
    let regionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.setTitle("읍,면,동으로 검색하세요.", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.textDisabled.color, for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 16*Constants.standardHeight
        button.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        button.isEnabled = false
        return button
    }()
    
    init(with reactor: CreateMeetingRegionReactor, selectMeetingRegionReactor: SelectMeetingRegionReactor){
        self.selectMeetingRegionReactor = selectMeetingRegionReactor
        super.init(frame: .zero)
        
        self.reactor = reactor
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        [regionLabel,onlineLabel,onlineSwitch,regionButton]
            .forEach{ self.addSubview($0) }
        
        regionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.top.equalToSuperview()
        }
        
        onlineLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.top.equalTo(regionLabel.snp.bottom).offset(19.5*Constants.standardHeight)
        }
        
        onlineSwitch.snp.makeConstraints { make in
            make.width.equalTo(51*Constants.standardWidth)
            make.height.equalTo(31*Constants.standardHeight)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.centerY.equalTo(onlineLabel)
        }
        
        regionButton.snp.makeConstraints { make in
            make.width.equalTo(335*Constants.standardWidth)
            make.height.equalTo(56*Constants.standardHeight)
            make.centerX.equalToSuperview()
            make.top.equalTo(onlineSwitch.snp.bottom).offset(16*Constants.standardHeight)
        }
        
        regionButton.titleLabel?.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16*Constants.standardWidth)
            make.centerY.equalToSuperview()
        }
    }
}

extension CreateMeetingRegionView{
    func bind(reactor: CreateMeetingRegionReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: CreateMeetingRegionReactor){
        onlineSwitch.rx.isOn
            .map{ Reactor.Action.updateOnlineSwitch($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        regionButton.rx.tap
            .map{ Reactor.Action.regionButtonTapped}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: CreateMeetingRegionReactor){
        reactor.state.map{ $0.isOnline }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] value in
                if value {
                    self?.regionButton.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                    self?.regionButton.isEnabled = false
                    self?.regionButton.setTitle("읍,면,동으로 검색하세요.", for: .normal)
                    self?.regionButton.setTitleColor(SharedDSKitAsset.Colors.textDisabled.color, for: .normal)
                }
                else{
                    self?.regionButton.backgroundColor = .white
                    self?.regionButton.isEnabled = true
                }
            })
            .disposed(by: disposeBag)
        
        selectMeetingRegionReactor.state.map{ $0.regionButtonTitle }
            .observe(on: MainScheduler.asyncInstance)
            .distinctUntilChanged()
            .bind(onNext: { [weak self] location in
                if location != "읍,면,동으로 검색하세요."{
                    self?.regionButton.setTitle(location, for: .normal)
                    self?.regionButton.setTitleColor(.black, for: .normal)
                    self?.reactor?.action.onNext(.setRegionButtonTitle(location))
                }
            })
            .disposed(by: disposeBag)
    }
}
