import UIKit
import SnapKit
import Shared

class PeriodBtView: UIView{
    let tapGesture = UITapGestureRecognizer()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Caption.font
        return label
    }()
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.textDisabled.color
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addGestureRecognizer(tapGesture)
        layout()
    }
    
    convenience init(title: String, subTitle: String) {
        self.init(frame: .zero)
        
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        [titleLabel,subTitleLabel]
            .forEach{ self.addSubview($0) }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(8)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
        }
    }
    
    func configure(subTitle: String){
        subTitleLabel.text = subTitle
        subTitleLabel.textColor = .black
    }
}
