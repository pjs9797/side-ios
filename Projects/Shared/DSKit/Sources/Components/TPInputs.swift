import UIKit
import SnapKit

public class TPInputs: UIView {
    public enum Default {
        public static var defaultEmailView: UIView = {
            let view = UIView()
            view.layer.borderWidth = 1
            view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            view.layer.cornerRadius = 16
            
            return view
        }()
        
        public static var focusedEmailView: UIView = {
            let view = UIView()
            view.layer.borderWidth = 1
            view.layer.borderColor = SharedDSKitAsset.Colors.gr100.color.cgColor
            view.layer.cornerRadius = 16
            
            return view
        }()
        
        public static var errorEmailView: UIView = {
            let view = UIView()
            view.layer.borderWidth = 1
            view.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
            view.layer.cornerRadius = 16
            
            return view
        }()
        
        public static var disabledEmailView: UIView = {
            let view = UIView()
            view.layer.borderWidth = 1
            view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            view.layer.cornerRadius = 16
            view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
            
            return view
        }()
        
        public static var defaulEmailLabel: UILabel = {
            let label = UILabel()
            label.text = "이메일"
            label.font = Fonts.Caption.font
            label.textColor = SharedDSKitAsset.Colors.gr80.color
            
            return label
        }()
        
        public static var errorEmailLabel: UILabel = {
            let label = UILabel()
            label.text = "이메일"
            label.font = Fonts.Caption.font
            label.textColor = SharedDSKitAsset.Colors.red.color
            
            return label
        }()
        
        public static var disabledEmailLabel: UILabel = {
            let label = UILabel()
            label.text = "이메일"
            label.font = Fonts.Caption.font
            label.textColor = SharedDSKitAsset.Colors.gr30.color
            label.backgroundColor = SharedDSKitAsset.Colors.gr10.color
            
            return label
        }()
        
        public static var defaultTextField: UITextField = {
            let textField = UITextField()
            textField.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요", attributes: [.font: Fonts.Body02.font, .foregroundColor: SharedDSKitAsset.Colors.gr30.color])
            
            return textField
        }()
        
        public static var disabledTextField: UITextField = {
            let textField = UITextField()
            textField.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요", attributes: [.font: Fonts.Body02.font, .foregroundColor: SharedDSKitAsset.Colors.gr30.color])
            textField.backgroundColor = SharedDSKitAsset.Colors.gr10.color
            
            return textField
        }()
        
        public static var defaultHelpLabel: UILabel = {
            let label = UILabel()
            label.text = "도움말 텍스트"
            label.font = Fonts.Caption.font
            label.textColor = SharedDSKitAsset.Colors.text03.color
            
            return label
        }()
        
        public static var errorHelpLabel: UILabel = {
            let label = UILabel()
            label.text = "도움말 텍스트"
            label.font = Fonts.Caption.font
            label.textColor = SharedDSKitAsset.Colors.red.color
            
            return label
        }()
        
        public static var disabledHelpLabel: UILabel = {
            let label = UILabel()
            label.text = "도움말 텍스트"
            label.font = Fonts.Caption.font
            label.textColor = SharedDSKitAsset.Colors.gr30.color
            
            return label
        }()
        
        public static var successHelpLabel: UILabel = {
            let label = UILabel()
            label.text = "도움말 텍스트"
            label.font = Fonts.Caption.font
            label.textColor = SharedDSKitAsset.Colors.green.color
            
            return label
        }()
        
        public static var cancelButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
            button.tintColor = SharedDSKitAsset.Colors.gr20.color
            
            return button
        }()
        
