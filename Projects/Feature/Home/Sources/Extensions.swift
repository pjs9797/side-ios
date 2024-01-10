import UIKit
import RxSwift
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

extension UIViewController {
    func hideKeyboard(disposeBag: DisposeBag) {
        let tapGesture = UITapGestureRecognizer()
        view.addGestureRecognizer(tapGesture)
        
        tapGesture.rx.event.bind { [unowned self] _ in
            self.view.endEditing(true)
        }.disposed(by: disposeBag)
    }
    
    func addKeyboardObserverInScrollView(scrollView: UIScrollView, disposeBag: DisposeBag) {
        NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification)
            .subscribe(onNext: { [weak self] notification in
                guard let self = self else { return }
                if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                    let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
                    scrollView.contentInset = contentInset
                    scrollView.scrollIndicatorInsets = contentInset

                    if let activeTextField = self.findFirstResponder(in: scrollView) {
                        let rect = activeTextField.convert(activeTextField.bounds, to: scrollView)
                        scrollView.scrollRectToVisible(rect, animated: true)
                    }
                }
            })
            .disposed(by: disposeBag)

        NotificationCenter.default.rx.notification(UIResponder.keyboardWillHideNotification)
            .subscribe(onNext: { _ in
                scrollView.contentInset = .zero
                scrollView.scrollIndicatorInsets = .zero
            })
            .disposed(by: disposeBag)
    }

    private func findFirstResponder(in view: UIView) -> UIView? {
        if view.isFirstResponder {
            return view
        }

        for subview in view.subviews {
            if let firstResponder = findFirstResponder(in: subview) {
                return firstResponder
            }
        }

        return nil
    }
}
