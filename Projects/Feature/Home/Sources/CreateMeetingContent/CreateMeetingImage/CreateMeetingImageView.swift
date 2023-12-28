import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Shared

class CreateMeetingImageView: UIView{
    let disposeBag = DisposeBag()
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
<<<<<<< HEAD
        imageView.clipsToBounds = true
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        [imageLabel,addImageBtView,representativeImageView,imageCancelButton,setDefaultImageButton]
            .forEach{ self.addSubview($0) }
        setDefaultImageButton.addSubview(bottomBorder)
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        imageLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview()
        }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        addImageBtView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(imageLabel.snp.bottom).offset(16)
        }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        representativeImageView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.leading.equalTo(addImageBtView.snp.trailing).offset(8)
            make.top.equalTo(imageLabel.snp.bottom).offset(16)
        }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        imageCancelButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.trailing.equalTo(representativeImageView.snp.trailing).offset(8)
            make.top.equalTo(representativeImageView.snp.top).offset(-8)
        }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        setDefaultImageButton.snp.makeConstraints { make in
            make.width.equalTo(160)
            make.height.equalTo(24)
            make.centerX.equalToSuperview()
            make.top.equalTo(addImageBtView.snp.bottom).offset(24)
        }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        bottomBorder.snp.makeConstraints { make in
            make.width.equalTo(setDefaultImageButton.titleLabel!.snp.width)
            make.height.equalTo(1)
            make.centerX.bottom.equalToSuperview()
        }
    }
}
