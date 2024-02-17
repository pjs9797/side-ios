import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import ReactorKit
import SnapKit
import Shared

public class MyPageViewController: UIViewController, ReactorKit.View{
    public var disposeBag = DisposeBag()
    let settingButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconSetting24.image, style: .plain, target: nil, action: nil)
    let modifyButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 수정", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.layer.borderColor = SharedDSKitAsset.Colors.text03.color.cgColor
        if let title = button.title(for: .normal) {
            let attributedString = NSMutableAttributedString(string: title)
            attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: title.count))
            button.setAttributedTitle(attributedString, for: .normal)
        }
        return button
    }()
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = SharedDSKitAsset.Colors.bgLightGray.color
        imageView.layer.cornerRadius = 40*Constants.standardHeight
        return imageView
    }()
    let userNameLabel: UILabel = {
        var label = UILabel()
        label.text = "청계산 다람쥐"
        label.font = Fonts.SH03Bold.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        return label
    }()
    let positionLabel: UILabel = {
        var label = UILabel()
        label.text = "미디어 · 전시"
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    let emailLabel: UILabel = {
        var label = UILabel()
        label.text = "lkfjlkj789456@kakao.com"
        label.font = Fonts.Body01.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    let interestCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8*Constants.standardHeight
        layout.minimumInteritemSpacing = 8*Constants.standardWidth
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(InterestCollectionViewCell.self, forCellWithReuseIdentifier: "InterestCollectionViewCell")
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    let separateView: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        return view
    }()
    let activityLabel: UILabel = {
        let label = UILabel()
        label.text = "내 활동"
        label.font = Fonts.SH03Bold.font
        return label
    }()
    let meetingLable: UILabel = {
        let label = UILabel()
        label.textColor = SharedDSKitAsset.Colors.text03.color
        label.font = Fonts.SH01.font
        return label
    }()
    let activityTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.sectionHeaderTopPadding = 0
        tableView.isScrollEnabled = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ActivityTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "ActivityTableViewHeaderView")
        tableView.register(ActivityTableViewCell.self, forCellReuseIdentifier: "ActivityTableViewCell")
        return tableView
    }()
    let dataSource = RxTableViewSectionedReloadDataSource<ActivitySection>(
        configureCell: { _, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityTableViewCell", for: indexPath) as! ActivityTableViewCell
            let cellReactor = ActivityTableViewCellReactor(titleLabelText: item.title, cntLabelText: item.cnt)
            cell.reactor = cellReactor
            return cell
        }
    )
    
    public init(with reactor: MyPageReactor) {
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
        bindAfterLayout()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.reactor?.action.onNext(.loadCellData)
    }
    
    private func setNavigationbar() {
        self.title = "마이 페이지"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : Fonts.SH03Bold.font,
            .foregroundColor: UIColor.black
        ]
        self.settingButton.tintColor = SharedDSKitAsset.Colors.black.color
        navigationItem.rightBarButtonItem = settingButton
    }
    
    private func layout(){
        [modifyButton, userImageView, userNameLabel, positionLabel, emailLabel, interestCollectionView, separateView, activityLabel, activityTableView]
            .forEach{ self.view.addSubview($0) }
        
        modifyButton.snp.makeConstraints { make in
            make.width.equalTo(75*Constants.standardWidth)
            make.height.equalTo(25*Constants.standardHeight)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16*Constants.standardHeight)
        }
        
        userImageView.snp.makeConstraints { make in
            make.width.height.equalTo(80*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(48*Constants.standardHeight)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.height.equalTo(25*Constants.standardHeight)
            make.leading.equalTo(userImageView.snp.trailing).offset(24*Constants.standardWidth)
            make.top.equalTo(userImageView.snp.top).offset(4*Constants.standardHeight)
        }
        
        positionLabel.snp.makeConstraints { make in
            make.height.equalTo(17*Constants.standardHeight)
            make.leading.equalTo(userNameLabel.snp.leading)
            make.top.equalTo(userNameLabel.snp.bottom).offset(2*Constants.standardHeight)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.height.equalTo(21*Constants.standardHeight)
            make.leading.equalTo(userNameLabel.snp.leading)
            make.top.equalTo(positionLabel.snp.bottom).offset(2*Constants.standardHeight)
        }
        
        interestCollectionView.snp.makeConstraints { make in
            make.height.equalTo(0)
            make.leading.equalTo(userNameLabel.snp.leading)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(emailLabel.snp.bottom).offset(16*Constants.standardHeight)
        }
        
        separateView.snp.makeConstraints { make in
            make.height.equalTo(8*Constants.standardHeight)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(interestCollectionView.snp.bottom).offset(32*Constants.standardHeight)
        }
        
        activityLabel.snp.makeConstraints { make in
            make.height.equalTo(25*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.top.equalTo(separateView.snp.bottom).offset(32*Constants.standardHeight)
        }
        
        activityTableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(activityLabel.snp.bottom).offset(24*Constants.standardHeight)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension MyPageViewController{
    public func bind(reactor: MyPageReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: MyPageReactor){
        interestCollectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        activityTableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        settingButton.rx.tap
            .map{ Reactor.Action.settingButtonTapped}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        modifyButton.rx.tap
            .map{ Reactor.Action.modifyButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        interestCollectionView.rx.observe(CGSize.self, "contentSize")
            .compactMap { $0 }
            .map(Reactor.Action.updateContentSize)
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: MyPageReactor){
        reactor.state.map{ $0.collectionViewCellData }
            .bind(to: interestCollectionView.rx.items(cellIdentifier: "InterestCollectionViewCell", cellType: InterestCollectionViewCell.self)) { index, item, cell in
                let cellReator = InterestCollectionViewCellReactor(titleLabelText: item)
                cell.reactor = cellReator
            }
            .disposed(by: disposeBag)

        reactor.state.map { $0.tableViewCellData }
            .bind(to: activityTableView.rx.items(dataSource: self.dataSource))
            .disposed(by: disposeBag)
    }
    
    private func bindAfterLayout(){
        self.reactor?.state.map { $0.contentSize }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] size in
                self?.interestCollectionView.snp.updateConstraints { make in
                    make.height.equalTo(size.height*Constants.standardHeight)
                }
            })
            .disposed(by: disposeBag)
    }
}

extension MyPageViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = self.reactor?.currentState.collectionViewCellData[indexPath.item] ?? ""
        let font = Fonts.ST01.font
        let textAttributes = [NSAttributedString.Key.font: font]
        let estimatedTextSize = NSString(string: text).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 17*Constants.standardHeight),options: .usesLineFragmentOrigin,attributes: textAttributes,context: nil).size
        let cellPadding: CGFloat = 16*Constants.standardWidth
        let cellWidth = estimatedTextSize.width + cellPadding
        let cellHeight: CGFloat = 25*Constants.standardHeight
        return CGSize(width: cellWidth, height: cellHeight)
    }
}


extension MyPageViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionItem = self.dataSource.sectionModels[section]
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ActivityTableViewHeaderView") as? ActivityTableViewHeaderView else {
            return nil
        }
        headerView.headerLabel.text = sectionItem.header
        return headerView
    }
}
