import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Shared

public class SelectHobbyDetailsViewController: UIViewController, ReactorKit.View{
    public var disposeBag = DisposeBag()
    let meetingTitle: String
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
        button.layer.cornerRadius = 16*Constants.standardHeight
        button.layer.borderWidth = 1
        return button
    }()
    
    public init(meetingTitle: String, with reactor: SelectHobbyDetailsReactor) {
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
        self.nextButton.disableNextButton()
        layout()
        bindAfterLayout()
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
        self.view.addSubview(progressView)
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [questionLabel,hobbyDetailTableView,nextButton]
            .forEach{ contentView.addSubview($0) }
        
        progressView.snp.makeConstraints { make in
            make.height.equalTo(2*Constants.standardHeight)
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
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.top.equalToSuperview().offset(60*Constants.standardHeight)
        }
        
        hobbyDetailTableView.snp.makeConstraints { make in
            make.height.equalTo(0)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(questionLabel.snp.bottom).offset(36*Constants.standardHeight)
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.equalTo(335*Constants.standardWidth)
            make.height.equalTo(52*Constants.standardHeight)
            make.centerX.equalToSuperview()
            make.top.equalTo(hobbyDetailTableView.snp.bottom).offset(56*Constants.standardHeight)
            make.bottom.equalToSuperview().offset(-8*Constants.standardHeight)
        }
    }
}

extension SelectHobbyDetailsViewController{
    public func bind(reactor: SelectHobbyDetailsReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: SelectHobbyDetailsReactor){
        backButton.rx.tap
            .map{ Reactor.Action.backButtonTapped}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        nextButton.rx.tap
            .map{ Reactor.Action.nextButtonTapped}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        hobbyDetailTableView.rx.observe(CGSize.self, "contentSize")
            .compactMap { $0 }
            .map(Reactor.Action.updateContentSize)
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: SelectHobbyDetailsReactor){
        reactor.state.map { $0.hobbyCellData }
            .take(1)
            .bind(to: hobbyDetailTableView.rx.items(cellIdentifier: "HobbyDetailTableViewCell", cellType: HobbyDetailTableViewCell.self)){ [weak self] row, data, cell in
                guard let self = self else { return }
                let indexPath = IndexPath(row: row, section: 0)
                let cellReactor = HobbyDetailTableViewCellReactor(hobbyModel: data, tableViewIndexPath: indexPath)
                cell.reactor = cellReactor

                cell.hobbyDetailCollectionView.rx.itemSelected
                    .map { indexPath in
                        guard let tableCellIndexPath = self.hobbyDetailTableView.indexPath(for: cell) else { return HobbyDetailTableViewCellReactor.Action.none }
                        
                        return HobbyDetailTableViewCellReactor.Action.selectCollectionViewItem(tableViewIndexPath: tableCellIndexPath, collectionViewIndexPath: indexPath)
                    }
                    .bind(to: cellReactor.action)
                    .disposed(by: cell.disposeBag)
                
                cell.hobbyDetailCollectionView.rx.itemSelected
                    .map { indexPath in
                        let categoryMajor = reactor.currentState.hobbyCellData[row].title
                        let categorySub = reactor.currentState.hobbyCellData[row].hobbyDetailModel[indexPath.row].title
                        return Reactor.Action.selectItem(categoryMajor, categorySub)
                    }
                    .bind(to: reactor.action)
                    .disposed(by: self.disposeBag)
                
                cellReactor.state.map{ $0.currentCollectionViewIndexPath }
                    .bind(onNext: { selectionInfo in
                        if let selectionInfo = selectionInfo {
                            for cell in self.hobbyDetailTableView.visibleCells as? [HobbyDetailTableViewCell] ?? [] {
                                if selectionInfo.tableViewIndexPath != self.hobbyDetailTableView.indexPath(for: cell){
                                    for collectionViewCell in cell.hobbyDetailCollectionView.visibleCells as? [HobbyDetailCollectionViewCell] ?? [] {
                                        collectionViewCell.setSelectedState(isSelected: false)
                                    }
                                }
                            }
                        }
                    })
                    .disposed(by: cell.disposeBag)
                
                cellReactor.state.map { $0.collectionViewHeight}
                    .distinctUntilChanged()
                    .bind(onNext: { _ in
                        self.hobbyDetailTableView.beginUpdates()
                        self.hobbyDetailTableView.endUpdates()
                    })
                    .disposed(by: cell.disposeBag)
            }
            .disposed(by: disposeBag)
        
        reactor.state.map{ $0.enableNextButton }
            .filter{ $0 }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] _ in
                self?.nextButton.enableNextButton()
            })
            .disposed(by: disposeBag)
    }
    
    private func bindAfterLayout(){
        self.reactor?.state.map { $0.contentSize }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] size in
                self?.hobbyDetailTableView.snp.updateConstraints { make in
                    make.height.equalTo(size.height*Constants.standardHeight)
                }
            })
            .disposed(by: disposeBag)
    }
}
