import UIKit
import RxSwift
import RxCocoa
import Shared

class TimePickerView: UIView {
    let disposeBag = DisposeBag()
    var createMeetingPeriodViewModel: CreateMeetingPeriodViewModel!
    let amPm = ["오전", "오후"]
    let hours = Array(1...12)
    let minutes = Array(0...59)
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        timePicker.delegate = self
        timePicker.dataSource = self
        bind()
        layout()
    }
    
    convenience init(createMeetingPeriodViewModel: CreateMeetingPeriodViewModel) {
        self.init(frame: .zero)
        self.createMeetingPeriodViewModel = createMeetingPeriodViewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind() {
        timePicker.rx.itemSelected.subscribe(onNext: { [weak self] (row, component) in
            switch component {
            case 0:
                let period = self?.amPm[row]
                
                self?.createMeetingPeriodViewModel.selectPeriod(period!)
            case 1:
                let hour = self?.hours[row]
                self?.createMeetingPeriodViewModel.selectHour(hour!)
            case 2:
                let minute = self?.minutes[row]
                self?.createMeetingPeriodViewModel.selectMinute(minute!)
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
            label.text = String(format: "%02d",hours[row])
        case 2:
            label.text = String(format: "%02d",minutes[row])
        default:
            break
        }
        if pickerView.selectedRow(inComponent: component) == row {
            if pickerView.bounds.midY >= 56 && pickerView.bounds.midY <= 112 {
                label.textColor = UIColor(red: 0.32, green: 0.64, blue: 0, alpha: 1)
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
