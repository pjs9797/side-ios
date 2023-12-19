import UIKit
import SnapKit
import Shared

class TagViewOne: UIView {
    /// 태그 버튼을 저장할 배열
    private var tagButtons = [UIButton]()
    /// 버튼 간 가로 간격
    private let horizontalSpacing: CGFloat = 8
    /// 버튼 간 세로 간격
    private let verticalSpacing: CGFloat = 8
    /// 버튼의 높이
    private let tagHeight: CGFloat = 40
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// 버튼이 클릭됐을 때 호출되는 메서드
    @objc private func buttonClicked(sender: UIButton) {
        print("Button clicked")
    }
    
    /// 태그를 추가하는 메서드
    func addTag(tag: String) {
        let tagButton = UIButton()
        tagButton.setTitle(tag, for: .normal)
        tagButton.backgroundColor = UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1)
        tagButton.layer.cornerRadius = 16
        
        let attribute = NSAttributedString(string: tag, attributes: [
            .font: Fonts.SH01.font,
            .foregroundColor: SharedDSKitAsset.Colors.gr100.color
        ])
        
        tagButton.setAttributedTitle(attribute, for: .normal)
        tagButton.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        
        self.addSubview(tagButton)
        tagButtons.append(tagButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var xOffset: CGFloat = horizontalSpacing
        var yOffset: CGFloat = verticalSpacing
        let maxWidth = self.frame.width
        
        tagButtons.forEach { button in
            /// 20은 내부 여백
            let buttonSize = button.intrinsicContentSize.width + 56
            button.titleEdgeInsets = .init(top: 10, left: 10, bottom: 10, right: 40)
            
            let cancelButton = UIButton()
            cancelButton.setImage(SharedDSKitAsset.Icons.iconDelect16.image, for: .normal)
            cancelButton.tintColor = SharedDSKitAsset.Colors.gr100.color
            button.addSubview(cancelButton)
            
            cancelButton.snp.makeConstraints {
                $0.width.height.equalTo(16)
                $0.centerY.equalToSuperview()
                $0.trailing.equalToSuperview().inset(16)
            }
            
            /// 현재 줄에 버튼이 맞지 않으면 다음 줄로 이동
            if xOffset + buttonSize + horizontalSpacing > maxWidth {
                xOffset = horizontalSpacing
                yOffset += tagHeight + verticalSpacing
            }
            
            /// 버튼의 프레임 설정
            button.frame = CGRect(x: xOffset, y: yOffset, width: buttonSize, height: tagHeight)
            
            /// 다음 버튼의 x 오프셋 업데이트
            xOffset += buttonSize + horizontalSpacing
        }
    }
}
