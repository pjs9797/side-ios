import UIKit
import Photos
import PhotosUI
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Shared


class AlbumViewController: UIViewController, ReactorKit.View{
    var disposeBag = DisposeBag()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "앨범"
        label.font = Fonts.SH03Bold.font
        return label
    }()
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconArrowClose24.image, for: .normal)
        return button
    }()
    let selectButton: UIButton = {
        let button = UIButton()
        button.setTitle("선택", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.isEnabled = false
        return button
    }()
    lazy var albumCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = (screenWidth - 8) / 3
        layout.itemSize = CGSize(width: cellWidth*Constants.standardWidth, height: cellWidth*Constants.standardWidth)
        layout.minimumLineSpacing = 4*Constants.standardHeight
        layout.minimumInteritemSpacing = 4*Constants.standardWidth
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: "AlbumCollectionViewCell")
        return collectionView
    }()
    let nonePhotoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        return view
    }()
    let nonePhotoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "접근 허용된 사진이 없습니다.\n권한 설정을 변경하시거나, 사진을 선택해주세요."
        label.font = Fonts.Body01.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    let buttonsView = UIView()
    let morePhotoButton: UIButton = {
        let button = UIButton()
        button.setTitle("더 많은 사진 선택", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.contentHorizontalAlignment = .leading
        return button
    }()
    let photoAuthorizationSettingButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        configuration.attributedTitle = AttributedString("권한 설정으로 이동", attributes: AttributeContainer([NSAttributedString.Key.font: Fonts.Body02.font, .foregroundColor: UIColor.black]))
        configuration.attributedSubtitle = AttributedString("사진 접근 권한을 \"모든 사진\"으로 변경할 수 있습니다.", attributes: AttributeContainer([NSAttributedString.Key.font: Fonts.Body01.font, .foregroundColor: SharedDSKitAsset.Colors.text03.color]))
        let button = UIButton()
        button.configuration = configuration
        button.contentHorizontalAlignment = .leading
        return button
    }()
    let separateView: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        return view
    }()
    
    init(with reator: AlbumViewReactor){
        super.init(nibName: nil, bundle: nil)
        
        self.reactor = reator
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        PHPhotoLibrary.shared().register(self)
        layout()
        photoAuthTypeLayout()
    }
    
    deinit {
        PHPhotoLibrary.shared().unregisterChangeObserver(self)
    }
    
    func layout(){
        [titleLabel,backButton,selectButton,buttonsView,nonePhotoView,albumCollectionView]
            .forEach{ view.addSubview($0) }
        
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
        
        selectButton.snp.makeConstraints { make in
            make.width.equalTo(28*Constants.standardWidth)
            make.height.equalTo(24*Constants.standardHeight)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.centerY.equalTo(titleLabel)
        }
        
        buttonsView.snp.makeConstraints { make in
            make.height.equalTo(135*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        nonePhotoView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(90*Constants.standardHeight)
            make.leading.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(15.5*Constants.standardHeight)
        }
        
        albumCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(15.5*Constants.standardHeight)
            make.bottom.equalTo(buttonsView.snp.top)
        }
        
        [morePhotoButton,separateView,photoAuthorizationSettingButton]
            .forEach{ buttonsView.addSubview($0) }
        
        morePhotoButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(56*Constants.standardHeight)
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        separateView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.leading.equalToSuperview()
            make.top.equalTo(morePhotoButton.snp.bottom)
        }
        
        photoAuthorizationSettingButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(79*Constants.standardHeight)
            make.leading.equalToSuperview()
            make.top.equalTo(separateView.snp.bottom)
        }
        
        nonePhotoView.addSubview(nonePhotoLabel)
        
        nonePhotoLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func photoAuthTypeLayout(){
        if self.reactor?.currentState.photoAuthType == "authorized"{
            self.nonePhotoView.isHidden = true
            self.buttonsView.isHidden = true
            self.albumCollectionView.snp.remakeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.top.equalTo(titleLabel.snp.bottom).offset(15.5*Constants.standardHeight)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            }
        }
        else{
            self.reactor?.state.map{ $0.photosCnt }
                .asDriver(onErrorDriveWith: .empty())
                .drive(onNext: { [weak self] cnt in
                    if cnt == 0 {
                        self?.albumCollectionView.isHidden = true
                    }
                    else{
                        self?.albumCollectionView.isHidden = false
                    }
                })
                .disposed(by: disposeBag)
        }
    }
}

extension AlbumViewController: PHPhotoLibraryChangeObserver{
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        self.reactor?.fetchLimitedPhotos()
    }
}

extension AlbumViewController{
    func bind(reactor: AlbumViewReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: AlbumViewReactor){
        backButton.rx.tap
            .map{ Reactor.Action.backButtonTapped}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        morePhotoButton.rx.tap
            .map{ Reactor.Action.morePhotoButtonTapped(self)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        photoAuthorizationSettingButton.rx.tap
            .map{ Reactor.Action.photoAuthorizationSettingButtonTapped}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        selectButton.rx.tap
            .map{ Reactor.Action.selectButtonTapped}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        albumCollectionView.rx.itemSelected
            .observe(on: MainScheduler.asyncInstance)
            .flatMapLatest { [weak self] indexPath -> Observable<Reactor.Action> in
                guard let asset = self?.reactor?.currentState.photos[indexPath.item] else {
                    return .empty()
                }
                return Observable.create { observer in
                    PHImageManager.default().requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: nil) { image, _ in
                        observer.onNext(.selectPhoto(image, indexPath))
                        observer.onCompleted()
                    }
                    return Disposables.create()
                }
            }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: AlbumViewReactor){
        reactor.state.map{ $0.photos }
            .distinctUntilChanged { previousPhotos, currentPhotos in
                if previousPhotos.count != currentPhotos.count {
                    return false
                }
                return !zip(previousPhotos, currentPhotos).contains { prev, curr in
                    prev.localIdentifier != curr.localIdentifier
                }
            }
            .bind(to: albumCollectionView.rx.items(cellIdentifier: "AlbumCollectionViewCell", cellType: AlbumCollectionViewCell.self)) { index, model, cell in
                PHImageManager.default().requestImage(for: model, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: nil) { image, _ in
                    let cellReactor = AlbumCollectionViewCellReactor(image: image)
                    cell.reactor = cellReactor
                }
            }
            .disposed(by: disposeBag)
        
        reactor.state.compactMap{ $0.selectedIndexPath }
            .observe(on: MainScheduler.asyncInstance)
            .compactMap{ $0 }
            .bind(onNext: { [weak self] indexPath in
                if let cell = self?.albumCollectionView.cellForItem(at: indexPath) as? AlbumCollectionViewCell {
                    cell.reactor?.action.onNext(.selectImage(true))
                }
                self?.selectButton.isEnabled = true
                self?.selectButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            })
            .disposed(by: disposeBag)
        
        reactor.state.compactMap{ $0.previousSelectedIndexPath }
            .observe(on: MainScheduler.asyncInstance)
            .compactMap{ $0 }
            .bind(onNext: { [weak self] indexPath in
                if let previousCell = self?.albumCollectionView.cellForItem(at: indexPath) as? AlbumCollectionViewCell {
                    previousCell.reactor?.action.onNext(.selectImage(false))
                }
                self?.selectButton.isEnabled = false
                self?.selectButton.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
            })
            .disposed(by: disposeBag)
    }
}

