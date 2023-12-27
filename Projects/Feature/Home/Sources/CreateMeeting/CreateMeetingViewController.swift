import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Shared

public class CreateMeetingViewController: UIViewController{
    let disposeBag = DisposeBag()
<<<<<<< HEAD
<<<<<<< HEAD
    let meetingTitle: String
    let createMeetingViewModel: CreateMeetingViewModel
    let backButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconArrowLeft24.image, style: .plain, target: nil, action: nil)
    let progressView: UIProgressView = {
=======
=======
    let meetingTitle: String
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
    let createMeetingViewModel: CreateMeetingViewModel
    
    let backButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconArrowLeft24.image, style: .plain, target: nil, action: nil)
    
    lazy var progressView: UIProgressView = {
>>>>>>> 31ab288 ([FEAT] 모임 생성 첫 화면 개발)
        let progressView = UIProgressView()
        progressView.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        progressView.tintColor = .black
        progressView.progress = 1/3
        return progressView
    }()
<<<<<<< HEAD
    let questionLabel: UILabel = {
=======
    
    lazy var questionLabel: UILabel = {
>>>>>>> 31ab288 ([FEAT] 모임 생성 첫 화면 개발)
        let label = UILabel()
        label.font = Fonts.H02.font
        label.text = "어떤 모임을 만들고 싶으신가요?"
        return label
    }()
<<<<<<< HEAD
    let developBtView: DevelopBtView = {
=======
    
    lazy var developBtView: DevelopBtView = {
>>>>>>> 31ab288 ([FEAT] 모임 생성 첫 화면 개발)
        let developBtView = DevelopBtView()
        developBtView.layer.cornerRadius = 16
        developBtView.layer.borderWidth = 1
        developBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        return developBtView
    }()
<<<<<<< HEAD
    let hobbyBtView: HobbyBtView = {
=======
    
    lazy var hobbyBtView: HobbyBtView = {
>>>>>>> 31ab288 ([FEAT] 모임 생성 첫 화면 개발)
        let hobbyBtView = HobbyBtView()
        hobbyBtView.layer.cornerRadius = 16
        hobbyBtView.layer.borderWidth = 1
        hobbyBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        return hobbyBtView
    }()
<<<<<<< HEAD
    let nextButton: UIButton = {
=======
    
    lazy var nextButton: UIButton = {
>>>>>>> 31ab288 ([FEAT] 모임 생성 첫 화면 개발)
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        return button
    }()
    
    public init(meetingTitle: String, createMeetingViewModel: CreateMeetingViewModel) {
<<<<<<< HEAD
<<<<<<< HEAD
        self.meetingTitle = meetingTitle
        self.createMeetingViewModel = createMeetingViewModel
        super.init(nibName: nil, bundle: nil)
=======
        self.createMeetingViewModel = createMeetingViewModel
        super.init(nibName: nil, bundle: nil)
        self.titleLabel.text = meetingTitle
>>>>>>> 31ab288 ([FEAT] 모임 생성 첫 화면 개발)
=======
        self.meetingTitle = meetingTitle
        self.createMeetingViewModel = createMeetingViewModel
        super.init(nibName: nil, bundle: nil)
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        
        self.view.backgroundColor = .white
        setNavigationbar()
=======
        self.view.backgroundColor = .white
<<<<<<< HEAD
        
>>>>>>> 31ab288 ([FEAT] 모임 생성 첫 화면 개발)
=======
        setNavigationbar()
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
            .bind(to: createMeetingViewModel.backButtonTapped)
            .disposed(by: disposeBag)
        
        createMeetingViewModel.backButtonTapped
            .bind(onNext: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        
        nextButton.rx.tap
            .bind(to: createMeetingViewModel.nextButtonTapped)
            .disposed(by: disposeBag)
        
        createMeetingViewModel.nextButtonTapped
            .bind(onNext: { [weak self] in
                switch self?.createMeetingViewModel.meetingTypeRelay.value {
                case .develop:
<<<<<<< HEAD
<<<<<<< HEAD
                    self?.navigationController?.pushViewController(SelectDevelopDetailsViewController(meetingTitle: self?.meetingTitle ?? "모임 생성", selectDevelopDetailsViewModel: SelectDevelopDetailsViewModel()), animated: true)
                case .hobby:
                    self?.navigationController?.pushViewController(SelectHobbyDetailsViewController(meetingTitle: self?.meetingTitle ?? "모임 생성", selectHobbyDetailsViewModel: SelectHobbyDetailsViewModel()), animated: true)
=======
                    self?.navigateToSelectDevelopDetailsVC()
                case .hobby:
                    break
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
=======
                    self?.navigationController?.pushViewController(SelectDevelopDetailsViewController(meetingTitle: self?.meetingTitle ?? "모임 생성", selectDevelopDetailsViewModel: SelectDevelopDetailsViewModel()), animated: true)
                case .hobby:
                    self?.navigationController?.pushViewController(SelectHobbyDetailsViewController(meetingTitle: self?.meetingTitle ?? "모임 생성", selectHobbyDetailsViewModel: SelectHobbyDetailsViewModel()), animated: true)
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
        
<<<<<<< HEAD
=======
    private func bind(){
>>>>>>> 31ab288 ([FEAT] 모임 생성 첫 화면 개발)
=======
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
        developBtView.tapGesture.rx.event
            .map { _ in Void() }
            .bind(to: createMeetingViewModel.developBtViewTapped)
            .disposed(by: disposeBag)
        
        hobbyBtView.tapGesture.rx.event
            .map { _ in Void() }
            .bind(to: createMeetingViewModel.hobbyBtViewTapped)
            .disposed(by: disposeBag)
        
        createMeetingViewModel.meetingTypeRelay
            .subscribe(onNext: { [weak self] type in
                switch type {
                case .develop:
<<<<<<< HEAD
<<<<<<< HEAD
                    self?.nextButton.enableNextButton()
                    self?.developBtView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                    self?.hobbyBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                case .hobby:
                    self?.nextButton.enableNextButton()
                    self?.developBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    self?.hobbyBtView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                case .none:
                    self?.nextButton.disableNextButton()
=======
                    self?.nextButton.setTitleColor(.white, for: .normal)
                    self?.nextButton.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                    self?.nextButton.isEnabled = true
                    self?.nextButton.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
=======
                    self?.enabledNextButton()
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
                    self?.developBtView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                    self?.hobbyBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                case .hobby:
                    self?.enabledNextButton()
                    self?.developBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    self?.hobbyBtView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                case .none:
<<<<<<< HEAD
                    self?.nextButton.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
                    self?.nextButton.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    self?.nextButton.isEnabled = false
                    self?.nextButton.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
>>>>>>> 31ab288 ([FEAT] 모임 생성 첫 화면 개발)
=======
                    self?.disabledNextButton()
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
                    self?.developBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    self?.hobbyBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                }
            })
            .disposed(by: disposeBag)
<<<<<<< HEAD
    }
    
    private func layout(){
        [progressView,questionLabel,developBtView,hobbyBtView,nextButton]
            .forEach{ view.addSubview($0) }
=======
        
    }
    
    private func layout(){
        [progressView,questionLabel,developBtView,hobbyBtView,nextButton]
            .forEach{ view.addSubview($0) }
<<<<<<< HEAD
                
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            make.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.centerY.equalTo(titleLabel)
            make.leading.equalToSuperview().offset(20)
        }
>>>>>>> 31ab288 ([FEAT] 모임 생성 첫 화면 개발)
=======
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
        
        progressView.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.leading.trailing.equalToSuperview()
<<<<<<< HEAD
<<<<<<< HEAD
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
=======
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
>>>>>>> 31ab288 ([FEAT] 모임 생성 첫 화면 개발)
=======
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
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
<<<<<<< HEAD
<<<<<<< HEAD
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
        }
=======
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(8)
=======
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
        }
        
>>>>>>> 31ab288 ([FEAT] 모임 생성 첫 화면 개발)
    }
    
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
    
}
