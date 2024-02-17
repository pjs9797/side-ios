import UIKit
import SnapKit
import Shared

class ModifyProfileTextFieldView: UIView {
    let tapGesture = UITapGestureRecognizer()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0.5
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.gr80.color
        return label
    }()
    let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = Fonts.Body02.font
        textField.textColor = .black
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addGestureRecognizer(tapGesture)
        attribute()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func attribute() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 12*Constants.standardHeight
        self.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
    }
    
    func layout() {
        [titleLabel, textField]
            .forEach { self.addSubview($0) }
        
        titleLabel.snp.makeConstraints { make in
            make.width.equalTo(300*Constants.standardWidth)
            make.height.equalTo(17*Constants.standardHeight)
            make.top.equalToSuperview().offset(8*Constants.standardHeight)
            make.leading.equalToSuperview().offset(16*Constants.standardWidth)
        }
        
        textField.snp.makeConstraints { make in
            make.width.equalTo(300*Constants.standardWidth)
            make.height.equalTo(24*Constants.standardHeight)
            make.leading.equalToSuperview().offset(16*Constants.standardWidth)
            make.bottom.equalToSuperview().offset(-8*Constants.standardHeight)
        }
    }
}
