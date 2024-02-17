import UIKit
import RxKeyboard
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Shared
import Kingfisher

public class ModifyProfileViewController: UIViewController, ReactorKit.View{
    public var disposeBag = DisposeBag()
    let selectPositionReactor: SelectPositionReactor
    let backButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconArrowLeft24.image, style: .plain, target: nil, action: nil)
    let scrollView = UIScrollView()
    let contentView = UIView()
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = SharedDSKitAsset.Colors.bgLightGray.color
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 48*Constants.standardHeight
        return imageView
    }()
    let cameraButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.layer.cornerRadius = 16*Constants.standardHeight
        button.setImage(SharedDSKitAsset.Icons.iconCamera16.image, for: .normal)
        return button
    }()
    let nicknameTextFieldView: ModifyProfileTextFieldView = {
        let textFieldView = ModifyProfileTextFieldView()
        textFieldView.titleLabel.text = "닉네임"
        return textFieldView
    }()
    let birthTextFieldView: ModifyProfileTextFieldView = {
        let textFieldView = ModifyProfileTextFieldView()
        textFieldView.titleLabel.text = "생년월일"
        textFieldView.textField.keyboardType = .numberPad
        return textFieldView
    }()
    let positionTextFieldView: ModifyProfileTextFieldView = {
        let textFieldView = ModifyProfileTextFieldView()
        textFieldView.titleLabel.text = "직무"
        textFieldView.textField.isEnabled = false
        return textFieldView
    }()
    let interestLabel: UILabel = {
        let label = UILabel()
        label.text = "관심사"
        label.font = Fonts.SH03Bold.font
        return label
    }()
    let developLabel: UILabel = {
        let label = UILabel()
        label.text = "자기계발"
        label.font = Fonts.SH01.font
        return label
    }()
    let developCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8*Constants.standardHeight
        layout.minimumInteritemSpacing = 8*Constants.standardWidth
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DevelopHobbyCollectionViewCell.self, forCellWithReuseIdentifier: "DevelopHobbyCollectionViewCell")
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    let hobbyLabel: UILabel = {
        let label = UILabel()
        label.text = "취미"
        label.font = Fonts.SH01.font
        return label
    }()
    let hobbyCollectionView: UICollectionView = {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8*Constants.standardHeight
        layout.minimumInteritemSpacing = 8*Constants.standardWidth
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DevelopHobbyCollectionViewCell.self, forCellWithReuseIdentifier: "DevelopHobbyCollectionViewCell")
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("저장", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Fonts.SH02Bold.font
        button.layer.cornerRadius = 16*Constants.standardHeight
        button.layer.borderWidth = 1
        button.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        button.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
        return button
    }()
    
    public init(with reactor: ModifyProfileReactor, selectPositionReactor: SelectPositionReactor) {
        self.selectPositionReactor = selectPositionReactor
        super.init(nibName: nil, bundle: nil)
        
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.reactor?.action.onNext(.loadData)
        birthTextFieldView.textField.delegate = self
        setNavigationbar()
        layout()
        setKeyboard()
        bindAfterLayout()
    }
    
    private func setNavigationbar() {
        self.title = "프로필수정"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : Fonts.SH03Bold.font,
            .foregroundColor: UIColor.black
        ]
        self.backButton.tintColor = SharedDSKitAsset.Colors.black.color
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func layout(){
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        contentView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        [userImageView,cameraButton,nicknameTextFieldView,birthTextFieldView,positionTextFieldView,interestLabel,developLabel,developCollectionView,hobbyLabel,hobbyCollectionView,saveButton]
            .forEach{ contentView.addSubview($0) }
        
        userImageView.snp.makeConstraints { make in
            make.width.height.equalTo(96*Constants.standardHeight)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(16*Constants.standardHeight)
        }
        
        cameraButton.snp.makeConstraints { make in
            make.width.height.equalTo(32*Constants.standardHeight)
            make.trailing.equalTo(userImageView.snp.trailing)
            make.bottom.equalTo(userImageView.snp.bottom)
        }
        
        cameraButton.imageView?.snp.makeConstraints{ make in
            make.width.height.equalTo(16*Constants.standardHeight)
            make.center.equalToSuperview()
        }
        
        cameraButton.snp.makeConstraints { make in
            make.width.height.equalTo(32*Constants.standardHeight)
            make.trailing.equalTo(userImageView.snp.trailing)
            make.bottom.equalTo(userImageView.snp.bottom)
        }
        
        nicknameTextFieldView.snp.makeConstraints { make in
            make.height.equalTo(56*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(cameraButton.snp.bottom).offset(40*Constants.standardHeight)
        }
        
        birthTextFieldView.snp.makeConstraints { make in
            make.height.equalTo(56*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(nicknameTextFieldView.snp.bottom).offset(16*Constants.standardHeight)
        }
        
        positionTextFieldView.snp.makeConstraints { make in
            make.height.equalTo(56*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(birthTextFieldView.snp.bottom).offset(16*Constants.standardHeight)
        }
        
        interestLabel.snp.makeConstraints { make in
            make.height.equalTo(25*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.top.equalTo(positionTextFieldView.snp.bottom).offset(40*Constants.standardHeight)
        }
        
        developLabel.snp.makeConstraints { make in
            make.height.equalTo(25*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.top.equalTo(interestLabel.snp.bottom).offset(24*Constants.standardHeight)
        }
        
        developCollectionView.snp.makeConstraints { make in
            make.height.equalTo(0)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(developLabel.snp.bottom).offset(8*Constants.standardHeight)
        }
        
        hobbyLabel.snp.makeConstraints { make in
            make.height.equalTo(25*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.top.equalTo(developCollectionView.snp.bottom).offset(40*Constants.standardHeight)
        }
        
        hobbyCollectionView.snp.makeConstraints { make in
            make.height.equalTo(0)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(hobbyLabel.snp.bottom).offset(8*Constants.standardHeight)
        }
        
        saveButton.snp.makeConstraints { make in
            make.width.equalTo(335*Constants.standardWidth)
            make.height.equalTo(52*Constants.standardHeight)
            make.centerX.equalToSuperview()
            make.top.equalTo(hobbyCollectionView.snp.bottom).offset(56*Constants.standardHeight)
            make.bottom.equalToSuperview().offset(-8*Constants.standardHeight)
        }
    }
    
    private func setKeyboard(){
        let tapGesture = UITapGestureRecognizer()
        view.addGestureRecognizer(tapGesture)
        tapGesture.cancelsTouchesInView = false
        tapGesture.rx.event
            .bind(onNext: { [weak self] _ in
                self?.view.endEditing(true)
            })
            .disposed(by: disposeBag)
        RxKeyboard.instance.visibleHeight
            .drive(onNext: { keyboardVisibleHeight in
                self.scrollView.contentInset.bottom = keyboardVisibleHeight
            })
            .disposed(by: disposeBag)
    }
}

extension ModifyProfileViewController{
    public func bind(reactor: ModifyProfileReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: ModifyProfileReactor){
        developCollectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        hobbyCollectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
                
        backButton.rx.tap
            .map{ Reactor.Action.backButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        nicknameTextFieldView.textField.rx.text.orEmpty
            .map{ Reactor.Action.updateNickname($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        birthTextFieldView.textField.rx.text.orEmpty
            .map{ Reactor.Action.updateBirth($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        positionTextFieldView.tapGesture.rx.event
            .map{ _ in Reactor.Action.positionTextFieldViewTapped}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        developCollectionView.rx.itemSelected
            .map { Reactor.Action.toggleDevelopItem($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        hobbyCollectionView.rx.itemSelected
            .map { Reactor.Action.toggleHobbyItem($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        developCollectionView.rx.observe(CGSize.self, "contentSize")
            .compactMap { $0 }
            .map(Reactor.Action.updateDevelopContentSize)
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        hobbyCollectionView.rx.observe(CGSize.self, "contentSize")
            .compactMap { $0 }
            .map(Reactor.Action.updateHobbyContentSize)
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: ModifyProfileReactor){
        reactor.state.map{ $0.nickname }
            .distinctUntilChanged()
            .bind(to: nicknameTextFieldView.textField.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map{ $0.birth }
            .distinctUntilChanged()
            .bind(to: birthTextFieldView.textField.rx.text)
            .disposed(by: disposeBag)
        
        self.selectPositionReactor.state.map{ $0.position }
            .distinctUntilChanged()
            .bind(to: positionTextFieldView.textField.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map{ $0.position }
            .distinctUntilChanged()
            .bind(to: positionTextFieldView.textField.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.developCellData }
            .distinctUntilChanged()
            .bind(to: developCollectionView.rx.items(cellIdentifier: "DevelopHobbyCollectionViewCell", cellType: DevelopHobbyCollectionViewCell.self)) { (row, item, cell) in
                let isSelected = reactor.currentState.selectedDevelopItems.contains(item)
                let cellReator = DevelopHobbyCollectionViewReactor(title: item, isSelected: isSelected)
                cell.reactor = cellReator
            }
            .disposed(by: disposeBag)

        reactor.state.map { $0.hobbyCellData }
            .distinctUntilChanged()
            .bind(to: hobbyCollectionView.rx.items(cellIdentifier: "DevelopHobbyCollectionViewCell", cellType: DevelopHobbyCollectionViewCell.self)) { (row, item, cell) in
                let isSelected = reactor.currentState.selectedHobbyItems.contains(item)
                let cellReator = DevelopHobbyCollectionViewReactor(title: item, isSelected: isSelected)
                cell.reactor = cellReator
            }
            .disposed(by: disposeBag)
        
        reactor.state.map{ $0.selectedDevelopItems }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] _ in
                self?.developCollectionView.reloadData()
            })
            .disposed(by: disposeBag)
        
        reactor.state.map{ $0.selectedHobbyItems }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] _ in
                self?.hobbyCollectionView.reloadData()
            })
            .disposed(by: disposeBag)
    }
    
    private func bindAfterLayout(){
        self.reactor?.state.map { $0.developContentSize }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] size in
                self?.developCollectionView.snp.updateConstraints { make in
                    make.height.equalTo(size.height*Constants.standardHeight)
                }
            })
            .disposed(by: disposeBag)

        self.reactor?.state.map { $0.hobbyContentSize }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] size in
                self?.hobbyCollectionView.snp.updateConstraints { make in
                    make.height.equalTo(size.height*Constants.standardHeight)
                }
            })
            .disposed(by: disposeBag)
    }
}

extension ModifyProfileViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var text: String = ""
        if collectionView == self.developCollectionView {
            text = self.reactor?.currentState.developCellData[indexPath.item] ?? ""
        } else if collectionView == self.hobbyCollectionView {
            text = self.reactor?.currentState.hobbyCellData[indexPath.item] ?? ""
        }
        let font = Fonts.SH01.font
        let textAttributes = [NSAttributedString.Key.font: font]
        let estimatedTextSize = NSString(string: text).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 20*Constants.standardHeight),options: .usesLineFragmentOrigin,attributes: textAttributes,context: nil).size
        let cellPadding: CGFloat = 32*Constants.standardWidth
        let cellWidth = estimatedTextSize.width + cellPadding
        let cellHeight: CGFloat = 40*Constants.standardHeight
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

extension ModifyProfileViewController: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == birthTextFieldView.textField {
            let currentText = textField.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            return newText.count <= 10
        }
        return true
    }
}
