import UIKit
import SnapKit
import Shared

class JobChangeBtView: UIView{
    
    lazy var borderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 40
        view.layer.borderWidth = 1
        view.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        view.isHidden = true
        return view
    }()
    
    lazy var imgBgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(red: 0.95, green: 0.85, blue: 0.66, alpha: 1)
        imageView.layer.cornerRadius = 36
        return imageView
    }()
    
    lazy var targetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.image358.image
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.SH01Bold.font
        label.textAlignment = .center
        label.text = "이직 준비"
        return label
    }()
    
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
            make.width.equalTo(40)
            make.height.equalTo(39.422)
            make.top.equalTo(imgBgImageView.snp.top).offset(16)
            make.leading.equalTo(imgBgImageView.snp.leading)
                .offset(16.16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
    }
    
}
