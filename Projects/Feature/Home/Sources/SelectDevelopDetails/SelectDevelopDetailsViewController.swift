import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Shared

public class SelectDevelopDetailsViewController: UIViewController, ReactorKit.View{
    public var disposeBag = DisposeBag()
    var meetingTitle: String
    let backButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconArrowLeft24.image, style: .plain, target: nil, action: nil)
    let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        progressView.tintColor = .black
        progressView.progress = 2/3
        return progressView
    }()
    let questionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.H02.font
        label.text = "세부항목을 선택해주세요 :)"
        return label
    }()
    let studyBtView = StudyBtView()
    let sideProjectBtView = SideProjectBtView()
    let jobChangeBtView = JobChangeBtView()
    let languageBtView = LanguageBtView()
    let investmentBtView = InvestmentBtView()
    let etcBtView = EtcBtView()
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.layer.cornerRadius = 16*Constants.standardHeight
        button.layer.borderWidth = 1
        return button
    }()
    
    public init(meetingTitle: String, with reactor: SelectDevelopDetailsReactor) {
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
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : Fonts.SH03Bold.font,
            .foregroundColor: UIColor.black
        ]
        self.backButton.tintColor = SharedDSKitAsset.Colors.black.color
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func layout(){
        [progressView,questionLabel,studyBtView,sideProjectBtView,jobChangeBtView,languageBtView,investmentBtView,etcBtView,nextButton]
            .forEach{ self.view.addSubview($0) }
        
        progressView.snp.makeConstraints { make in
            make.height.equalTo(2*Constants.standardHeight)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        questionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.top.equalTo(progressView.snp.bottom).offset(60*Constants.standardHeight)
        }
        
        studyBtView.snp.makeConstraints { make in
            make.width.equalTo(98.3*Constants.standardWidth)
            make.height.equalTo(104*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.top.equalTo(questionLabel.snp.bottom).offset(40*Constants.standardHeight)
        }
        
        sideProjectBtView.snp.makeConstraints { make in
            make.width.equalTo(98.3*Constants.standardWidth)
            make.height.equalTo(104*Constants.standardHeight)
            make.leading.equalTo(studyBtView.snp.trailing).offset(20*Constants.standardWidth)
            make.top.equalTo(questionLabel.snp.bottom).offset(40*Constants.standardHeight)
        }
        
        jobChangeBtView.snp.makeConstraints { make in
            make.width.equalTo(98.3*Constants.standardWidth)
            make.height.equalTo(104*Constants.standardHeight)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(questionLabel.snp.bottom).offset(40*Constants.standardHeight)
        }
        
        languageBtView.snp.makeConstraints { make in
            make.width.equalTo(98.3*Constants.standardWidth)
            make.height.equalTo(104*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.top.equalTo(studyBtView.snp.bottom).offset(32*Constants.standardHeight)
        }
        
        investmentBtView.snp.makeConstraints { make in
            make.width.equalTo(98.3*Constants.standardWidth)
            make.height.equalTo(104*Constants.standardHeight)
            make.leading.equalTo(languageBtView.snp.trailing).offset(20*Constants.standardWidth)
            make.top.equalTo(studyBtView.snp.bottom).offset(32*Constants.standardHeight)
        }
        
        etcBtView.snp.makeConstraints { make in
            make.width.equalTo(98.3*Constants.standardWidth)
            make.height.equalTo(104*Constants.standardHeight)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(studyBtView.snp.bottom).offset(32*Constants.standardHeight)
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.equalTo(335*Constants.standardWidth)
            make.height.equalTo(52*Constants.standardHeight)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8*Constants.standardHeight)
        }
    }
}

extension SelectDevelopDetailsViewController{
    public func bind(reactor: SelectDevelopDetailsReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: SelectDevelopDetailsReactor) {
        backButton.rx.tap
            .map { Reactor.Action.backButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        nextButton.rx.tap
            .map { Reactor.Action.nextButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        studyBtView.tapGesture.rx.event
            .map { _ in Reactor.Action.detailTypeSelected(.study) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        sideProjectBtView.tapGesture.rx.event
            .map { _ in Reactor.Action.detailTypeSelected(.sideProject) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        jobChangeBtView.tapGesture.rx.event
            .map { _ in Reactor.Action.detailTypeSelected(.jobChange) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        languageBtView.tapGesture.rx.event
            .map { _ in Reactor.Action.detailTypeSelected(.language) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        investmentBtView.tapGesture.rx.event
            .map { _ in Reactor.Action.detailTypeSelected(.investment) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        etcBtView.tapGesture.rx.event
            .map { _ in Reactor.Action.detailTypeSelected(.etc) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: SelectDevelopDetailsReactor) {
        reactor.state
            .map { $0.selectedDetailType }
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] type in
                self?.updateUI(for: type)
            })
            .disposed(by: disposeBag)
    }
    
    private func updateUI(for type: DevelopDetailType) {
        studyBtView.borderView.isHidden = true
        sideProjectBtView.borderView.isHidden = true
        jobChangeBtView.borderView.isHidden = true
        languageBtView.borderView.isHidden = true
        investmentBtView.borderView.isHidden = true
        etcBtView.borderView.isHidden = true

        switch type {
        case .study:
            self.nextButton.enableNextButton()
            studyBtView.borderView.isHidden = false
        case .sideProject:
            self.nextButton.enableNextButton()
            sideProjectBtView.borderView.isHidden = false
        case .jobChange:
            self.nextButton.enableNextButton()
            jobChangeBtView.borderView.isHidden = false
        case .language:
            self.nextButton.enableNextButton()
            languageBtView.borderView.isHidden = false
        case .investment:
            self.nextButton.enableNextButton()
            investmentBtView.borderView.isHidden = false
        case .etc:
            self.nextButton.enableNextButton()
            etcBtView.borderView.isHidden = false
        case .none:
            self.nextButton.disableNextButton()
        }
    }
}
