import UIKit
import SnapKit
import Shared

class AddImageBtView: UIView{
    
    lazy var imgBgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.vuesaxlinearcamera.image
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Caption.font
        label.textAlignment = .center
        label.text = "이미지 첨부"
        return label
    }()
    
    let cntLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Caption.font
        label.textAlignment = .center
        label.text = "0 / 1"
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
        [imgBgImageView,titleLabel,cntLabel]
            .forEach{ self.addSubview($0) }
        
        imgBgImageView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imgBgImageView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        cntLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        
    }
    
}
