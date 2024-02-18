import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Shared

public class CreateMeetingContentViewController: UIViewController, ReactorKit.View {
    public var disposeBag = DisposeBag()
    let meetingTitle: String
    let selectMeetingRegionReactor: SelectMeetingRegionReactor
    let createMeetingRegionReactor: CreateMeetingRegionReactor
    let createMeetingContentReactor: CreateMeetingContentReactor
    let createMeetingPeriodReactor: CreateMeetingPeriodReactor
    let createMeetingImageReactor: CreateMeetingImageReactor
    let backButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconArrowLeft24.image, style: .plain, target: nil, action: nil)
    let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        progressView.tintColor = .black
        progressView.progress = 1
        return progressView
    }()
    let scrollView = UIScrollView()
    let contentView = UIView()
    let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "모임을 설명해 주세요 :)"
        label.font = Fonts.H02.font
        return label
    }()
    let createMeetingTitleView = CreateMeetingTitleView()
    lazy var createMeetingRegionView = CreateMeetingRegionView(with: self.createMeetingRegionReactor, selectMeetingRegionReactor: self.selectMeetingRegionReactor)
    let createMeetingMemberView = CreateMeetingMemberView()
    lazy var createMeetingPeriodView = CreateMeetingPeriodView(with: self.createMeetingPeriodReactor)
    lazy var createMeetingImageView = CreateMeetingImageView(with: self.createMeetingImageReactor)
    let createMeetingWritingView = CreateMeetingWritingView()
    let createButton: UIButton = {
        let button = UIButton()
        button.setTitle("모임 개설하기", for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.layer.cornerRadius = 16*Constants.standardHeight
        button.layer.borderWidth = 1
        return button
    }()
    
    public init(meetingTitle: String, createMeetingContentReactor: CreateMeetingContentReactor, createMeetingRegionReactor: CreateMeetingRegionReactor, selectMeetingRegionReactor: SelectMeetingRegionReactor, createMeetingPeriodReactor: CreateMeetingPeriodReactor, createMeetingImageReactor: CreateMeetingImageReactor) {
        self.meetingTitle = meetingTitle
        self.createMeetingContentReactor = createMeetingContentReactor
        self.createMeetingRegionReactor = createMeetingRegionReactor
        self.selectMeetingRegionReactor = selectMeetingRegionReactor
        self.createMeetingPeriodReactor = createMeetingPeriodReactor
        self.createMeetingImageReactor = createMeetingImageReactor
        super.init(nibName: nil, bundle: nil)
        
        self.reactor = createMeetingContentReactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        addKeyboardObserverInScrollView(scrollView: scrollView, disposeBag: disposeBag)
        hideKeyboard(delegate: self, disposeBag: disposeBag)
        self.setNavigationbar()
        self.createButton.disableNextButton()
        self.layout()
    }
    
    private func setNavigationbar() {
        self.title = self.meetingTitle
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : Fonts.SH03Bold.font,
            .foregroundColor: UIColor.black
        ]
        self.backButton.tintColor = SharedDSKitAsset.Colors.black.color
        navigationItem.leftBarButtonItem = backButton
    }
    
    func layout(){
        [progressView,scrollView]
            .forEach{ self.view.addSubview($0) }
        scrollView.addSubview(contentView)
        
        progressView.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        scrollView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.top.equalTo(progressView.snp.bottom)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        contentView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        [mainTitleLabel,createMeetingTitleView,createMeetingRegionView,createMeetingMemberView,createMeetingPeriodView,createMeetingImageView,createMeetingWritingView,createButton]
            .forEach{ contentView.addSubview($0) }
        
        mainTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.top.equalToSuperview().offset(60*Constants.standardHeight)
        }
        
        createMeetingTitleView.snp.makeConstraints { make in
            make.height.equalTo(153*Constants.standardHeight)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(40*Constants.standardHeight)
        }
        
        createMeetingRegionView.snp.makeConstraints { make in
            make.height.equalTo(144*Constants.standardHeight)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(createMeetingTitleView.snp.bottom).offset(40*Constants.standardHeight)
        }
        
        createMeetingMemberView.snp.makeConstraints { make in
            make.height.equalTo(97*Constants.standardHeight)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(createMeetingRegionView.snp.bottom).offset(40*Constants.standardHeight)
        }
        
        createMeetingPeriodView.snp.makeConstraints { make in
            make.height.equalTo(97*Constants.standardHeight)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(createMeetingMemberView.snp.bottom).offset(40*Constants.standardHeight)
        }
        
        createMeetingImageView.snp.makeConstraints { make in
            make.height.equalTo(189*Constants.standardHeight)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(createMeetingPeriodView.snp.bottom).offset(40*Constants.standardHeight)
        }
        
        createMeetingWritingView.snp.makeConstraints { make in
            make.height.equalTo(217*Constants.standardHeight)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(createMeetingImageView.snp.bottom).offset(40*Constants.standardHeight)
        }
        
        createButton.snp.makeConstraints { make in
            make.width.equalTo(335*Constants.standardWidth)
            make.height.equalTo(52*Constants.standardHeight)
            make.centerX.equalToSuperview()
            make.top.equalTo(createMeetingWritingView.snp.bottom).offset(56*Constants.standardHeight)
            make.bottom.equalToSuperview()
        }
    }
    
    func updateCreateMeetingPeriodViewHeight() {
        let baseHeight = 97*Constants.standardHeight
        let calendarViewHeight = (358 + 16)*Constants.standardHeight
        let timePickerViewHeight = (168 + 16)*Constants.standardHeight
        let newHeight: CGFloat
        
        if createMeetingPeriodView.reactor?.currentState.isCalendarViewVisible ?? false {
            newHeight = baseHeight + calendarViewHeight
        } else if createMeetingPeriodView.reactor?.currentState.isTimePickerViewVisible ?? false {
            newHeight = baseHeight + timePickerViewHeight
        } else {
            newHeight = baseHeight
        }
        
        UIView.animate(withDuration: 0.3, animations:{
            self.createMeetingPeriodView.snp.updateConstraints { make in
                make.height.equalTo(newHeight*Constants.standardHeight)
            }
            self.view.layoutIfNeeded()
        })
    }
}

