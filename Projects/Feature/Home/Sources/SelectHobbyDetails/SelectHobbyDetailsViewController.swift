import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Shared

public class SelectHobbyDetailsViewController: UIViewController{
    let disposeBag = DisposeBag()
    let meetingTitle: String
    let selectHobbyDetailsViewModel: SelectHobbyDetailsViewModel
    let backButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconArrowLeft24.image, style: .plain, target: nil, action: nil)
    let scrollView = UIScrollView()
    let contentView = UIView()
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
    lazy var hobbyDetailTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(HobbyDetailTableViewCell.self, forCellReuseIdentifier: "HobbyDetailTableViewCell")
        return tableView
    }()
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        return button
    }()
    
    public init(meetingTitle: String, selectHobbyDetailsViewModel: SelectHobbyDetailsViewModel) {
        self.meetingTitle = meetingTitle
        self.selectHobbyDetailsViewModel = selectHobbyDetailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setNavigationbar()
        self.nextButton.disableNextButton()
        layout()
        bind()
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
    
    private func bind(){
        backButton.rx.tap
            .bind(to: selectHobbyDetailsViewModel.backButtonTapped)
            .disposed(by: disposeBag)
        
        selectHobbyDetailsViewModel.backButtonTapped
            .bind(onNext: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        
        nextButton.rx.tap
            .bind(to: selectHobbyDetailsViewModel.nextButtonTapped)
            .disposed(by: disposeBag)
        
        selectHobbyDetailsViewModel.nextButtonTapped
            .bind(onNext: { [weak self] in
//                let meetingRegionViewModel = MeetingRegionViewModel()
//                let createMeetingPeriodViewModel = CreateMeetingPeriodViewModel()
//                self?.navigationController?.pushViewController(CreateMeetingContentViewController(meetingTitle: self!.meetingTitle, meetingRegionViewModel: meetingRegionViewModel, createMeetingContentViewModel: CreateMeetingContentViewModel(meetingRegionViewModel: meetingRegionViewModel, createMeetingPeriodViewModel: createMeetingPeriodViewModel), createMeetingPeriodViewModel: createMeetingPeriodViewModel), animated: true)
            })
            .disposed(by: disposeBag)
        
        selectHobbyDetailsViewModel.hobbyDetailTableViewCellData
            .drive(hobbyDetailTableView.rx.items(cellIdentifier: "HobbyDetailTableViewCell", cellType: HobbyDetailTableViewCell.self)){ row, data, cell in
                
                cell.heightDidChange
                    .bind(onNext: { [weak self] in
                        self?.hobbyDetailTableView.beginUpdates()
                        self?.hobbyDetailTableView.endUpdates()
                    })
                    .disposed(by: cell.disposeBag)
                
                cell.hobbyDetailCollectionView.rx.itemSelected
                    .bind { [weak self, weak cell] indexPath in
                        guard let tableCellIndexPath = self?.hobbyDetailTableView.indexPath(for: cell!) else { return }
                        SharedSelectHobbyState.shared.selectedIndexPath.accept((tableCellIndexPath: tableCellIndexPath, collectionViewIndexPath: indexPath))
                        cell?.updateBorderViews(selectedIndexPath: indexPath)
                        if let selectedCell = cell?.hobbyDetailCollectionView.cellForItem(at: indexPath) as? HobbyDetailCollectionViewCell {
                            self?.nextButton.enableNextButton()
                        }
                    }
                    .disposed(by: cell.disposeBag)

                cell.myIndexPath = IndexPath(row: row, section: 0)
                cell.configure(model: data)
                
            }
            .disposed(by: disposeBag)
        
        hobbyDetailTableView.rx.observe(CGSize.self, "contentSize")
            .subscribe(onNext: { [weak self] size in
                if let size = size {
                    self?.hobbyDetailTableView.snp.updateConstraints { make in
                        make.height.equalTo(size.height)
                    }
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func layout(){
        self.view.addSubview(progressView)
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [questionLabel,nextButton,hobbyDetailTableView]
            .forEach{ contentView.addSubview($0) }
        
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
        
        questionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(60)
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
        
        hobbyDetailTableView.snp.makeConstraints { make in
            make.height.equalTo(1000)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(questionLabel.snp.bottom).offset(36)
            make.bottom.equalTo(nextButton.snp.top).offset(-36)
        }
    }
}
