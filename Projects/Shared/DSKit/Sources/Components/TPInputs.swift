import UIKit
import SnapKit

public class TPInputs: UIView {
    public enum Default {
        public static var emailEnabledView: UIView = {
            let emailLabel: UILabel = {
                let label = UILabel()
                label.text = "이메일"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.gr80.color
                
                return label
            }()
            
            let textField: UITextField = {
                let textField = UITextField()
                textField.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요", attributes: [.font: Fonts.Body02.font, .foregroundColor: SharedDSKitAsset.Colors.gr30.color])
                
                return textField
            }()
            
            let helpLabel: UILabel = {
                let label = UILabel()
                label.text = "도움말 텍스트"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.text03.color
                
                return label
            }()
            
            let emailView: UIView = {
                let view = UIView()
                view.layer.borderWidth = 1
                view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                view.layer.cornerRadius = 16
                view.addSubViews([emailLabel, textField, helpLabel])
                
                return view
            }()
            
            return emailView
        }()
        
        public static var emailFocusedView: UIView = {
            let emailLabel: UILabel = {
                let label = UILabel()
                label.text = "이메일"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.gr80.color
                
                return label
            }()
            
            let textField: UITextField = {
                let textField = UITextField()
                textField.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요", attributes: [.font: Fonts.Body02.font, .foregroundColor: SharedDSKitAsset.Colors.gr30.color])
                
                return textField
            }()
            
            let helpLabel: UILabel = {
                let label = UILabel()
                label.text = "도움말 텍스트"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.text03.color
                
                return label
            }()
            
            let emailView: UIView = {
                let view = UIView()
                view.layer.borderWidth = 1
                view.layer.borderColor = SharedDSKitAsset.Colors.gr100.color.cgColor
                view.layer.cornerRadius = 16
                view.addSubViews([emailLabel, textField, helpLabel])
                
                return view
            }()
            
            return emailView
        }()
        
        public static var emailActiveView: UIView = {
            let emailLabel: UILabel = {
                let label = UILabel()
                label.text = "이메일"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.gr80.color
                
                return label
            }()
            
            let textField: UITextField = {
                let textField = UITextField()
                textField.attributedPlaceholder = NSAttributedString(string: "abc123@gma", attributes: [.font: Fonts.Body02.font, .foregroundColor: SharedDSKitAsset.Colors.gr30.color])
                
                return textField
            }()
            
            let helpLabel: UILabel = {
                let label = UILabel()
                label.text = "도움말 텍스트"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.text03.color
                
                return label
            }()
            
            let cancelButton: UIButton = {
                let button = UIButton()
                button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
                button.tintColor = SharedDSKitAsset.Colors.gr20.color
                
                return button
            }()
            
            let emailView: UIView = {
                let view = UIView()
                view.layer.borderWidth = 1
                view.layer.borderColor = SharedDSKitAsset.Colors.gr100.color.cgColor
                view.layer.cornerRadius = 16
                view.addSubViews([emailLabel, textField, helpLabel, cancelButton])
                
                return view
            }()
            
            return emailView
        }()
        
        public static var emailFilledView: UIView = {
            let emailLabel: UILabel = {
                let label = UILabel()
                label.text = "이메일"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.gr80.color
                
                return label
            }()
            
            let textField: UITextField = {
                let textField = UITextField()
                textField.attributedPlaceholder = NSAttributedString(string: "abc123@gma", attributes: [.font: Fonts.Body02.font, .foregroundColor: SharedDSKitAsset.Colors.gr30.color])
                
                return textField
            }()
            
            let helpLabel: UILabel = {
                let label = UILabel()
                label.text = "도움말 텍스트"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.text03.color
                
                return label
            }()
            
            let emailView: UIView = {
                let view = UIView()
                view.layer.borderWidth = 1
                view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                view.layer.cornerRadius = 16
                view.addSubViews([emailLabel, textField, helpLabel])
                
                return view
            }()
            
            return emailView
        }()
        
