import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Shared

public class InitializeCreateMeetingViewController: UIViewController, ReactorKit.View{
    public var disposeBag = DisposeBag()
    var meetingTitle: String
    let backButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconArrowLeft24.image, style: .plain, target: nil, action: nil)
    let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        progressView.tintColor = .black
        progressView.progress = 1/3
        return progressView
    }()
    let questionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.H02.font
        label.text = "어떤 모임을 만들고 싶으신가요?"
        return label
    }()
    let developBtView: DevelopBtView = {
        let developBtView = DevelopBtView()
        developBtView.layer.cornerRadius = 16
        developBtView.layer.borderWidth = 1
        developBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        return developBtView
    }()
    let hobbyBtView: HobbyBtView = {
        let hobbyBtView = HobbyBtView()
        hobbyBtView.layer.cornerRadius = 16
        hobbyBtView.layer.borderWidth = 1
        hobbyBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        return hobbyBtView
    }()
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        return button
    }()
    
    public init(meetingTitle: String, with reactor: InitializeCreateMeetingReactor) {
        self.meetingTitle = meetingTitle
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        setNavigationbar()
        layout()
    }
    
    private func setNavigationbar() {
        self.title = self.meetingTitle
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : Fonts.SH03Bold.font,
            .foregroundColor: UIColor.black
        ]
        self.backButton.tintColor = SharedDSKitAsset.Colors.black.color
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func layout(){
        [progressView,questionLabel,developBtView,hobbyBtView,nextButton]
            .forEach{ view.addSubview($0) }
        
        progressView.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        questionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(progressView.snp.bottom).offset(60)
        }
        
        developBtView.snp.makeConstraints { make in
            make.width.equalTo(159.5)
            make.height.equalTo(193)
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(questionLabel.snp.bottom).offset(40)
        }
        
        hobbyBtView.snp.makeConstraints { make in
            make.width.equalTo(159.5)
            make.height.equalTo(193)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(questionLabel.snp.bottom).offset(40)
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
        }
    }
}

extension InitializeCreateMeetingViewController{
    public func bind(reactor: InitializeCreateMeetingReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: InitializeCreateMeetingReactor) {
        backButton.rx.tap
            .map { Reactor.Action.backButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        nextButton.rx.tap
            .map { Reactor.Action.nextButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        developBtView.tapGesture.rx.event
            .map { _ in Reactor.Action.developButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        hobbyBtView.tapGesture.rx.event
            .map { _ in Reactor.Action.hobbyButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: InitializeCreateMeetingReactor) {
        reactor.state
            .map { $0.meetingType }
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] type in
                switch type {
                case .develop:
                    self?.nextButton.enableNextButton()
                    self?.developBtView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                    self?.hobbyBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                case .hobby:
                    self?.nextButton.enableNextButton()
                    self?.developBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    self?.hobbyBtView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                case .none:
                    self?.nextButton.disableNextButton()
                }
            })
            .disposed(by: disposeBag)
    }
}
