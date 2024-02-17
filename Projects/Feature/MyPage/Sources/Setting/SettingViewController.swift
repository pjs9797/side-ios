import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import ReactorKit
import SnapKit
import Shared

public class SettingViewController: UIViewController, ReactorKit.View{
    public var disposeBag = DisposeBag()
    let backButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconArrowLeft24.image, style: .plain, target: nil, action: nil)
    let settingTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(InfoSettingTableViewCell.self, forCellReuseIdentifier: "InfoSettingTableViewCell")
        tableView.register(TermsSettingTableViewCell.self, forCellReuseIdentifier: "TermsSettingTableViewCell")
        tableView.register(LogoutSettingTableViewCell.self, forCellReuseIdentifier: "LogoutSettingTableViewCell")
        return tableView
    }()
    
    public init(with reactor: SettingReactor) {
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
        self.title = "설정"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : Fonts.SH03Bold.font,
            .foregroundColor: UIColor.black
        ]
        self.backButton.tintColor = SharedDSKitAsset.Colors.black.color
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func layout(){
        self.view.addSubview(settingTableView)
        
        settingTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension SettingViewController{
    public func bind(reactor: SettingReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: SettingReactor){
        backButton.rx.tap
            .map{ Reactor.Action.backButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        settingTableView.rx.itemSelected
            .subscribe(onNext: { indexPath in
                let section = reactor.currentState.cellData[indexPath.row]
                switch section {
                case .Logout(let mainLabelText):
                    if mainLabelText == "로그아웃" {
                        reactor.action.onNext(.logoutTapped)
                    } 
                    else if mainLabelText == "회원 탈퇴" {
                        reactor.action.onNext(.withdrawalTapped)
                    }
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: SettingReactor){
        let dataSource = RxTableViewSectionedReloadDataSource<SettingSection>(configureCell: { dataSource, tableView, indexPath, item in
            switch item {
            case .Info(let mainLabelText, let infoLabelText):
                let cell = tableView.dequeueReusableCell(withIdentifier: "InfoSettingTableViewCell", for: indexPath) as! InfoSettingTableViewCell
                let cellReactor = InfoSettingTableViewCellReactor(mainLabelText: mainLabelText, infoLabelText: infoLabelText)
                cell.reactor = cellReactor
                return cell
            case .Terms(let mainLabelText):
                let cell = tableView.dequeueReusableCell(withIdentifier: "TermsSettingTableViewCell", for: indexPath) as! TermsSettingTableViewCell
                let cellReactor = TermsSettingTableViewCellReactor(mainLabelText: mainLabelText)
                cell.reactor = cellReactor
                return cell
            case .Logout(let mainLabelText):
                let cell = tableView.dequeueReusableCell(withIdentifier: "LogoutSettingTableViewCell", for: indexPath) as! LogoutSettingTableViewCell
                let cellReactor = LogoutSettingTableViewCellReactor(mainLabelText: mainLabelText)
                cell.reactor = cellReactor
                return cell
            }
        })
        
        reactor.state.map { [SettingSection(items: $0.cellData)] }
            .bind(to: settingTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}
