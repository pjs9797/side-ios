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
        view.layer.cornerRadius = 16
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
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        memberLimitLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview()
        }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        memberView.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(memberLimitLabel.snp.bottom).offset(16)
        }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        maximumLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        unitLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        memberLimitTextField.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(24)
            make.trailing.equalTo(unitLabel.snp.leading).offset(-8)
            make.centerY.equalToSuperview()
        }
    }
}
