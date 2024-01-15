//
//  InquiryViewController.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/26.
//

import UIKit
import Shared

public class InquiryViewController: UIViewController {
    let inquiryView = InquiryView()
    let placeholder = "문의하실 내용을 입력해주세요"
    
    public override func loadView() {
        super.loadView()
        view = inquiryView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView()
    }
    
    func setupTextView() {
        inquiryView.textView.delegate = self
        inquiryView.textView.text = placeholder
        inquiryView.textView.textColor = SharedDSKitAsset.Colors.textDisabled.color
        inquiryView.textView.font = Fonts.Body02.font
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension InquiryViewController: UITextViewDelegate {
    public func textViewDidBeginEditing(_ textView: UITextView) {
        if inquiryView.textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            inquiryView.textView.textColor = SharedDSKitAsset.Colors.textDisabled.color
            inquiryView.textView.text = placeholder
        } else if inquiryView.textView.text == placeholder{
            inquiryView.textView.textColor = .black
            inquiryView.textView.text = nil
        }
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        inquiryView.textView.layer.borderWidth = 0
        if inquiryView.textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || inquiryView.textView.text == placeholder {
            inquiryView.textView.textColor = SharedDSKitAsset.Colors.textDisabled.color
            inquiryView.textView.text = placeholder
        }
    }
}