        public static var emailErrorView: UIView = {
            let emailLabel: UILabel = {
                let label = UILabel()
                label.text = "이메일"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.red.color
                
                return label
            }()
            
            let textField: UITextField = {
                let textField = UITextField()
                textField.attributedPlaceholder = NSAttributedString(string: "abc123@gma", attributes: [.font: Fonts.Body02.font, .foregroundColor: SharedDSKitAsset.Colors.gr30.color])
                
                return textField
            }()
            
            let helpLabel: UILabel = {
                let label = UILabel()
                label.text = "도움말 텍스트"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.red.color
                
                return label
            }()
            
            let cancelButton: UIButton = {
                let button = UIButton()
                button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
                button.tintColor = SharedDSKitAsset.Colors.gr20.color
                
                return button
            }()
            
            let warningImageView: UIImageView = {
                let imageView = UIImageView()
                imageView.image = UIImage(systemName: "exclamationmark.circle.fill")
                imageView.tintColor = SharedDSKitAsset.Colors.red.color
                
                return imageView
            }()
            
            let emailView: UIView = {
                let view = UIView()
                view.layer.borderWidth = 1
                view.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
                view.layer.cornerRadius = 16
                view.addSubViews([emailLabel, textField, helpLabel, cancelButton, warningImageView])
                
                return view
            }()
            
            return emailView
        }()
        
        public static var emailSuccessView: UIView = {
            let emailLabel: UILabel = {
                let label = UILabel()
                label.text = "이메일"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.red.color
                
                return label
            }()
            
            let textField: UITextField = {
                let textField = UITextField()
                textField.attributedPlaceholder = NSAttributedString(string: "abc123@gma", attributes: [.font: Fonts.Body02.font, .foregroundColor: SharedDSKitAsset.Colors.gr30.color])
                
                return textField
            }()
            
            let helpLabel: UILabel = {
                let label = UILabel()
                label.text = "성공 메세지"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.green.color
                
                return label
            }()
            
            let cancelButton: UIButton = {
                let button = UIButton()
                button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
                button.tintColor = SharedDSKitAsset.Colors.gr20.color
                
                return button
            }()
            
            let checkMarkImageView: UIImageView = {
                let imageView = UIImageView()
                imageView.image = UIImage(systemName: "checkmark")
                imageView.tintColor = SharedDSKitAsset.Colors.green.color
                
                return imageView
            }()
            
            let emailView: UIView = {
                let view = UIView()
                view.layer.borderWidth = 1
                view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                view.layer.cornerRadius = 16
                view.addSubViews([emailLabel, textField, helpLabel, cancelButton, checkMarkImageView])
                
                return view
            }()
            
            return emailView
        }()
        
        public static var emailDisabledView: UIView = {
            let emailLabel: UILabel = {
                let label = UILabel()
                label.text = "이메일"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.gr30.color
                label.backgroundColor = .none
                
                return label
            }()
            
            let textField: UITextField = {
                let textField = UITextField()
                textField.attributedPlaceholder = NSAttributedString(string: "abc123@gma", attributes: [.font: Fonts.Body02.font, .foregroundColor: SharedDSKitAsset.Colors.gr30.color])
                textField.backgroundColor = .none
                
                return textField
            }()
            
            let helpLabel: UILabel = {
                let label = UILabel()
                label.text = "도움말 텍스트"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.gr30.color
                label.backgroundColor = .none
                
                return label
            }()
            
            let emailView: UIView = {
                let view = UIView()
                view.layer.borderWidth = 1
                view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                view.layer.cornerRadius = 16
                view.backgroundColor = SharedDSKitAsset.Colors.gr30.color
                view.addSubViews([emailLabel, textField, helpLabel])
                
                return view
            }()
            
            return emailView
        }()
    }
    
    public enum Certification {
        public static var certificationEnabledView: UIView = {
            let phoneLabel: UILabel = {
                let label = UILabel()
                label.text = "전화번호"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.gr80.color
                
                return label
            }()
            
            let textField: UITextField = {
                let textField = UITextField()
                textField.attributedPlaceholder = NSAttributedString(string: "010-0000-0000", attributes: [.font: Fonts.Body02.font, .foregroundColor: SharedDSKitAsset.Colors.gr30.color])
                
                return textField
            }()
            
            let helpLabel: UILabel = {
                let label = UILabel()
                label.text = "도움말 텍스트"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.text03.color
                
                return label
            }()
            
            let certificationButton: UIButton = {
                let button = UIButton()
                button.setTitle("인증하기", for: .normal)
                button.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
                button.titleLabel?.font = Fonts.Caption.font
                button.backgroundColor = SharedDSKitAsset.Colors.gr10.color
                
                return button
            }()
            
            let phoneNumberView: UIView = {
                let view = UIView()
                view.layer.borderWidth = 1
                view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                view.layer.cornerRadius = 16
                view.addSubViews([phoneLabel, textField, certificationButton, helpLabel])
                
                return view
            }()
            
            return phoneNumberView
        }()
        