        public static var warningImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "exclamationmark.circle.fill")
            imageView.tintColor = SharedDSKitAsset.Colors.red.color
            
            return imageView
        }()
        
        public static var checkImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "checkmark")
            imageView.tintColor = SharedDSKitAsset.Colors.green.color
            
            return imageView
        }()
    }
    
    public enum Certification {
        public static var defaultView: UIView = {
            let view = UIView()
            view.layer.borderWidth = 1
            view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            view.layer.cornerRadius = 16
            
            return view
        }()
        
        public static var focusedView: UIView = {
            let view = UIView()
            view.layer.borderWidth = 1
            view.layer.borderColor = SharedDSKitAsset.Colors.gr100.color.cgColor
            view.layer.cornerRadius = 16
            
            return view
        }()
        
        public static var errorView: UIView = {
            let view = UIView()
            view.layer.borderWidth = 1
            view.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
            view.layer.cornerRadius = 16
            
            return view
        }()
        
        public static var disabledView: UIView = {
            let view = UIView()
            view.layer.borderWidth = 1
            view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            view.layer.cornerRadius = 16
            view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
            
            return view
        }()
        
        public static var defaultLabel: UILabel = {
            let label = UILabel()
            label.text = "전화번호"
            label.font = Fonts.Caption.font
            label.textColor = SharedDSKitAsset.Colors.gr80.color
            
            return label
        }()
        
        public static var errorLabel: UILabel = {
            let label = UILabel()
            label.text = "전화번호"
            label.font = Fonts.Caption.font
            label.textColor = SharedDSKitAsset.Colors.red.color
            
            return label
        }()
        
        public static var disabledLabel: UILabel = {
            let label = UILabel()
            label.text = "전화번호"
            label.font = Fonts.Caption.font
            label.textColor = SharedDSKitAsset.Colors.gr30.color
            label.backgroundColor = SharedDSKitAsset.Colors.gr10.color
            
            return label
        }()
        
        public static var textField: UITextField = {
            let textField = UITextField()
            textField.attributedPlaceholder = NSAttributedString(string: "010-000-0000", attributes: [.font: Fonts.Body02.font, .foregroundColor: SharedDSKitAsset.Colors.gr30.color])
            textField.textColor = SharedDSKitAsset.Colors.gr10.color
            
            return textField
        }()
        
        public static var disabledTextField: UITextField = {
            let textField = UITextField()
            textField.attributedPlaceholder = NSAttributedString(string: "010-000-0000", attributes: [.font: Fonts.Body02.font, .foregroundColor: SharedDSKitAsset.Colors.gr30.color])
            textField.backgroundColor = SharedDSKitAsset.Colors.gr10.color
            
            return textField
        }()
        
        public static var helpLabel: UILabel = {
            let label = UILabel()
            label.text = "도움말 텍스트"
            label.font = Fonts.Caption.font
            label.textColor = SharedDSKitAsset.Colors.text03.color
            
            return label
        }()
        
        public static var errorHelpLabel: UILabel = {
            let label = UILabel()
            label.text = "올바른 전화번호를 입력해 주세요."
            label.font = Fonts.Caption.font
            label.textColor = SharedDSKitAsset.Colors.red.color
            
            return label
        }()
        
        public static var completeHelpLabel: UILabel = {
            let label = UILabel()
            label.text = "인증이 완료 되었습니다."
            label.font = Fonts.Caption.font
            label.textColor = SharedDSKitAsset.Colors.green.color
            
            return label
        }()
        
        public static var disabledHelpLabel: UILabel = {
            let label = UILabel()
            label.text = "도움말 텍스트"
            label.font = Fonts.Caption.font
            label.textColor = SharedDSKitAsset.Colors.gr30.color
            label.backgroundColor = SharedDSKitAsset.Colors.gr10.color
            
            return label
        }()
        
        public static var grayButton: UIButton = {
            let button = UIButton()
            button.setTitle("인증하기", for: .normal)
            button.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
            button.titleLabel?.font = Fonts.Caption.font
            button.backgroundColor = SharedDSKitAsset.Colors.gr10.color
            
            return button
        }()
        
        public static var whiteButton: UIButton = {
            let button = UIButton()
            button.setTitle("인증하기", for: .normal)
            button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
            button.titleLabel?.font = Fonts.Caption.font
            button.backgroundColor = SharedDSKitAsset.Colors.white.color
            button.layer.borderWidth = 1
            button.layer.borderColor = SharedDSKitAsset.Colors.gr50.color.cgColor
            button.layer.cornerRadius = 12
            
            return button
        }()
        
        public static var warningImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "exclamationmark.circle.fill")
            imageView.tintColor = SharedDSKitAsset.Colors.red.color
            
            return imageView
        }()
        
        public static var checkImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "checkmark")
            imageView.tintColor = SharedDSKitAsset.Colors.green.color
            
            return imageView
        }()
    }
    
    public enum TextArea {
        public static var defaultView: UIView = {
            let view = UIView()
            view.layer.borderWidth = 1
            view.layer.cornerRadius = 16
            view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            
            return view
        }()
        
        public static var focusedView: UIView = {
            let view = UIView()
            view.layer.borderWidth = 1
            view.layer.cornerRadius = 16
            view.layer.borderColor = SharedDSKitAsset.Colors.gr100.color.cgColor
            
            return view
        }()
        
        public static var errorView: UIView = {
            let view = UIView()
            view.layer.borderWidth = 1
            view.layer.cornerRadius = 16
            view.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
            
            return view
        }()
        
        public static var defaultLabel: UILabel = {
            let label = UILabel()
            label.text = "Label"
            label.textColor = SharedDSKitAsset.Colors.text03.color
            
            return label
        }()
        
        public static var errorLabel: UILabel = {
            let label = UILabel()
            label.text = "Label"
            label.textColor = SharedDSKitAsset.Colors.red.color
            
            return label
        }()
        
        public static var textView: UITextView = {
            let textView = UITextView()
            
            return textView
        }()
        
        public static var helpLabel: UILabel = {
            let label = UILabel()
            label.text = "도움말 텍스트"
            label.font = Fonts.Caption.font
            label.textColor = SharedDSKitAsset.Colors.text03.color
            
            return label
        }()
        
        public static var errorHelpLabel: UILabel = {
            let label = UILabel()
            label.text = "세 글자 이상 입력해 주세요."
            label.font = Fonts.Caption.font
            label.textColor = SharedDSKitAsset.Colors.red.color
            
            return label
        }()
    }
    
    public enum ChatMessage {
        public static var defaultMessage: UITextView = {
            let textView = UITextView()
            textView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            textView.layer.borderWidth = 1
            textView.layer.cornerRadius = 24
            textView.backgroundColor = SharedDSKitAsset.Colors.gr10.color
            textView.textContainerInset = UIEdgeInsets(top: 8, left: 16, bottom: -8, right: -16)
            
            return textView
        }()
        
        public static var activeMessage: UITextView = {
            let textView = UITextView()
            textView.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
            textView.layer.borderWidth = 1
            textView.layer.cornerRadius = 24
            textView.backgroundColor = SharedDSKitAsset.Colors.gr10.color
            textView.textContainerInset = UIEdgeInsets(top: 8, left: 16, bottom: -8, right: -16)
            
            let button: UIButton = {
                let button = UIButton()
                button.setImage(UIImage(named: "icon-send-24"), for: .normal)
                button.tintColor = SharedDSKitAsset.Colors.lightGreen.color
                
                return button
            }()
            
            textView.addSubview(button)
            return textView
        }()
    }
}
