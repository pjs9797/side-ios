import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Shared

class CreateMeetingImageView: UIView, ReactorKit.View {
    public var disposeBag = DisposeBag()
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
    
    init(with reactor: CreateMeetingImageReactor){
        super.init(frame: .zero)
        
        self.reactor = reactor
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
}

extension CreateMeetingImageView {
    func bind(reactor: CreateMeetingImageReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: CreateMeetingImageReactor){
        addImageBtView.tapGesture.rx.event
            .map { _ in Reactor.Action.addImageBtViewTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        imageCancelButton.rx.tap
            .map { Reactor.Action.imageCancelButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        setDefaultImageButton.rx.tap
            .map { Reactor.Action.setDefaultImageButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: CreateMeetingImageReactor){
        EditPhotoReactor.shared.state.map { $0.image }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] image in
                self?.representativeImageView.image = image
                self?.representativeImageView.isHidden = (image == nil)
                self?.imageCancelButton.isHidden = (image == nil)
                self?.addImageBtView.cntLabel.text = image == nil ? "0 / 1" : "1 / 1"
            })
            .disposed(by: disposeBag)
    }
}
