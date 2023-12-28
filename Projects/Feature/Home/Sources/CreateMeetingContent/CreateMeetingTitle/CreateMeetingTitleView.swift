import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Shared

class CreateMeetingTitleView: UIView{
    let disposeBag = DisposeBag()
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "모임 게시글의 제목을 써주세요."
        label.font = Fonts.SH03Bold.font
        return label
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "게시글 제목에는 정확한 목적을 기재하면 지원률이 높아집니다!"
        label.font = Fonts.Body02.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "제목을 입력해 주세요."
        textField.font = Fonts.Body02.font
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 1
        textField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
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
        [subTitleLabel,descriptionLabel,titleTextField]
            .forEach{ self.addSubview($0) }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        subTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview()
        }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(subTitleLabel.snp.bottom).offset(8)
        }
<<<<<<< HEAD
        
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        titleTextField.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            make.bottom.equalToSuperview()
        }
    }
}
