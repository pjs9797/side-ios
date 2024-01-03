import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Shared

public class SelectDevelopDetailsViewController: UIViewController{
    let disposeBag = DisposeBag()
<<<<<<< HEAD
<<<<<<< HEAD
    let meetingTitle: String
    let selectDevelopDetailsViewModel: SelectDevelopDetailsViewModel
    var selectedDevelopDetail: String = ""
    let backButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconArrowLeft24.image, style: .plain, target: nil, action: nil)
    let progressView: UIProgressView = {
=======
=======
    let meetingTitle: String
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
    let selectDevelopDetailsViewModel: SelectDevelopDetailsViewModel
    var selectedDevelopDetail: String = ""
    
    let backButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconArrowLeft24.image, style: .plain, target: nil, action: nil)
    
    lazy var progressView: UIProgressView = {
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
        let progressView = UIProgressView()
        progressView.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        progressView.tintColor = .black
        progressView.progress = 2/3
        return progressView
    }()
<<<<<<< HEAD
    let questionLabel: UILabel = {
=======
    
    lazy var questionLabel: UILabel = {
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
        let label = UILabel()
        label.font = Fonts.H02.font
        label.text = "세부항목을 선택해주세요 :)"
        return label
    }()
<<<<<<< HEAD
    let studyBtView = StudyBtView()
    let sideProjectBtView = SideProjectBtView()
    let jobChangeBtView = JobChangeBtView()
    let languageBtView = LanguageBtView()
    let investmentBtView = InvestmentBtView()
    let etcBtView = EtcBtView()
    let nextButton: UIButton = {
=======
    
    lazy var studyBtView: StudyBtView = {
        let studyBtView = StudyBtView()
        
        return studyBtView
    }()
    
    lazy var sideProjectBtView: SideProjectBtView = {
        let sideProjectBtView = SideProjectBtView()
        
        return sideProjectBtView
    }()
    
    lazy var jobChangeBtView: JobChangeBtView = {
        let jobChangeBtView = JobChangeBtView()
        
        return jobChangeBtView
    }()
    
    lazy var languageBtView: LanguageBtView = {
        let languageBtView = LanguageBtView()
        
        return languageBtView
    }()
    
    lazy var investmentBtView: InvestmentBtView = {
        let investmentBtView = InvestmentBtView()
        
        return investmentBtView
    }()
    
    lazy var etcBtView: EtcBtView = {
        let etcBtView = EtcBtView()
        
        return etcBtView
    }()
    
<<<<<<< HEAD
    lazy var nextButton: UIButton = {
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
=======
    let nextButton: UIButton = {
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        return button
    }()
    
    public init(meetingTitle: String, selectDevelopDetailsViewModel: SelectDevelopDetailsViewModel) {
<<<<<<< HEAD
<<<<<<< HEAD
        self.meetingTitle = meetingTitle
        self.selectDevelopDetailsViewModel = selectDevelopDetailsViewModel
        super.init(nibName: nil, bundle: nil)
=======
        self.selectDevelopDetailsViewModel = selectDevelopDetailsViewModel
        super.init(nibName: nil, bundle: nil)
        self.titleLabel.text = meetingTitle
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
=======
        self.meetingTitle = meetingTitle
        self.selectDevelopDetailsViewModel = selectDevelopDetailsViewModel
        super.init(nibName: nil, bundle: nil)
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        
        self.view.backgroundColor = .white
        setNavigationbar()
<<<<<<< HEAD
=======
        self.view.backgroundColor = .white
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
=======
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
        bind()
        layout()
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
    private func setNavigationbar() {
        self.title = self.meetingTitle
        self.tabBarController?.tabBar.isHidden = true
<<<<<<< HEAD
=======
    private func setNavigationbar() {
        self.title = self.meetingTitle
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
=======
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : Fonts.SH03Bold.font,
            .foregroundColor: UIColor.black
        ]
<<<<<<< HEAD
=======
        
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                self?.navigationController?.pushViewController(CreateMeetingContentViewController(meetingTitle: self!.meetingTitle, createMeetingContentViewModel: CreateMeetingContentViewModel()), animated: true)
=======
                self?.navigationController?.pushViewController(CreateMeetingContentViewController(meetingTitle: "원데이 모임 생성", createMeetingContentViewModel: CreateMeetingContentViewModel(), createMeetingPeriodViewModel: CreateMeetingPeriodViewModel()), animated: true)
>>>>>>> 10657f1 ([FEAT] 모임 생성 타입 결정 화면 present 애니메이션 개발)
            })
            .disposed(by: disposeBag)
        
=======
    private func bind(){
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
=======
                self?.navigationController?.pushViewController(CreatingGatheringViewController(), animated: true)
=======
                //self?.navigationController?.pushViewController(CreatingGatheringViewController(), animated: true)
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
            })
            .disposed(by: disposeBag)
        
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
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
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
                    self?.nextButton.enableNextButton()
                    self?.selectedDevelopDetail = "스터디"
=======
                    self?.enabledNextButton()
<<<<<<< HEAD
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
=======
                    self?.selectedDevelopDetail = "스터디"
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
                    self?.studyBtView.borderView.isHidden = false
                    self?.sideProjectBtView.borderView.isHidden = true
                    self?.jobChangeBtView.borderView.isHidden = true
                    self?.languageBtView.borderView.isHidden = true
                    self?.investmentBtView.borderView.isHidden = true
                    self?.etcBtView.borderView.isHidden = true
                case .sideProject:
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
                    self?.nextButton.enableNextButton()
                    self?.selectedDevelopDetail = "사이드 프로젝트"
=======
                    self?.enabledNextButton()
<<<<<<< HEAD
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
=======
                    self?.selectedDevelopDetail = "사이드 프로젝트"
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
                    self?.studyBtView.borderView.isHidden = true
                    self?.sideProjectBtView.borderView.isHidden = false
                    self?.jobChangeBtView.borderView.isHidden = true
                    self?.languageBtView.borderView.isHidden = true
                    self?.investmentBtView.borderView.isHidden = true
                    self?.etcBtView.borderView.isHidden = true
                case .jobChange:
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
                    self?.nextButton.enableNextButton()
                    self?.selectedDevelopDetail = "이직 준비"
=======
                    self?.enabledNextButton()
<<<<<<< HEAD
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
=======
                    self?.selectedDevelopDetail = "이직 준비"
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
                    self?.studyBtView.borderView.isHidden = true
                    self?.sideProjectBtView.borderView.isHidden = true
                    self?.jobChangeBtView.borderView.isHidden = false
                    self?.languageBtView.borderView.isHidden = true
                    self?.investmentBtView.borderView.isHidden = true
                    self?.etcBtView.borderView.isHidden = true
                case .language:
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
                    self?.nextButton.enableNextButton()
                    self?.selectedDevelopDetail = "어학"
=======
                    self?.enabledNextButton()
<<<<<<< HEAD
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
=======
                    self?.selectedDevelopDetail = "어학"
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
                    self?.studyBtView.borderView.isHidden = true
                    self?.sideProjectBtView.borderView.isHidden = true
                    self?.jobChangeBtView.borderView.isHidden = true
                    self?.languageBtView.borderView.isHidden = false
                    self?.investmentBtView.borderView.isHidden = true
                    self?.etcBtView.borderView.isHidden = true
                case .investment:
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
                    self?.nextButton.enableNextButton()
                    self?.selectedDevelopDetail = "재테크"
=======
                    self?.enabledNextButton()
<<<<<<< HEAD
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
=======
                    self?.selectedDevelopDetail = "재테크"
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
                    self?.studyBtView.borderView.isHidden = true
                    self?.sideProjectBtView.borderView.isHidden = true
                    self?.jobChangeBtView.borderView.isHidden = true
                    self?.languageBtView.borderView.isHidden = true
                    self?.investmentBtView.borderView.isHidden = false
                    self?.etcBtView.borderView.isHidden = true
                case .etc:
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
                    self?.nextButton.enableNextButton()
                    self?.selectedDevelopDetail = "기타"
=======
                    self?.enabledNextButton()
<<<<<<< HEAD
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
=======
                    self?.selectedDevelopDetail = "기타"
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
                    self?.studyBtView.borderView.isHidden = true
                    self?.sideProjectBtView.borderView.isHidden = true
                    self?.jobChangeBtView.borderView.isHidden = true
                    self?.languageBtView.borderView.isHidden = true
                    self?.investmentBtView.borderView.isHidden = true
                    self?.etcBtView.borderView.isHidden = false
                case .none:
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
                    self?.disabledNextButton()
=======
                    self?.nextButton.disableNextButton()
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
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
<<<<<<< HEAD
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
=======
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
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
<<<<<<< HEAD
<<<<<<< HEAD
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
        }
    }
=======
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(8)
=======
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
        }
        
    }
<<<<<<< HEAD
    
    private func enabledNextButton(){
        self.nextButton.setTitleColor(.white, for: .normal)
        self.nextButton.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        self.nextButton.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
        self.nextButton.isEnabled = true
    }
    
    private func disabledNextButton(){
        self.nextButton.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
        self.nextButton.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        self.nextButton.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        self.nextButton.isEnabled = false
    }
    
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
}
