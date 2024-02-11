import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import Shared

class TimePickerView: UIView, ReactorKit.View {
    var disposeBag = DisposeBag()
    let timePicker = UIPickerView()
    let periodUpLine: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        return view
    }()
    let periodUnderLine: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        return view
    }()
    let hourUpLine: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        return view
    }()
    let hourUnderLine: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        return view
    }()
    let minuteUpLine: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        return view
    }()
    let minuteUnderLine: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        return view
    }()
    
    init(with reactor: CreateMeetingPeriodReactor) {
        super.init(frame: .zero)
        timePicker.delegate = self
        timePicker.dataSource = self
        self.reactor = reactor
        layout()
        setInitialPickerValues()
        timePicker.subviews[1].backgroundColor = .clear
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(){
        [timePicker,periodUpLine,periodUnderLine,hourUpLine,hourUnderLine,minuteUpLine,minuteUnderLine]
            .forEach{ self.addSubview($0) }
        timePicker.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        periodUpLine.snp.makeConstraints { make in
            make.width.equalTo(96)
            make.height.equalTo(1)
            make.leading.equalToSuperview().offset(59)
            make.top.equalToSuperview().offset(56)
        }
        periodUnderLine.snp.makeConstraints { make in
            make.width.equalTo(96)
            make.height.equalTo(1)
            make.leading.equalToSuperview().offset(59)
            make.top.equalToSuperview().offset(112)
        }
        hourUpLine.snp.makeConstraints { make in
            make.width.equalTo(68)
            make.height.equalTo(1)
            make.leading.equalTo(periodUnderLine.snp.trailing).offset(23)
            make.top.equalToSuperview().offset(56)
        }
        hourUnderLine.snp.makeConstraints { make in
            make.width.equalTo(68)
            make.height.equalTo(1)
            make.leading.equalTo(periodUnderLine.snp.trailing).offset(23)
            make.top.equalToSuperview().offset(112)
        }
        minuteUpLine.snp.makeConstraints { make in
            make.width.equalTo(68)
            make.height.equalTo(1)
            make.trailing.equalToSuperview().offset(-59)
            make.top.equalToSuperview().offset(56)
        }
        minuteUnderLine.snp.makeConstraints { make in
            make.width.equalTo(68)
            make.height.equalTo(1)
            make.trailing.equalToSuperview().offset(-59)
            make.top.equalToSuperview().offset(112)
        }
    }
    
    func setInitialPickerValues() {
        guard let reactor = self.reactor else { return }
        let hourRow = (reactor.currentState.hours.count / 2) + (12 - 1)
        timePicker.selectRow(hourRow, inComponent: 1, animated: false)
        let minuteRow = (reactor.currentState.minutes.count / 2)
        timePicker.selectRow(minuteRow, inComponent: 2, animated: false)
    }
}

extension TimePickerView: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch component {
        case 0: return 112
        case 1: return 84
        case 2: return 84
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 56
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        guard let reactor = self.reactor else { return UIView()}
        let label = (view as? UILabel) ?? UILabel()
        if pickerView.selectedRow(inComponent: component) == row {
            if pickerView.bounds.midY >= 56 && pickerView.bounds.midY <= 112 {
                label.textColor = SharedDSKitAsset.Colors.green.color
            } else {
                label.textColor = .black
            }
        }
        label.font = Fonts.Body03.font
        label.textAlignment = .center
        switch component{
        case 0:
            label.text = reactor.currentState.amPm[row % 2]
        case 1:
            label.text = reactor.currentState.hours[row % 24]
        case 2:
            label.text = reactor.currentState.minutes[row % 60]
        default:
            break
        }
        return label
    }
}

extension TimePickerView: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let reactor = self.reactor else { return 0 }
        switch component {
        case 0:
            return reactor.currentState.amPm.count
        case 1:
            return reactor.currentState.hours.count
        case 2:
            return reactor.currentState.minutes.count
        default:
            return 0
        }
    }
}

extension TimePickerView{
    func bind(reactor: CreateMeetingPeriodReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    func bindAction(reactor: CreateMeetingPeriodReactor){
        timePicker.rx.itemSelected
            .map { [weak self] _ in
                return Reactor.Action.selectTime(amPmIndex: self?.timePicker.selectedRow(inComponent: 0) ?? 0, hourIndex: self?.timePicker.selectedRow(inComponent: 1) ?? 0, minuteIndex: self?.timePicker.selectedRow(inComponent: 2) ?? 0)
            }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    func bindState(reactor: CreateMeetingPeriodReactor){
        reactor.state.map { $0.selectedTime }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] _ in
                self?.timePicker.reloadAllComponents()
            })
            .disposed(by: disposeBag)
    }
}