extension CreateMeetingContentViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view?.isDescendant(of: self.createMeetingPeriodView.calendarView.calendar) == nil
    }
}

extension CreateMeetingContentViewController{
    public func bind(reactor: CreateMeetingContentReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: CreateMeetingContentReactor){
        backButton.rx.tap
            .map{ Reactor.Action.backButtonTapped}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        createButton.rx.tap
            .map{ Reactor.Action.createButtonTapped}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        createMeetingTitleView.titleTextField.rx.text.orEmpty
            .distinctUntilChanged()
            .map{ Reactor.Action.writeTitleText($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        createMeetingRegionReactor.state.map{ $0.region }
            .distinctUntilChanged()
            .map{ Reactor.Action.setRegionText($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        createMeetingMemberView.memberLimitTextField.rx.text.orEmpty
            .distinctUntilChanged()
            .map(Reactor.Action.writeMemberLimitText)
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        createMeetingPeriodReactor.state.compactMap { $0.selectedDate }
            .distinctUntilChanged()
            .map { Reactor.Action.setSelectedDate($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        createMeetingPeriodReactor.state.compactMap { $0.selectedTime }
            .distinctUntilChanged()
            .map { Reactor.Action.setSelectedTime($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        EditPhotoReactor.shared.state.map{ $0.image }
            .distinctUntilChanged()
            .map{ Reactor.Action.setImage($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        createMeetingWritingView.introductionTextView.rx.text.orEmpty
            .distinctUntilChanged()
            .map{ Reactor.Action.writeIntroductionText($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: CreateMeetingContentReactor){
        reactor.state.map { $0.isCreateButtonEnabled }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] isEnable in
                if isEnable {
                    self?.createButton.isEnabled = isEnable
                    self?.createButton.enableNextButton()
                }
                else{
                    self?.createButton.isEnabled = isEnable
                    self?.createButton.disableNextButton()
                }
            })
            .disposed(by: disposeBag)
        
        createMeetingPeriodView.reactor?.state
            .skip(1)
            .map { state -> (Bool, Bool) in
                return (state.isCalendarViewVisible, state.isTimePickerViewVisible)
            }
            .bind(onNext: { [weak self] (isCalendarVisible, isTimePickerVisible) in
                self?.updateCreateMeetingPeriodViewHeight()
                if isCalendarVisible {
                    self?.createMeetingPeriodView.calendarViewAppear()
                }
                else {
                    self?.createMeetingPeriodView.calendarViewDisappear()
                }

                if isTimePickerVisible {
                    self?.createMeetingPeriodView.timePickerViewAppear()
                }
                else {
                    self?.createMeetingPeriodView.timePickerViewDisappear()
                }
            })
            .disposed(by: disposeBag)
    }
}
