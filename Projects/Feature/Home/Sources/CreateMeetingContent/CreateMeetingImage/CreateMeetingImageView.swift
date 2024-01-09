import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Shared

class CreateMeetingImageView: UIView{
    let disposeBag = DisposeBag()
    weak var homeNavigationController: UINavigationController?
    let createMeetingImageViewModel: CreateMeetingImageViewModel
    let imageLabel: UILabel = {
        let label = UILabel()
        label.text = "대표 이미지를 골라주세요!"
        label.font = Fonts.SH03Bold.font
        return label
    }()
    let addImageBtView: AddImageBtView = {
        let view = AddImageBtView()
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 1
        view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        return view
    }()
    lazy var representativeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        imageView.clipsToBounds = true
        imageView.isHidden = true
        return imageView
    }()
    let imageCancelButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.cancel.image, for: .normal)
        button.isHidden = true
        return button
    }()
    let setDefaultImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("기본 이미지로 설정하기", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        return button
    }()
    let bottomBorder: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.text03.color
        return view
    }()
    
    init(homeNavigationController: UINavigationController?, createMeetingImageViewModel: CreateMeetingImageViewModel){
        self.homeNavigationController = homeNavigationController
        self.createMeetingImageViewModel = createMeetingImageViewModel
        super.init(frame: .zero)
        
        bind()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind(){
        setDefaultImageButton.rx.tap
            .bind(to: createMeetingImageViewModel.setDefaultImageButtonTapped)
            .disposed(by: disposeBag)
        
        imageCancelButton.rx.tap
            .bind(to: createMeetingImageViewModel.imageCancelButtonTapped)
            .disposed(by: disposeBag)
        
        createMeetingImageViewModel.imageCancelButtonTapped
            .bind(onNext: { [weak self] in
                EditPhotoViewModel.shared.imgRelay.accept(nil)
                self?.representativeImageView.isHidden = true
                self?.imageCancelButton.isHidden = true
                self?.addImageBtView.cntLabel.text = "0 / 1"
            })
            .disposed(by: disposeBag)
        
        addImageBtView.tapGesture.rx.event
            .map{ _ in Void() }
            .bind(to: createMeetingImageViewModel.addImageBtViewTapped)
            .disposed(by: disposeBag)
        
        createMeetingImageViewModel.addImageBtViewTapped
            .bind(onNext: { [weak self] in
                self?.presentPhotoCameraActionSheet()
            })
            .disposed(by: disposeBag)
            
        createMeetingImageViewModel.presentAlbumDriver
            .drive(onNext: { [weak self] status in
                switch status {
                case "authorized":
                    self?.homeNavigationController!.present(AlbumViewController(photoAuthType: "authorized", albumViewModel: AlbumViewModel()), animated: true)
                case "limited":
                    self?.homeNavigationController!.present(AlbumViewController(photoAuthType: "limited", albumViewModel: AlbumViewModel()), animated: true)
                case "denied":
                    self?.presentDeniedAlert(target: "사진")
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
        
        createMeetingImageViewModel.presentCameraDriver
            .drive(onNext: { [weak self] status in
                switch status {
                case "authorized":
                    self?.homeNavigationController!.present(CameraViewController(), animated: true)
                case "denied":
                    self?.presentDeniedAlert(target: "카메라")
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
        
        EditPhotoViewModel.shared.imgRelay
            .bind(onNext: { [weak self] img in
                self?.representativeImageView.image = img
                self?.representativeImageView.isHidden = false
                self?.imageCancelButton.isHidden = false
                self?.addImageBtView.cntLabel.text = "1 / 1"
            })
            .disposed(by: disposeBag)
    }
    
    private func layout(){
        [imageLabel,addImageBtView,representativeImageView,imageCancelButton,setDefaultImageButton]
            .forEach{ self.addSubview($0) }
        setDefaultImageButton.addSubview(bottomBorder)
        
        imageLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview()
        }
        
        addImageBtView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(imageLabel.snp.bottom).offset(16)
        }
        
        representativeImageView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.leading.equalTo(addImageBtView.snp.trailing).offset(8)
            make.top.equalTo(imageLabel.snp.bottom).offset(16)
        }
        
        imageCancelButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.trailing.equalTo(representativeImageView.snp.trailing).offset(8)
            make.top.equalTo(representativeImageView.snp.top).offset(-8)
        }
        
        setDefaultImageButton.snp.makeConstraints { make in
            make.width.equalTo(160)
            make.height.equalTo(24)
            make.centerX.equalToSuperview()
            make.top.equalTo(addImageBtView.snp.bottom).offset(24)
        }
        
        bottomBorder.snp.makeConstraints { make in
            make.width.equalTo(setDefaultImageButton.titleLabel!.snp.width)
            make.height.equalTo(1)
            make.centerX.bottom.equalToSuperview()
        }
    }
    
    func presentPhotoCameraActionSheet() {
        let alert = UIAlertController(title: "사부작", message: nil, preferredStyle: .actionSheet)
        let photoLibraryAction = UIAlertAction(title: "앨범에서 사진선택", style: .default) { [weak self] _ in
            self?.createMeetingImageViewModel.requestPhotoLibraryAuthorization()
        }
        let cameraAction = UIAlertAction(title: "카메라 촬영", style: .default) { [weak self] _ in
            self?.createMeetingImageViewModel.requestCameraAuthorization()
        }
        alert.addAction(photoLibraryAction)
        alert.addAction(cameraAction)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        self.homeNavigationController!.present(alert, animated: true, completion: nil)
    }
    
    func presentDeniedAlert(target: String) {
        let alert = UIAlertController(title: nil, message: "\(target) 기능을 사용하려면\n’\(target)’ 접근권한을 허용해야 합니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "설정", style: .default, handler: { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        self.homeNavigationController!.present(alert, animated: true, completion: nil)
    }
}
