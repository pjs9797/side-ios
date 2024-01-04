import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Shared

public class SelectDevelopDetailsViewController: UIViewController{
    let disposeBag = DisposeBag()
    let meetingTitle: String
    let selectDevelopDetailsViewModel: SelectDevelopDetailsViewModel
    var selectedDevelopDetail: String = ""
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
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        return button
    }()
    
    public init(meetingTitle: String, selectDevelopDetailsViewModel: SelectDevelopDetailsViewModel) {
        self.meetingTitle = meetingTitle
        self.selectDevelopDetailsViewModel = selectDevelopDetailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setNavigationbar()
        bind()
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
    
    private func bind(){
        backButton.rx.tap
            .bind(to: selectDevelopDetailsViewModel.backButtonTapped)
            .disposed(by: disposeBag)
        
        selectDevelopDetailsViewModel.backButtonTapped
            .bind(onNext: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        
        nextButton.rx.tap
            .bind(to: selectDevelopDetailsViewModel.nextButtonTapped)
            .disposed(by: disposeBag)
        
        selectDevelopDetailsViewModel.nextButtonTapped
            .bind(onNext: { [weak self] in
                self?.navigationController?.pushViewController(CreateMeetingContentViewController(meetingTitle: "원데이 모임 생성", createMeetingContentViewModel: CreateMeetingContentViewModel(), createMeetingPeriodViewModel: CreateMeetingPeriodViewModel()), animated: true)
            })
            .disposed(by: disposeBag)

        studyBtView.tapGesture.rx.event
            .map { _ in Void() }
            .bind(to: selectDevelopDetailsViewModel.studyBtViewTapped)
            .disposed(by: disposeBag)
        
        sideProjectBtView.tapGesture.rx.event
            .map { _ in Void() }
            .bind(to: selectDevelopDetailsViewModel.sideProjectBtViewTapped)
            .disposed(by: disposeBag)
        
        jobChangeBtView.tapGesture.rx.event
            .map { _ in Void() }
            .bind(to: selectDevelopDetailsViewModel.jobChangeBtViewTapped)
            .disposed(by: disposeBag)
        
        languageBtView.tapGesture.rx.event
            .map { _ in Void() }
            .bind(to: selectDevelopDetailsViewModel.languageBtViewTapped)
            .disposed(by: disposeBag)
        
        investmentBtView.tapGesture.rx.event
            .map { _ in Void() }
            .bind(to: selectDevelopDetailsViewModel.investmentBtViewTapped)
            .disposed(by: disposeBag)
        
        etcBtView.tapGesture.rx.event
            .map { _ in Void() }
            .bind(to: selectDevelopDetailsViewModel.etcBtViewTapped)
            .disposed(by: disposeBag)
        
        selectDevelopDetailsViewModel.developDetailTypeRelay
            .subscribe(onNext: { [weak self] type in
                switch type {
                case .study:
                    self?.nextButton.enableNextButton()
                    self?.selectedDevelopDetail = "스터디"
                    self?.studyBtView.borderView.isHidden = false
                    self?.sideProjectBtView.borderView.isHidden = true
                    self?.jobChangeBtView.borderView.isHidden = true
                    self?.languageBtView.borderView.isHidden = true
                    self?.investmentBtView.borderView.isHidden = true
                    self?.etcBtView.borderView.isHidden = true
                case .sideProject:
                    self?.nextButton.enableNextButton()
                    self?.selectedDevelopDetail = "사이드 프로젝트"
                    self?.studyBtView.borderView.isHidden = true
                    self?.sideProjectBtView.borderView.isHidden = false
                    self?.jobChangeBtView.borderView.isHidden = true
                    self?.languageBtView.borderView.isHidden = true
                    self?.investmentBtView.borderView.isHidden = true
                    self?.etcBtView.borderView.isHidden = true
                case .jobChange:
                    self?.nextButton.enableNextButton()
                    self?.selectedDevelopDetail = "이직 준비"
                    self?.studyBtView.borderView.isHidden = true
                    self?.sideProjectBtView.borderView.isHidden = true
                    self?.jobChangeBtView.borderView.isHidden = false
                    self?.languageBtView.borderView.isHidden = true
                    self?.investmentBtView.borderView.isHidden = true
                    self?.etcBtView.borderView.isHidden = true
                case .language:
                    self?.nextButton.enableNextButton()
                    self?.selectedDevelopDetail = "어학"
                    self?.studyBtView.borderView.isHidden = true
                    self?.sideProjectBtView.borderView.isHidden = true
                    self?.jobChangeBtView.borderView.isHidden = true
                    self?.languageBtView.borderView.isHidden = false
                    self?.investmentBtView.borderView.isHidden = true
                    self?.etcBtView.borderView.isHidden = true
                case .investment:
                    self?.nextButton.enableNextButton()
                    self?.selectedDevelopDetail = "재테크"
                    self?.studyBtView.borderView.isHidden = true
                    self?.sideProjectBtView.borderView.isHidden = true
                    self?.jobChangeBtView.borderView.isHidden = true
                    self?.languageBtView.borderView.isHidden = true
                    self?.investmentBtView.borderView.isHidden = false
                    self?.etcBtView.borderView.isHidden = true
                case .etc:
                    self?.nextButton.enableNextButton()
                    self?.selectedDevelopDetail = "기타"
                    self?.studyBtView.borderView.isHidden = true
                    self?.sideProjectBtView.borderView.isHidden = true
                    self?.jobChangeBtView.borderView.isHidden = true
                    self?.languageBtView.borderView.isHidden = true
                    self?.investmentBtView.borderView.isHidden = true
                    self?.etcBtView.borderView.isHidden = false
                case .none:
                    self?.nextButton.disableNextButton()
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func layout(){
        [progressView,questionLabel,studyBtView,sideProjectBtView,jobChangeBtView,languageBtView,investmentBtView,etcBtView,nextButton]
            .forEach{ self.view.addSubview($0) }
        
        progressView.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        questionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(progressView.snp.bottom).offset(60)
        }
        
        studyBtView.snp.makeConstraints { make in
            make.width.equalTo(98.3)
            make.height.equalTo(104)
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(questionLabel.snp.bottom).offset(40)
        }
        
        sideProjectBtView.snp.makeConstraints { make in
            make.width.equalTo(98.3)
            make.height.equalTo(104)
            make.leading.equalTo(studyBtView.snp.trailing).offset(20)
            make.top.equalTo(questionLabel.snp.bottom).offset(40)
        }
        
        jobChangeBtView.snp.makeConstraints { make in
            make.width.equalTo(98.3)
            make.height.equalTo(104)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(questionLabel.snp.bottom).offset(40)
        }
        
        languageBtView.snp.makeConstraints { make in
            make.width.equalTo(98.3)
            make.height.equalTo(104)
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(studyBtView.snp.bottom).offset(32)
        }
        
        investmentBtView.snp.makeConstraints { make in
            make.width.equalTo(98.3)
            make.height.equalTo(104)
            make.leading.equalTo(languageBtView.snp.trailing).offset(20)
            make.top.equalTo(studyBtView.snp.bottom).offset(32)
        }
        
        etcBtView.snp.makeConstraints { make in
            make.width.equalTo(98.3)
            make.height.equalTo(104)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(studyBtView.snp.bottom).offset(32)
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
        }
    }
}
