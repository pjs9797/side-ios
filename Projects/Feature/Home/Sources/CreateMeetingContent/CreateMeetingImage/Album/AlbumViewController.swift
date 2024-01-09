import UIKit
import Photos
import PhotosUI
import RxSwift
import RxCocoa
import SnapKit
import Shared
import Mantis

class AlbumViewController: UIViewController{
    let disposeBag = DisposeBag()
    let photoAuthType: String
    let albumViewModel: AlbumViewModel
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
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
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
    
    init(photoAuthType: String, albumViewModel: AlbumViewModel){
        self.photoAuthType = photoAuthType
        self.albumViewModel = albumViewModel
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        PHPhotoLibrary.shared().register(self)
        bind()
        layout()
        photoAuthTypeLayout()
    }
    
    deinit {
        PHPhotoLibrary.shared().unregisterChangeObserver(self)
    }
    
    func bind(){
        backButton.rx.tap
            .bind(to: albumViewModel.backButtonTapped)
            .disposed(by: disposeBag)
        
        albumViewModel.backButtonTapped
            .bind(onNext: { [weak self] in
                self?.dismiss(animated: true)
            })
            .disposed(by: disposeBag)
        
        selectButton.rx.tap
            .bind(to: albumViewModel.selectButtonTapped)
            .disposed(by: disposeBag)
        
        albumViewModel.selectButtonTapped
            .withLatestFrom(albumViewModel.selectedPhotoRelay)
            .bind(onNext: { [weak self] img in
                self?.presentEditPhotoViewController(img: img)
            })
            .disposed(by: disposeBag)
        
        albumViewModel.photosRelay
            .bind(to: albumCollectionView.rx.items(cellIdentifier: "AlbumCollectionViewCell", cellType: AlbumCollectionViewCell.self)) { index, model, cell in
                PHImageManager.default().requestImage(for: model, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: nil) { image, _ in
                    cell.photoImageView.image = image
                }
            }
            .disposed(by: disposeBag)
        
        albumCollectionView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                let asset = self?.albumViewModel.photosRelay.value[indexPath.item]
                PHImageManager.default().requestImage(for: asset!, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: nil) { image, _ in
                    guard let image = image else { return }
                    self?.albumViewModel.selectedPhotoRelay.accept(image)
                }
            })
            .disposed(by: disposeBag)
        
        albumCollectionView.rx.itemSelected
            .bind(onNext: { [weak self] indexPath in
                if let cell = self?.albumCollectionView.cellForItem(at: indexPath) as? AlbumCollectionViewCell {
                    cell.selectedPhoto(isSelected: true)
                    self?.selectButton.isEnabled = true
                    self?.selectButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                }
                
                if let previousIndexPath = self?.albumViewModel.selectedPhotoIndexRelay.value, previousIndexPath != indexPath {
                    if let previousCell = self?.albumCollectionView.cellForItem(at: previousIndexPath) as? AlbumCollectionViewCell {
                        previousCell.selectedPhoto(isSelected: false)
                    }
                }
                self?.albumViewModel.selectedPhotoIndexRelay.accept(indexPath)
            })
            .disposed(by: disposeBag)
        
        morePhotoButton.rx.tap
            .bind(to: albumViewModel.morePhotoButtonTapped)
            .disposed(by: disposeBag)
        
        albumViewModel.morePhotoButtonTapped
            .bind(onNext: { [weak self] in
                PHPhotoLibrary.shared().presentLimitedLibraryPicker(from: self!)
            })
            .disposed(by: disposeBag)
        
        photoAuthorizationSettingButton.rx.tap
            .bind(to: albumViewModel.photoAuthorizationSettingButtonTapped)
            .disposed(by: disposeBag)
        
        albumViewModel.photoAuthorizationSettingButtonTapped
            .bind(onNext: { _ in
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func layout(){
        [titleLabel,backButton,selectButton,buttonsView,nonePhotoView,albumCollectionView]
            .forEach{ view.addSubview($0) }
        
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
        
        selectButton.snp.makeConstraints { make in
            make.width.equalTo(28)
            make.height.equalTo(24)
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalTo(titleLabel)
        }
        
        buttonsView.snp.makeConstraints { make in
            make.height.equalTo(135)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        nonePhotoView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(90)
            make.leading.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(15.5)
        }
        
        albumCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(15.5)
            make.bottom.equalTo(buttonsView.snp.top)
        }
        
        [morePhotoButton,separateView,photoAuthorizationSettingButton]
            .forEach{ buttonsView.addSubview($0) }
        
        morePhotoButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(56)
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
            make.height.equalTo(79)
            make.leading.equalToSuperview()
            make.top.equalTo(separateView.snp.bottom)
        }
        
        nonePhotoView.addSubview(nonePhotoLabel)
        
        nonePhotoLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func photoAuthTypeLayout(){
        if photoAuthType == "authorized"{
            self.nonePhotoView.isHidden = true
            self.buttonsView.isHidden = true
            self.albumCollectionView.snp.remakeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.top.equalTo(titleLabel.snp.bottom).offset(15.5)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            }
        }
        else{
            albumViewModel.photosCntDriver
                .drive(onNext: { [weak self] cnt in
                    if cnt == 0{
                        self?.albumCollectionView.isHidden = true
                    }
                    else{
                        self?.albumCollectionView.isHidden = false
                    }
                })
                .disposed(by: disposeBag)
        }
    }
    
    func presentEditPhotoViewController(img: UIImage){
        var config = Mantis.Config()
        config.cropMode = .async
        config.cropViewConfig.showAttachedRotationControlView = false
        config.cropToolbarConfig.toolbarButtonOptions = [.clockwiseRotate, .reset, .ratio, .autoAdjust, .horizontallyFlip]
        let editPhotoViewController: EditPhotoViewController = Mantis.cropViewController(image: img, config: config)
        editPhotoViewController.modalPresentationStyle = .overFullScreen
        self.present(editPhotoViewController, animated: true)
    }
}

extension AlbumViewController: PHPhotoLibraryChangeObserver{
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        self.albumViewModel.fetchLimitedPhotos()
    }
}
