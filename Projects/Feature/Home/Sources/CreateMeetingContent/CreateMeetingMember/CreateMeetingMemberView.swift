import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Shared

class CreateMeetingMemberView: UIView{
    let disposeBag = DisposeBag()
    let memberLimitLabel: UILabel = {
        let label = UILabel()
        label.text = "모임에는 몇 명까지 가입할 수 있나요?"
        label.font = Fonts.SH03Bold.font
        return label
    }()
    let memberView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16*Constants.standardHeight
        view.layer.borderWidth = 1
        view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        return view
    }()
    let maximumLabel: UILabel = {
        let label = UILabel()
        label.text = "최대"
        label.font = Fonts.Body02.font
        return label
    }()
    let memberLimitTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "100"
        textField.textAlignment = .right
        textField.keyboardType = .numberPad
        return textField
    }()
    let unitLabel: UILabel = {
        let label = UILabel()
        label.text = "명"
        label.font = Fonts.Body02.font
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        [memberLimitLabel,memberView]
            .forEach{ self.addSubview($0) }
        [maximumLabel,memberLimitTextField,unitLabel]
            .forEach{ memberView.addSubview($0) }
        
        memberLimitLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.top.equalToSuperview()
        }
        
        memberView.snp.makeConstraints { make in
            make.height.equalTo(56*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(memberLimitLabel.snp.bottom).offset(16*Constants.standardHeight)
        }
        
        maximumLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16*Constants.standardWidth)
            make.centerY.equalToSuperview()
        }
        
        unitLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16*Constants.standardWidth)
            make.centerY.equalToSuperview()
        }
        
        memberLimitTextField.snp.makeConstraints { make in
            make.width.equalTo(200*Constants.standardWidth)
            make.height.equalTo(24*Constants.standardHeight)
            make.trailing.equalTo(unitLabel.snp.leading).offset(-8*Constants.standardWidth)
            make.centerY.equalToSuperview()
        }
    }
}
