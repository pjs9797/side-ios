import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Shared

class CreateMeetingRegionView: UIView{
    let disposeBag = DisposeBag()
    let regionLabel: UILabel = {
        let label = UILabel()
        label.text = "모임 지역을 선택해주세요."
        label.font = Fonts.SH03Bold.font
        return label
    }()
    let onlineLabel: UILabel = {
        let label = UILabel()
        label.text = "온라인"
        label.font = Fonts.Body02.font
        return label
    }()
    let onlineSwitch: UISwitch = {
        let onlineSwitch = UISwitch()
        onlineSwitch.isOn = true
        return onlineSwitch
    }()
    let regionTextField: UITextField = {
        let textField = UITextField()
        textField.isEnabled = false
        textField.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        textField.placeholder = "읍,면,동으로 검색하세요."
        textField.font = Fonts.Body02.font
        textField.layer.borderWidth = 1
        textField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        textField.layer.cornerRadius = 16
        textField.addLeftPadding(width: 16)
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        [regionLabel,onlineLabel,onlineSwitch,regionTextField]
            .forEach{ self.addSubview($0) }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        regionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview()
        }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        onlineLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(regionLabel.snp.bottom).offset(19.5)
        }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        onlineSwitch.snp.makeConstraints { make in
            make.width.equalTo(51)
            make.height.equalTo(31)
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalTo(onlineLabel)
        }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        regionTextField.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(onlineSwitch.snp.bottom).offset(16)
        }
    }
}
