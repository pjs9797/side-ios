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
        textField.layer.cornerRadius = 16
        textField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        textField.addLeftPadding(width: 16)
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
        return tableView
    }()
    
    init(with reactor: MeetingRegionReactor) {
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
        self.layout()
    }
    
    func layout(){
        [titleLabel,backButton,searchTextField,searchButton,clearButton,currentLocationSettingLabel,locationImageView,currentLocationButton]
            .forEach { self.view.addSubview($0) }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15.5)
        }
        
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalTo(titleLabel)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(titleLabel.snp.bottom).offset(31.5)
        }
        
        searchButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.trailing.equalTo(searchTextField.snp.trailing).offset(-16)
            make.centerY.equalTo(searchTextField)
        }
        
        clearButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.trailing.equalTo(searchButton.snp.leading).offset(-16)
            make.centerY.equalTo(searchButton)
        }
        
        currentLocationSettingLabel.snp.makeConstraints { make in
            make.height.equalTo(27)
            make.leading.equalToSuperview().offset(40)
            make.top.equalTo(searchTextField.snp.bottom).offset(16)
        }
        
        locationImageView.snp.makeConstraints { make in
            make.width.height.equalTo(16)
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalTo(currentLocationSettingLabel)
        }
        
        currentLocationButton.snp.makeConstraints { make in
            make.width.height.equalTo(16)
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalTo(currentLocationSettingLabel)
        }
    }
    
    func presentDeniedAlert() {
        let alert = UIAlertController(title: nil, message: "위치 기능을 사용하려면\n’위치’ 접근권한을 허용해야 합니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "설정", style: .default, handler: { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension SelectMeetingRegionViewController{
    func bind(reactor: MeetingRegionReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: MeetingRegionReactor){
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
    }
    
    private func bindState(reactor: MeetingRegionReactor){
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
        
        reactor.state.map{ $0.deniedLocationAuth }
            .filter{ $0 }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] _ in
                self?.presentDeniedAlert()
            })
            .disposed(by: disposeBag)
    }
}

