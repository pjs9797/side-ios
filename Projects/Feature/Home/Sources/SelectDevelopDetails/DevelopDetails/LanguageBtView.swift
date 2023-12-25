import UIKit
import SnapKit
import Shared

class LanguageBtView: UIView{
<<<<<<< HEAD
    let borderView: UIView = {
=======
    
    lazy var borderView: UIView = {
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
        let view = UIView()
        view.layer.cornerRadius = 40
        view.layer.borderWidth = 1
        view.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        view.isHidden = true
        return view
    }()
<<<<<<< HEAD
    let imgBgImageView: UIImageView = {
=======
    
    lazy var imgBgImageView: UIImageView = {
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(red: 0.73, green: 0.79, blue: 0.94, alpha: 1)
        imageView.layer.cornerRadius = 36
        return imageView
    }()
<<<<<<< HEAD
=======
    
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
    lazy var targetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.book.image
        return imageView
    }()
<<<<<<< HEAD
    let titleLabel: UILabel = {
=======
    
    lazy var titleLabel: UILabel = {
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
        let label = UILabel()
        label.font = Fonts.SH01Bold.font
        label.textAlignment = .center
        label.text = "어학"
        return label
    }()
<<<<<<< HEAD
=======
    
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
    let tapGesture = UITapGestureRecognizer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addGestureRecognizer(tapGesture)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        [borderView,imgBgImageView,targetImageView,titleLabel]
            .forEach{ self.addSubview($0) }
        
        borderView.snp.makeConstraints { make in
            make.width.height.equalTo(80)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        imgBgImageView.snp.makeConstraints { make in
            make.width.height.equalTo(72)
            make.centerX.centerY.equalTo(borderView)
        }
        
        targetImageView.snp.makeConstraints { make in
            make.width.equalTo(48)
            make.height.equalTo(48)
            make.top.equalTo(imgBgImageView.snp.top).offset(12)
            make.leading.equalTo(imgBgImageView.snp.leading)
                .offset(11.83)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
<<<<<<< HEAD
    }
=======
        
    }
    
>>>>>>> 2db78f6 ([FEAT] 모임생성-자기계발 페이지 개발)
}
