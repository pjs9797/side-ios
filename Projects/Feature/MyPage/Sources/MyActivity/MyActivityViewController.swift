import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Shared

class MyActivityViewController: UIViewController, ReactorKit.View{
    var disposeBag = DisposeBag()
    let backButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconArrowLeft24.image, style: .plain, target: nil, action: nil)
    let meetingLabel: UILabel = {
        let label = UILabel()
        label.text = "모임"
        label.font = Fonts.SH02Bold.font
        label.textColor = SharedDSKitAsset.Colors.green.color
        label.textAlignment = .center
        return label
    }()
    let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.green.color
        return view
    }()
    let scrollView = UIScrollView()
    let contentView = UIView()
    let myMeetingLabel: UILabel = {
        let label = UILabel()
        label.text = "내 모임"
        label.font = Fonts.SH03Bold.font
        return label
    }()
    let myMeetingTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.isScrollEnabled = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MeetingTableViewCell.self, forCellReuseIdentifier: "MeetingTableViewCell")
        return tableView
    }()
    let bookmarkMeetingLabel: UILabel = {
        let label = UILabel()
        label.text = "찜한 모임"
        label.font = Fonts.SH03Bold.font
        return label
    }()
    let bookmarkMeetingTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MeetingTableViewCell.self, forCellReuseIdentifier: "MeetingTableViewCell")
        return tableView
    }()
    
    init(with reactor: MyActivityReactor) {
        super.init(nibName: nil, bundle: nil)
        
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setNavigationbar()
        layout()
        bindAfterLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.reactor?.action.onNext(.loadData)
    }
    
    private func setNavigationbar() {
        self.title = "내 활동"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : Fonts.SH03Bold.font,
            .foregroundColor: UIColor.black
        ]
        self.backButton.tintColor = SharedDSKitAsset.Colors.black.color
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func layout(){
        [meetingLabel,underLineView,scrollView]
            .forEach{ self.view.addSubview($0) }
        scrollView.addSubview(contentView)
        meetingLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(48*Constants.standardHeight)
            make.leading.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        underLineView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(2*Constants.standardHeight)
            make.centerX.equalToSuperview()
            make.top.equalTo(meetingLabel.snp.bottom)
        }
        
        scrollView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.top.equalTo(underLineView.snp.bottom)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        contentView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        [myMeetingLabel,myMeetingTableView,bookmarkMeetingLabel,bookmarkMeetingTableView]
            .forEach{ self.contentView.addSubview($0) }
        
        myMeetingLabel.snp.makeConstraints { make in
            make.height.equalTo(25*Constants.standardHeight)
            make.top.equalToSuperview().offset(32*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20)
        }
        
        myMeetingTableView.snp.makeConstraints { make in
            make.height.equalTo(0)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(myMeetingLabel.snp.bottom).offset(9*Constants.standardHeight)
        }
        
        bookmarkMeetingLabel.snp.makeConstraints { make in
            make.height.equalTo(25*Constants.standardHeight)
            make.top.equalTo(myMeetingTableView.snp.bottom).offset(25*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20)
        }
        
        bookmarkMeetingTableView.snp.makeConstraints { make in
            make.height.equalTo(0)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(bookmarkMeetingLabel.snp.bottom).offset(9*Constants.standardHeight)
            make.bottom.equalToSuperview().offset(-10*Constants.standardHeight)
        }
    }
}

extension MyActivityViewController{
    func bind(reactor: MyActivityReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: MyActivityReactor){
        backButton.rx.tap
            .map{ Reactor.Action.backButtonTapped}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        myMeetingTableView.rx.observe(CGSize.self, "contentSize")
            .compactMap { $0 }
            .map(Reactor.Action.updateMyMeetingTableViewContentSize)
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        bookmarkMeetingTableView.rx.observe(CGSize.self, "contentSize")
            .compactMap { $0 }
            .map(Reactor.Action.updateBookmarkMeetingTableViewContentSize)
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: MyActivityReactor){
        reactor.state.map{ $0.myClubs }
            .observe(on:MainScheduler.asyncInstance)
            .distinctUntilChanged { prev, curr in
                let prevIds = Set(prev.map { $0.club.id })
                let currIds = Set(curr.map { $0.club.id })
                return prevIds == currIds
            }
            .bind(to: myMeetingTableView.rx.items(cellIdentifier: "MeetingTableViewCell", cellType: MeetingTableViewCell.self)){ row, items, cell in
                let cellReator = MeetingTableViewCellReactor(item: items)
                cell.reactor = cellReator
            }
            .disposed(by: disposeBag)
        
        reactor.state.map{ $0.bookmarkClubs }
            .observe(on:MainScheduler.asyncInstance)
            .distinctUntilChanged { prev, curr in
                let prevIds = Set(prev.map { $0.club.id })
                let currIds = Set(curr.map { $0.club.id })
                return prevIds == currIds
            }
            .bind(to: bookmarkMeetingTableView.rx.items(cellIdentifier: "MeetingTableViewCell", cellType: MeetingTableViewCell.self)){ row, items, cell in
                let indexPath = IndexPath(row: row, section: 0)
                let cellReator = MeetingTableViewCellReactor(item: items)
                cell.reactor = cellReator
                cell.bookmarkButton.rx.tap
                    .map{ Reactor.Action.bookmarkButtonTapped(indexPath) }
                    .bind(to: reactor.action)
                    .disposed(by: cell.disposeBag)
            }
            .disposed(by: disposeBag)
    }
    
    private func bindAfterLayout(){
        self.reactor?.state.map { $0.myMeetingTableViewContentSize }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] size in
                self?.myMeetingTableView.snp.updateConstraints { make in
                    make.height.equalTo(size.height*Constants.standardHeight)
                }
            })
            .disposed(by: disposeBag)
        
        self.reactor?.state.map { $0.bookmarkMeetingTableViewContentSize }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] size in
                self?.bookmarkMeetingTableView.snp.updateConstraints { make in
                    make.height.equalTo(size.height*Constants.standardHeight)
                }
            })
            .disposed(by: disposeBag)
    }
}
