import UIKit
import SnapKit
import Shared

class InvestmentBtView: UIView{
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
        imageView.backgroundColor = UIColor(red: 0.97, green: 0.82, blue: 0.82, alpha: 1)
        imageView.layer.cornerRadius = 36
        return imageView
    }()
    lazy var targetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.image356.image
        return imageView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.SH01Bold.font
        label.textAlignment = .center
        label.text = "재테크"
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
            make.width.equalTo(40)
            make.height.equalTo(40.714)
            make.top.equalTo(imgBgImageView.snp.top).offset(16)
            make.leading.equalTo(imgBgImageView.snp.leading)
                .offset(15.5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}