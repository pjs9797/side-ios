import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Shared

public class CreateMeetingViewController: UIViewController{
    let disposeBag = DisposeBag()
    let meetingTitle: String
    let createMeetingViewModel: CreateMeetingViewModel
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.SH03Bold.font
        label.text = self.meetingTitle
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconArrowLeft24.image, for: .normal)
        return button
    }()
    
    lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        progressView.tintColor = .black
        progressView.progress = 1/3
        return progressView
    }()
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.H02.font
        label.text = "어떤 모임을 만들고 싶으신가요?"
        return label
    }()
    
    lazy var developBtView: DevelopBtView = {
        let developBtView = DevelopBtView()
        developBtView.layer.cornerRadius = 16
        developBtView.layer.borderWidth = 1
        developBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        return developBtView
    }()
    
    lazy var hobbyBtView: HobbyBtView = {
        let hobbyBtView = HobbyBtView()
        hobbyBtView.layer.cornerRadius = 16
        hobbyBtView.layer.borderWidth = 1
        hobbyBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        return hobbyBtView
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        return button
    }()
    
    public init(meetingTitle: String, createMeetingViewModel: CreateMeetingViewModel) {
        self.meetingTitle = meetingTitle
        self.createMeetingViewModel = createMeetingViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        bind()
        layout()
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
                    self?.navigateToSelectDevelopDetailsVC()
                case .hobby:
                    break
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
        
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
                    self?.enabledNextButton()
                    self?.developBtView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                    self?.hobbyBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                case .hobby:
                    self?.enabledNextButton()
                    self?.developBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    self?.hobbyBtView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                case .none:
                    self?.disabledNextButton()
                    self?.developBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    self?.hobbyBtView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                }
            })
            .disposed(by: disposeBag)
        
    }
    
    private func layout(){
        [titleLabel,backButton,progressView,questionLabel,developBtView,hobbyBtView,nextButton]
            .forEach{ view.addSubview($0) }
                
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            make.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.centerY.equalTo(titleLabel)
            make.leading.equalToSuperview().offset(20)
        }
        
        progressView.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
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
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(8)
        }
        
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
    
    private func navigateToSelectDevelopDetailsVC(){
        self.navigationController?.pushViewController(SelectDevelopDetailsViewController(meetingTitle: self.meetingTitle, selectDevelopDetailsViewModel: SelectDevelopDetailsViewModel()), animated: true)
    }
    
}