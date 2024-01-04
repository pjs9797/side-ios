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
    let regionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.setTitle("읍,면,동으로 검색하세요.", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.textDisabled.color, for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 16
        button.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        button.isEnabled = false
        return button
    }()
    
    init(){
        super.init(frame: .zero)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        [regionLabel,onlineLabel,onlineSwitch,regionButton]
            .forEach{ self.addSubview($0) }
        
        regionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview()
        }
        
        onlineLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(regionLabel.snp.bottom).offset(19.5)
        }
        
        onlineSwitch.snp.makeConstraints { make in
            make.width.equalTo(51)
            make.height.equalTo(31)
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalTo(onlineLabel)
        }
        
        regionButton.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(56)
            make.centerX.equalToSuperview()
            make.top.equalTo(onlineSwitch.snp.bottom).offset(16)
        }
        
        regionButton.titleLabel?.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
    }
}
