import UIKit
import FSCalendar
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Shared

class CalendarView: UIView, ReactorKit.View{
    var disposeBag = DisposeBag()
    let headerView = UIView()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.SH03Bold.font
        label.textAlignment = .center
        return label
    }()
    let previousButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconArrowLeft24.image, for: .normal)
        return button
    }()
    let nextButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconArrowRight24.image, for: .normal)
        return button
    }()
    let calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.scrollEnabled = false
        calendar.placeholderType = .none
        calendar.headerHeight = 0
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.appearance.weekdayTextColor = SharedDSKitAsset.Colors.gr30.color
        calendar.appearance.titleTodayColor = SharedDSKitAsset.Colors.green.color
        calendar.appearance.selectionColor = SharedDSKitAsset.Colors.green.color
        calendar.appearance.titleSelectionColor = .white
        calendar.appearance.todayColor = .clear
        calendar.appearance.headerTitleFont = Fonts.SH03Bold.font
        calendar.appearance.weekdayFont = Fonts.SH01Bold.font
        calendar.appearance.titleFont = Fonts.Body03.font
        return calendar
    }()
    
    init(with reactor: CreateMeetingPeriodReactor) {
        super.init(frame: .zero)
        
        self.reactor = reactor
        calendar.delegate = self
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(){
        [headerView,calendar]
            .forEach{ self.addSubview($0) }
        [titleLabel,previousButton,nextButton]
            .forEach{ headerView.addSubview($0) }
        
        headerView.snp.makeConstraints { make in
            make.width.equalTo(303)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        calendar.snp.makeConstraints { make in
            make.width.equalTo(303)
            make.height.equalTo(326)
            make.centerX.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.width.equalTo(160)
            make.height.equalTo(25)
            make.centerX.centerY.equalToSuperview()
        }
        
        previousButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(titleLabel.snp.leading).offset(-16)
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.centerY.equalToSuperview()
            make.leading.equalTo(titleLabel.snp.trailing).offset(16)
        }
    }
    
    func updateTitleLabel(for date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        titleLabel.text = formatter.string(from: date)
    }
}

extension CalendarView: FSCalendarDelegate {
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        guard let reactor = self.reactor else { return }
        let currentPage = calendar.currentPage
        reactor.action.onNext(.setCurrentPage(currentPage))
        updateTitleLabel(for: currentPage)
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        guard let reactor = self.reactor else { return }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        let dateString = formatter.string(from: date)
        reactor.action.onNext(.selectDate(dateString))
    }
}

extension CalendarView{
    func bind(reactor: CreateMeetingPeriodReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    func bindAction(reactor: CreateMeetingPeriodReactor){
        previousButton.rx.tap
            .map { Reactor.Action.previousButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        nextButton.rx.tap
            .map { Reactor.Action.nextButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    func bindState(reactor: CreateMeetingPeriodReactor){
        reactor.state.map { $0.currentPage }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] date in
                self?.calendar.setCurrentPage(date, animated: true)
                self?.updateTitleLabel(for: date)
            })
            .disposed(by: disposeBag)
    }
}
