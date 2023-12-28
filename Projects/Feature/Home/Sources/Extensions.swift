import UIKit
import Shared

extension UIButton {

    func enableNextButton() {
        setTitleColor(.white, for: .normal)
        layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
        backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
        isEnabled = true
    }

    func disableNextButton() {
        setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
        layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        isEnabled = false
    }
}

extension UITextField {
    func addLeftPadding(width: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}

extension UITextView {
    func addLeftPadding(width: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.addSubview(paddingView)
        self.textContainer.lineFragmentPadding = width
    }
}
