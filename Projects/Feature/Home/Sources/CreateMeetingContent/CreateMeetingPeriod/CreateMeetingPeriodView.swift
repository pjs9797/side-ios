import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Shared

class CreateMeetingPeriodView: UIView, ReactorKit.View{
    var disposeBag = DisposeBag()
    let dateTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "모임 날짜는 언제인가요?"
        label.font = Fonts.SH03Bold.font
        return label
    }()
    let dateBtView: PeriodBtView = {
        let dateBtView = PeriodBtView(title: "모임 날짜", subTitle: "날짜 선택")
        dateBtView.layer.cornerRadius = 16*Constants.standardHeight
        dateBtView.layer.borderWidth = 1
        dateBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        return dateBtView
    }()
    let timeBtView: PeriodBtView = {
        let timeBtView = PeriodBtView(title: "모임 시간", subTitle: "시간 선택")
        timeBtView.layer.cornerRadius = 16*Constants.standardHeight
        timeBtView.layer.borderWidth = 1
        timeBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        return timeBtView
    }()
    let calendarView: CalendarView
    let timePickerView: TimePickerView
    
    init(with reactor: CreateMeetingPeriodReactor) {
        calendarView = CalendarView(with: reactor)
        timePickerView = TimePickerView(with: reactor)
        super.init(frame: .zero)
        
        self.reactor = reactor
        calendarView.isHidden = true
        timePickerView.isHidden = true
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(){
        [dateTitleLabel,dateBtView,timeBtView,calendarView,timePickerView]
            .forEach{ self.addSubview($0) }
        
        dateTitleLabel.snp.makeConstraints { make in
            make.height.equalTo(25*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.top.equalToSuperview()
        }
        
        dateBtView.snp.makeConstraints { make in
            make.width.equalTo(163.5*Constants.standardWidth)
            make.height.equalTo(56*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.top.equalTo(dateTitleLabel.snp.bottom).offset(16*Constants.standardHeight)
        }
        
        timeBtView.snp.makeConstraints { make in
            make.width.equalTo(163.5*Constants.standardWidth)
            make.height.equalTo(56*Constants.standardHeight)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(dateTitleLabel.snp.bottom).offset(16*Constants.standardHeight)
        }
        
        calendarView.snp.makeConstraints { make in
            make.width.equalTo(335*Constants.standardWidth)
            make.height.equalTo(0*Constants.standardHeight)
            make.centerX.equalToSuperview()
            make.top.equalTo(timeBtView.snp.bottom).offset(16*Constants.standardHeight)
        }

        timePickerView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(0)
            make.leading.equalToSuperview()
            make.top.equalTo(timeBtView.snp.bottom).offset(16*Constants.standardHeight)
        }
    }
    
    func calendarViewAppear(){
        UIView.animate(withDuration: 0.3, animations: {
            self.calendarView.isHidden = false
            self.calendarView.snp.updateConstraints { make in
                make.height.equalTo(358*Constants.standardHeight)
            }
            self.layoutIfNeeded()
        })
    }
    
    func calendarViewDisappear(){
        UIView.animate(withDuration: 0.3, animations: {
            self.calendarView.isHidden = true
            self.calendarView.snp.updateConstraints { make in
                make.height.equalTo(0)
            }
            self.layoutIfNeeded()
        })
    }
    
    func timePickerViewAppear(){
        UIView.animate(withDuration: 0.3, animations: {
            self.timePickerView.isHidden = false
            self.timePickerView.snp.updateConstraints { make in
                make.height.equalTo(168*Constants.standardHeight)
            }
            self.layoutIfNeeded()
        })
    }
    
    func timePickerViewDisappear(){
        UIView.animate(withDuration: 0.3, animations: {
            self.timePickerView.isHidden = true
            self.timePickerView.snp.updateConstraints { make in
                make.height.equalTo(0)
            }
            self.layoutIfNeeded()
        })
    }
}

extension CreateMeetingPeriodView{
    func bind(reactor: CreateMeetingPeriodReactor){
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: CreateMeetingPeriodReactor){
        dateBtView.tapGesture.rx.event
            .map { _ in Reactor.Action.toggleCalendarView }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        timeBtView.tapGesture.rx.event
            .map { _ in Reactor.Action.toggleTimePickerView }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: CreateMeetingPeriodReactor){
        reactor.state.map { $0.selectedDate }
            .distinctUntilChanged()
            .bind { [weak self] date in
                self?.dateBtView.configure(subTitle: date ?? "날짜 선택")
                self?.dateBtView.subTitleLabel.textColor = .black
            }
            .disposed(by: disposeBag)
        
        reactor.state.map{ $0.selectedTime }
            .distinctUntilChanged()
            .bind{ [weak self] time in
                self?.timeBtView.configure(subTitle: time ?? "시간 선택")
                self?.timeBtView.subTitleLabel.textColor = .black
            }
            .disposed(by: disposeBag)
    }
}
