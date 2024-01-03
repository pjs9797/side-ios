import UIKit
import RxSwift
import RxCocoa
import Shared

class TimePickerView: UIView {
    let disposeBag = DisposeBag()
    var createMeetingPeriodViewModel: CreateMeetingPeriodViewModel
    let amPm = ["오전", "오후"]
    let hours = (1...12).map { String(format: "%02d", $0) }
    let minutes = (0...59).map { String(format: "%02d", $0) }
    var isInitialized = 1
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
    
    init(createMeetingPeriodViewModel: CreateMeetingPeriodViewModel) {
        self.createMeetingPeriodViewModel = createMeetingPeriodViewModel
        super.init(frame: .zero)
        
        timePicker.delegate = self
        timePicker.dataSource = self
        bind()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isInitialized > 0 {
            let now = Date()
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: now)
            let minute = calendar.component(.minute, from: now)
            
            let periodIndex = hour >= 12 ? 1 : 0
            let formattedHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour)
            
            timePicker.selectRow(periodIndex, inComponent: 0, animated: false)
            timePicker.selectRow(formattedHour - 1, inComponent: 1, animated: false)
            timePicker.selectRow(minute, inComponent: 2, animated: false)
            isInitialized -= 1
        } else {
            timePicker.selectRow(createMeetingPeriodViewModel.selectedPeriodIndex, inComponent: 0, animated: false)
            timePicker.selectRow(createMeetingPeriodViewModel.selectedHourIndex, inComponent: 1, animated: false)
            timePicker.selectRow(createMeetingPeriodViewModel.selectedMinuteIndex, inComponent: 2, animated: false)
        }
        
    }
    
    private func selectTimeInViewModel(periodIndex: Int, hourIndex: Int, minuteIndex: Int) {
        let period = amPm[periodIndex]
        let hour = hours[hourIndex]
        let minute = minutes[minuteIndex]
        createMeetingPeriodViewModel.selectPeriod(period, hour: hour, minute: minute)
    }
    
    func bind() {
        timePicker.rx.itemSelected.subscribe(onNext: { [weak self] (row, component) in
            guard let self = self else { return }
            let period = self.amPm[self.timePicker.selectedRow(inComponent: 0)]
            let hour = self.hours[self.timePicker.selectedRow(inComponent: 1)]
            let minute = self.minutes[self.timePicker.selectedRow(inComponent: 2)]
            
            switch component {
            case 0:
                self.createMeetingPeriodViewModel.selectPeriod(period, hour: hour, minute: minute)
            case 1:
                self.createMeetingPeriodViewModel.selectHour(hour, period: period, minute: minute)
            case 2:
                self.createMeetingPeriodViewModel.selectMinute(minute, period: period, hour: hour)
            default:
                break
            }
        }).disposed(by: disposeBag)
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
        let label = UILabel()
        label.textAlignment = .center
        label.font = Fonts.SH03.font
        switch component{
        case 0:
            label.text = amPm[row]
        case 1:
            label.text = hours[row]
        case 2:
            label.text = minutes[row]
        default:
            break
        }
        if pickerView.selectedRow(inComponent: component) == row {
            if pickerView.bounds.midY >= 56 && pickerView.bounds.midY <= 112 {
                label.textColor = SharedDSKitAsset.Colors.green.color
            } else {
                label.textColor = .black
            }
        }
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadAllComponents()
    }
}

extension TimePickerView: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return amPm.count
        case 1: return hours.count
        case 2: return minutes.count
        default: return 0
        }
    }
}