        public static var certificationFocusedView: UIView = {
            let phoneLabel: UILabel = {
                let label = UILabel()
                label.text = "전화번호"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.gr80.color
                
                return label
            }()
            
            let textField: UITextField = {
                let textField = UITextField()
                textField.attributedPlaceholder = NSAttributedString(string: "010-0000-0000", attributes: [.font: Fonts.Body02.font, .foregroundColor: SharedDSKitAsset.Colors.gr30.color])
                
                return textField
            }()
            
            let helpLabel: UILabel = {
                let label = UILabel()
                label.text = "도움말 텍스트"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.text03.color
                
                return label
            }()
            
            let certificationButton: UIButton = {
                let button = UIButton()
                button.setTitle("인증하기", for: .normal)
                button.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
                button.titleLabel?.font = Fonts.Caption.font
                button.backgroundColor = SharedDSKitAsset.Colors.gr10.color
                button.layer.borderWidth = 1
                button.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                button.layer.cornerRadius = 12
                
                return button
            }()
            
            let phoneNumberView: UIView = {
                let view = UIView()
                view.layer.borderWidth = 1
                view.layer.borderColor = SharedDSKitAsset.Colors.gr100.color.cgColor
                view.layer.cornerRadius = 16
                view.addSubViews([phoneLabel, textField, certificationButton, helpLabel])
                
                return view
            }()
            
            return phoneNumberView
        }()
        
        public static var certificationActiveView: UIView = {
            let phoneLabel: UILabel = {
                let label = UILabel()
                label.text = "전화번호"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.gr80.color
                
                return label
            }()
            
            let textField: UITextField = {
                let textField = UITextField()
                textField.textColor = SharedDSKitAsset.Colors.gr100.color
                textField.font = Fonts.Body02.font
                
                return textField
            }()
            
            let helpLabel: UILabel = {
                let label = UILabel()
                label.text = "도움말 텍스트"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.text03.color
                
                return label
            }()
            
            let certificationButton: UIButton = {
                let button = UIButton()
                button.setTitle("인증하기", for: .normal)
                button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
                button.titleLabel?.font = Fonts.Caption.font
                button.backgroundColor = SharedDSKitAsset.Colors.gr50.color
                button.layer.borderWidth = 1
                button.layer.borderColor = SharedDSKitAsset.Colors.gr50.color.cgColor
                button.layer.cornerRadius = 12
                
                return button
            }()
            
            let phoneNumberView: UIView = {
                let view = UIView()
                view.layer.borderWidth = 1
                view.layer.borderColor = SharedDSKitAsset.Colors.gr100.color.cgColor
                view.layer.cornerRadius = 16
                view.addSubViews([phoneLabel, textField, certificationButton, helpLabel])
                
                return view
            }()
            
            return phoneNumberView
        }()
        
        public static var certificationFilledView: UIView = {
            let phoneLabel: UILabel = {
                let label = UILabel()
                label.text = "전화번호"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.gr80.color
                
                return label
            }()
            
            let textField: UITextField = {
                let textField = UITextField()
                textField.textColor = SharedDSKitAsset.Colors.gr100.color
                textField.font = Fonts.Body02.font
                
                return textField
            }()
            
            let helpLabel: UILabel = {
                let label = UILabel()
                label.text = "도움말 텍스트"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.text03.color
                
                return label
            }()
            
            let certificationButton: UIButton = {
                let button = UIButton()
                button.setTitle("인증하기", for: .normal)
                button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
                button.titleLabel?.font = Fonts.Caption.font
                button.backgroundColor = SharedDSKitAsset.Colors.gr50.color
                button.layer.borderWidth = 1
                button.layer.borderColor = SharedDSKitAsset.Colors.gr50.color.cgColor
                button.layer.cornerRadius = 12
                
                return button
            }()
            
            let phoneNumberView: UIView = {
                let view = UIView()
                view.layer.borderWidth = 1
                view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                view.layer.cornerRadius = 16
                view.addSubViews([phoneLabel, textField, certificationButton, helpLabel])
                
                return view
            }()
            
            return phoneNumberView
        }()
        
