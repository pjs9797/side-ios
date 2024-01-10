import UIKit
import SnapKit
import Shared

class EtcBtView: UIView{
    let tapGesture = UITapGestureRecognizer()
    let borderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 40
        view.layer.borderWidth = 1
        view.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        view.isHidden = true
        return view
    }()
    let imgBgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        imageView.layer.cornerRadius = 36
        return imageView
    }()
    lazy var targetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.frame380.image
        return imageView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.SH01Bold.font
        label.textAlignment = .center
        label.text = "기타"
        return label
    }()
    
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
            make.width.equalTo(34)
            make.height.equalTo(6)
            make.top.equalTo(imgBgImageView.snp.top).offset(33)
            make.leading.equalTo(imgBgImageView.snp.leading)
                .offset(19.16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}
