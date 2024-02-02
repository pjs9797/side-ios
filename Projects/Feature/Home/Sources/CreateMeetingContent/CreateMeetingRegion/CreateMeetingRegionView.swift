import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Shared

class CreateMeetingRegionView: UIView{
    let disposeBag = DisposeBag()
    weak var homeNavigationController: UINavigationController!
    let meetingRegionViewModel: MeetingRegionViewModel!
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
    
    init(homeNavigationController: UINavigationController?, meetingRegionViewModel: MeetingRegionViewModel){
        self.homeNavigationController = homeNavigationController
        self.meetingRegionViewModel = meetingRegionViewModel
        super.init(frame: .zero)
        
        bind()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind(){
        onlineSwitch.rx.isOn
            .bind(to: meetingRegionViewModel.onlineSwitchRelay)
            .disposed(by: disposeBag)
        
        meetingRegionViewModel.onlineSwitchRelay
            .bind(onNext: { [weak self] value in
                if value {
                    self?.regionButton.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                    self?.regionButton.isEnabled = false
                    self?.regionButton.setTitle("읍,면,동으로 검색하세요.", for: .normal)
                    self?.regionButton.setTitleColor(SharedDSKitAsset.Colors.textDisabled.color, for: .normal)
                }
                else{
                    self?.regionButton.backgroundColor = .white
                    self?.regionButton.isEnabled = true
                }
            })
            .disposed(by: disposeBag)
        
        regionButton.rx.tap
            .bind(onNext: { [weak self] in
                let meetingRegionViewModel = self?.meetingRegionViewModel
                self?.homeNavigationController.present(SelectMeetingRegionViewController(meetingRegionViewModel: meetingRegionViewModel!), animated: true)
            })
            .disposed(by: disposeBag)
        
        meetingRegionViewModel.regionButtonTitleRelay
            .bind(onNext: { [weak self] location in
                self?.regionButton.setTitle(location, for: .normal)
                self?.regionButton.setTitleColor(.black, for: .normal)
            })
            .disposed(by: disposeBag)
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
