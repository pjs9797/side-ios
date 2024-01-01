import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Shared

class CreateMeetingPeriodView: UIView{
    let disposeBag = DisposeBag()
    let dateTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "모임 날짜는 언제인가요?"
        label.font = Fonts.SH03Bold.font
        return label
    }()
    let dateBtView: PeriodBtView = {
        let dateBtView = PeriodBtView(title: "모임 날짜", subTitle: "날짜 선택")
        dateBtView.layer.cornerRadius = 16
        dateBtView.layer.borderWidth = 1
        dateBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        return dateBtView
    }()
    let timeBtView: PeriodBtView = {
        let timeBtView = PeriodBtView(title: "모임 시간", subTitle: "시간 선택")
        timeBtView.layer.cornerRadius = 16
        timeBtView.layer.borderWidth = 1
        timeBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        return timeBtView
    }()
<<<<<<< HEAD
<<<<<<< HEAD
    let calendarView = CalendarView(calendarViewModel: CalendarViewModel())
    //let customTimePickerView = CustomTimePickerView(timePickerViewModel: TimePickerViewModel())
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
=======
    let calendarView = CalendarView(calendarViewModel: CalendarViewModel())
    //let customTimePickerView = CustomTimePickerView(timePickerViewModel: TimePickerViewModel())
>>>>>>> caef135 ([FEAT] 타임피커뷰 개발)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        [dateTitleLabel,dateBtView,timeBtView]
            .forEach{ self.addSubview($0) }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        dateTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview()
        }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        dateBtView.snp.makeConstraints { make in
            make.width.equalTo(163.5)
            make.height.equalTo(56)
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(dateTitleLabel.snp.bottom).offset(16)
        }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        timeBtView.snp.makeConstraints { make in
            make.width.equalTo(163.5)
            make.height.equalTo(56)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(dateTitleLabel.snp.bottom).offset(16)
        }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> caef135 ([FEAT] 타임피커뷰 개발)
//        calendarView.snp.makeConstraints { make in
//            make.width.equalToSuperview()
//            make.height.equalTo(358)
//            make.leading.equalToSuperview()
//            make.top.equalTo(timeBtView.snp.bottom).offset(16)
//            make.bottom.equalToSuperview()
//        }
//        customTimePickerView.snp.makeConstraints { make in
//            make.width.equalToSuperview()
//            make.height.equalTo(168)
//            make.leading.equalToSuperview()//.offset(47)
//            make.top.equalTo(timeBtView.snp.bottom).offset(16)
//            make.bottom.equalToSuperview()
//        }
    }
        
//    func selectedPickerViewUICustom() {
//        customTimePickerView.subviews[1].backgroundColor = .clear
//        
//        
//        let upLine = UIView(frame: CGRect(x: 215, y: 0, width: 68, height: 1))
//        let underLine = UIView(frame: CGRect(x: 215, y: 56, width: 68, height: 1))
//        
//        upLine.backgroundColor = .gray
//        underLine.backgroundColor = .gray
//        
//        customTimePickerView.subviews[1].addSubview(upLine)
//        customTimePickerView.subviews[1].addSubview(underLine)
//    }
=======
    }
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
}
