import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Shared

class CreateMeetingWritingView: UIView{
    let disposeBag = DisposeBag()
    let introductionLabel: UILabel = {
        let label = UILabel()
        label.text = "모임에 대한 소개글을 작성해주세요!"
        label.font = Fonts.SH03Bold.font
        return label
    }()
    let introductionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "자유롭게 소개글을 작성해 보세요!"
        textView.textColor = SharedDSKitAsset.Colors.textDisabled.color
        textView.font = Fonts.Body02.font
        textView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 16*Constants.standardHeight
        textView.addLeftPadding(width: 16*Constants.standardWidth)
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.introductionTextView.delegate = self
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        [introductionLabel,introductionTextView]
            .forEach{ self.addSubview($0) }
        introductionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.top.equalToSuperview()
        }
        introductionTextView.snp.makeConstraints { make in
            make.height.equalTo(176*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(introductionLabel.snp.bottom).offset(16*Constants.standardHeight)
        }
    }
}

extension CreateMeetingWritingView: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "자유롭게 소개글을 작성해 보세요!" && textView.textColor == SharedDSKitAsset.Colors.textDisabled.color {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "자유롭게 소개글을 작성해 보세요!"
            textView.textColor = SharedDSKitAsset.Colors.textDisabled.color
        }
    }
}
