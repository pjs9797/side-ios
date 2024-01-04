import UIKit
import RxSwift
import RxCocoa
import Shared

class TimePickerView: UIView {
    let disposeBag = DisposeBag()
    var createMeetingPeriodViewModel: CreateMeetingPeriodViewModel
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
        setInitialPickerValues()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setInitialPickerValues() {
        // 시간 12시 설정
        let hourRow = (createMeetingPeriodViewModel.hours.value.count / 2) + (12 - 1) // 12시간 중 12시의 인덱스
        timePicker.selectRow(hourRow, inComponent: 1, animated: false)

        // 분 00분 설정
        let minuteRow = (createMeetingPeriodViewModel.minutes.value.count / 2) // 0분의 인덱스
        timePicker.selectRow(minuteRow, inComponent: 2, animated: false)
    }
    
    func bind() {
        timePicker.rx.itemSelected
            .subscribe(onNext: { [weak self] row, component in
                guard let self = self else { return }
                let selectedHourIndex = self.timePicker.selectedRow(inComponent: 1) % 12
                let selectedMinuteIndex = self.timePicker.selectedRow(inComponent: 2) % 60
                let selectedAmPm = self.createMeetingPeriodViewModel.amPm.value[self.timePicker.selectedRow(inComponent: 0) % 2]
                let selectedHour = self.createMeetingPeriodViewModel.hours.value[selectedHourIndex]
                let selectedMinute = self.createMeetingPeriodViewModel.minutes.value[selectedMinuteIndex]
                let timeString = "\(selectedAmPm) \(selectedHour):\(selectedMinute)"
                self.timePicker.reloadAllComponents()
                self.createMeetingPeriodViewModel.timeRelay.accept(timeString)
            })
            .disposed(by: disposeBag)
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
            label.text = createMeetingPeriodViewModel.amPm.value[row]
        case 1:
            label.text = createMeetingPeriodViewModel.hours.value[row % 24]
        case 2:
            label.text = createMeetingPeriodViewModel.minutes.value[row % 60]
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
        switch component {
        case 0:
            return createMeetingPeriodViewModel.amPm.value.count
        case 1:
            return createMeetingPeriodViewModel.hours.value.count
        case 2:
            return createMeetingPeriodViewModel.minutes.value.count
        default:
            return 0
        }
    }
}
