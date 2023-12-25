import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Shared

public class SelectDevelopDetailsViewController: UIViewController{
    let disposeBag = DisposeBag()
    let selectDevelopDetailsViewModel: SelectDevelopDetailsViewModel
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.SH03Bold.font
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
        progressView.progress = 2/3
        return progressView
    }()
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.H02.font
        label.text = "세부항목을 선택해주세요 :)"
        return label
    }()
    
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
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        return button
    }()
    
    public init(meetingTitle: String, selectDevelopDetailsViewModel: SelectDevelopDetailsViewModel) {
        self.selectDevelopDetailsViewModel = selectDevelopDetailsViewModel
        super.init(nibName: nil, bundle: nil)
        self.titleLabel.text = meetingTitle
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
                    self?.enabledNextButton()
                    self?.studyBtView.borderView.isHidden = false
                    self?.sideProjectBtView.borderView.isHidden = true
                    self?.jobChangeBtView.borderView.isHidden = true
                    self?.languageBtView.borderView.isHidden = true
                    self?.investmentBtView.borderView.isHidden = true
                    self?.etcBtView.borderView.isHidden = true
                case .sideProject:
                    self?.enabledNextButton()
                    self?.studyBtView.borderView.isHidden = true
                    self?.sideProjectBtView.borderView.isHidden = false
                    self?.jobChangeBtView.borderView.isHidden = true
                    self?.languageBtView.borderView.isHidden = true
                    self?.investmentBtView.borderView.isHidden = true
                    self?.etcBtView.borderView.isHidden = true
                case .jobChange:
                    self?.enabledNextButton()
                    self?.studyBtView.borderView.isHidden = true
                    self?.sideProjectBtView.borderView.isHidden = true
                    self?.jobChangeBtView.borderView.isHidden = false
                    self?.languageBtView.borderView.isHidden = true
                    self?.investmentBtView.borderView.isHidden = true
                    self?.etcBtView.borderView.isHidden = true
                case .language:
                    self?.enabledNextButton()
                    self?.studyBtView.borderView.isHidden = true
                    self?.sideProjectBtView.borderView.isHidden = true
                    self?.jobChangeBtView.borderView.isHidden = true
                    self?.languageBtView.borderView.isHidden = false
                    self?.investmentBtView.borderView.isHidden = true
                    self?.etcBtView.borderView.isHidden = true
                case .investment:
                    self?.enabledNextButton()
                    self?.studyBtView.borderView.isHidden = true
                    self?.sideProjectBtView.borderView.isHidden = true
                    self?.jobChangeBtView.borderView.isHidden = true
                    self?.languageBtView.borderView.isHidden = true
                    self?.investmentBtView.borderView.isHidden = false
                    self?.etcBtView.borderView.isHidden = true
                case .etc:
                    self?.enabledNextButton()
                    self?.studyBtView.borderView.isHidden = true
                    self?.sideProjectBtView.borderView.isHidden = true
                    self?.jobChangeBtView.borderView.isHidden = true
                    self?.languageBtView.borderView.isHidden = true
                    self?.investmentBtView.borderView.isHidden = true
                    self?.etcBtView.borderView.isHidden = false
                case .none:
                    self?.disabledNextButton()
                }
            })
            .disposed(by: disposeBag)
        
    }
    
    private func layout(){
        [titleLabel,backButton,progressView,questionLabel,studyBtView,sideProjectBtView,jobChangeBtView,languageBtView,investmentBtView,etcBtView,nextButton]
            .forEach{ self.view.addSubview($0) }
        
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
    
}
