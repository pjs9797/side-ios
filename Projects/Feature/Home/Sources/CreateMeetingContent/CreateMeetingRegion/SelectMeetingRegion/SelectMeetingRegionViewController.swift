import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Shared

class SelectMeetingRegionViewController: UIViewController, ReactorKit.View {
    public var disposeBag = DisposeBag()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.SH03Bold.font
        label.text = "모임 지역 선택"
        return label
    }()
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconArrowClose24.image, for: .normal)
        return button
    }()
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "읍,면,동으로 검색하세요."
        textField.font = Fonts.Body02.font
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 16*Constants.standardHeight
        textField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        textField.addLeftPadding(width: 16*Constants.standardWidth)
        return textField
    }()
    let clearButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.cancel.image, for: .normal)
        button.isHidden = true
        return button
    }()
    let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconSearch24.image, for: .normal)
        return button
    }()
    let locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconArrowTarget16.image
        return imageView
    }()
    let currentLocationSettingLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body03.font
        label.text = "현재 위치로 설정"
        return label
    }()
    let currentLocationButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconArrowRight16.image, for: .normal)
        return button
    }()
    let locationTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: "LocationTableViewCell")
        return tableView
    }()
    
    init(with reactor: SelectMeetingRegionReactor) {
        super.init(nibName: nil, bundle: nil)
        
        self.reactor = reactor
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.keyBoardCancel()
        self.layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.reactor?.action.onNext(.clearSearchedLocations)
    }
    
    func keyBoardCancel(){
        let tapGesture = UITapGestureRecognizer()
        view.addGestureRecognizer(tapGesture)
        tapGesture.cancelsTouchesInView = false
        tapGesture.rx.event
            .bind(onNext: { [weak self] _ in
                self?.view.endEditing(true)
            })
            .disposed(by: disposeBag)
    }
    
    func layout(){
        [titleLabel,backButton,searchTextField,searchButton,clearButton,currentLocationSettingLabel,locationImageView,currentLocationButton,locationTableView]
            .forEach { self.view.addSubview($0) }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(25*Constants.standardHeight)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15.5*Constants.standardHeight)
        }
        
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(24*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.centerY.equalTo(titleLabel)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.height.equalTo(56*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(titleLabel.snp.bottom).offset(31.5*Constants.standardHeight)
        }
        
        searchButton.snp.makeConstraints { make in
            make.width.height.equalTo(24*Constants.standardHeight)
            make.trailing.equalTo(searchTextField.snp.trailing).offset(-16*Constants.standardWidth)
            make.centerY.equalTo(searchTextField)
        }
        
        clearButton.snp.makeConstraints { make in
            make.width.height.equalTo(24*Constants.standardHeight)
            make.trailing.equalTo(searchButton.snp.leading).offset(-16*Constants.standardWidth)
            make.centerY.equalTo(searchButton)
        }
        
        currentLocationSettingLabel.snp.makeConstraints { make in
            make.height.equalTo(27*Constants.standardHeight)
            make.leading.equalToSuperview().offset(40*Constants.standardWidth)
            make.top.equalTo(searchTextField.snp.bottom).offset(16*Constants.standardHeight)
        }
        
        locationImageView.snp.makeConstraints { make in
            make.width.height.equalTo(16*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.centerY.equalTo(currentLocationSettingLabel)
        }
        
        currentLocationButton.snp.makeConstraints { make in
            make.width.height.equalTo(16*Constants.standardHeight)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.centerY.equalTo(currentLocationSettingLabel)
        }
        
        locationTableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(currentLocationSettingLabel.snp.bottom).offset(12*Constants.standardHeight)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension SelectMeetingRegionViewController{
    func bind(reactor: SelectMeetingRegionReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: SelectMeetingRegionReactor){
        backButton.rx.tap
            .map{ Reactor.Action.backButtonTapped}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        clearButton.rx.tap
            .map{ Reactor.Action.clearButtonTapped}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        searchButton.rx.tap
            .map{ Reactor.Action.searchButtonTapped}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        currentLocationButton.rx.tap
            .map{ Reactor.Action.currentLocationButtonTapped}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        searchTextField.rx.text.orEmpty
            .map{ Reactor.Action.writeText($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        locationTableView.rx.itemSelected
            .observe(on: MainScheduler.asyncInstance)
            .map { indexPath in
                let locationName = reactor.currentState.searchedLocationNames[indexPath.row]
                return Reactor.Action.selectSearchedLocation(locationName)
            }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: SelectMeetingRegionReactor){
        reactor.state.map{ $0.isTextExist }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] value in
                if !value {
                    self?.searchTextField.text = ""
                }
                self?.clearButton.isHidden = !value
                self?.searchTextField.layer.borderColor = value ? UIColor.black.cgColor : SharedDSKitAsset.Colors.gr10.color.cgColor
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.searchedLocationNames }
            .bind(to: locationTableView.rx.items(cellIdentifier: "LocationTableViewCell", cellType: LocationTableViewCell.self)){ row, data, cell in
                let locationTableViewCellReactor = LocationTableViewCellReactor(locationName: data)
                cell.reactor = locationTableViewCellReactor
            }
            .disposed(by: disposeBag)
        
    }
}