        public static var certificationErrorView: UIView = {
            let phoneLabel: UILabel = {
                let label = UILabel()
                label.text = "전화번호"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.red.color
                
                return label
            }()
            
            let textField: UITextField = {
                let textField = UITextField()
                textField.textColor = SharedDSKitAsset.Colors.gr100.color
                textField.font = Fonts.Body02.font
                
                return textField
            }()
            
            let helpLabel: UILabel = {
                let label = UILabel()
                label.text = "올바른 전화번호를 입력해 주세요."
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.red.color
                
                return label
            }()
            
            let certificationButton: UIButton = {
                let button = UIButton()
                button.setTitle("인증하기", for: .normal)
                button.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
                button.titleLabel?.font = Fonts.Caption.font
                button.backgroundColor = SharedDSKitAsset.Colors.gr10.color
                button.layer.borderWidth = 1
                button.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                button.layer.cornerRadius = 12
                
                return button
            }()
            
            let warningImageView: UIImageView = {
                let imageView = UIImageView()
                imageView.image = UIImage(systemName: "exclamationmark.circle.fill")
                imageView.tintColor = SharedDSKitAsset.Colors.red.color
                
                return imageView
            }()
            
            let phoneNumberView: UIView = {
                let view = UIView()
                view.layer.borderWidth = 1
                view.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
                view.layer.cornerRadius = 16
                view.addSubViews([phoneLabel, textField, certificationButton, helpLabel, warningImageView])
                
                return view
            }()
            
            return phoneNumberView
        }()
        
        public static var certificationSuccessView: UIView = {
            let phoneLabel: UILabel = {
                let label = UILabel()
                label.text = "전화번호"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.gr80.color
                
                return label
            }()
            
            let textField: UITextField = {
                let textField = UITextField()
                textField.textColor = SharedDSKitAsset.Colors.gr100.color
                textField.font = Fonts.Body02.font
                
                return textField
            }()
            
            let helpLabel: UILabel = {
                let label = UILabel()
                label.text = "인증이 완료 되었습니다."
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.green.color
                
                return label
            }()
            
            let checkMarkImageView: UIImageView = {
                let imageView = UIImageView()
                imageView.image = UIImage(systemName: "checkmark")
                imageView.tintColor = SharedDSKitAsset.Colors.green.color
                
                return imageView
            }()
            
            let certificationButton: UIButton = {
                let button = UIButton()
                button.setTitle("인증하기", for: .normal)
                button.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
                button.titleLabel?.font = Fonts.Caption.font
                button.backgroundColor = SharedDSKitAsset.Colors.gr10.color
                button.layer.borderWidth = 1
                button.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                button.layer.cornerRadius = 12
                
                return button
            }()
            
            let phoneNumberView: UIView = {
                let view = UIView()
                view.layer.borderWidth = 1
                view.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
                view.layer.cornerRadius = 16
                view.addSubViews([phoneLabel, textField, certificationButton, helpLabel, checkMarkImageView])
                
                return view
            }()
            
            return phoneNumberView
        }()
        
        public static var certificationDisabledView: UIView = {
            let phoneLabel: UILabel = {
                let label = UILabel()
                label.text = "전화번호"
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.gr80.color
                label.backgroundColor = .none
                
                return label
            }()
            
            let textField: UITextField = {
                let textField = UITextField()
                textField.textColor = SharedDSKitAsset.Colors.gr100.color
                textField.font = Fonts.Body02.font
                textField.backgroundColor = .none
                
                return textField
            }()
            
            let helpLabel: UILabel = {
                let label = UILabel()
                label.text = "인증이 완료 되었습니다."
                label.font = Fonts.Caption.font
                label.textColor = SharedDSKitAsset.Colors.green.color
                
                return label
            }()
            
            let checkMarkImageView: UIImageView = {
                let imageView = UIImageView()
                imageView.image = UIImage(systemName: "checkmark")
                imageView.tintColor = SharedDSKitAsset.Colors.green.color
                
                return imageView
            }()
            
            let certificationButton: UIButton = {
                let button = UIButton()
                button.setTitle("인증하기", for: .normal)
                button.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
                button.titleLabel?.font = Fonts.Caption.font
                button.backgroundColor = SharedDSKitAsset.Colors.gr10.color
                button.layer.borderWidth = 1
                button.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                button.layer.cornerRadius = 12
                
                return button
            }()
            
            let phoneNumberView: UIView = {
                let view = UIView()
                view.layer.borderWidth = 1
                view.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
                view.layer.cornerRadius = 16
                view.addSubViews([phoneLabel, textField, certificationButton, helpLabel, checkMarkImageView])
                
                return view
            }()
            
            return phoneNumberView
        }()
    }
}
