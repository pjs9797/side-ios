//
//  MakeNoticeViewController.swift
//  FeatureChat
//
//  Created by 강민성 on 12/20/23.
//

import UIKit
import Shared

class MakeNoticeViewController: UIViewController {
    
    var noticeTextView: UITextView = {
        var textView = UITextView()
        textView.backgroundColor = SharedDSKitAsset.Colors.bgLightGray.color
        textView.textContainerInset = UIEdgeInsets(top: 16, left: 20, bottom: 8, right: 20)
        textView.text = "멤버들에게 필요한 내용으로 작성해주세요"
        textView.font = Fonts.Body02.font
        textView.textColor = SharedDSKitAsset.Colors.textDisabled.color
        textView.isScrollEnabled = false
        textView.showsVerticalScrollIndicator = false
        textView.sizeToFit()
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noticeTextView.delegate = self
        render()
    }
    
    private func render() {
        
        view.addSubViews([noticeTextView])
        
        noticeTextView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(view.keyboardLayoutGuide.snp.top)
        }
        
        let dismissBarButtonItem = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconArrowClose24.image, style: .plain, target: self, action: #selector(tapDismissButton))
        let postBarButtonItem = UIBarButtonItem(title: "게시", style: .plain, target: self, action: #selector(tapPostButton))
        
        navigationItem.title = "공지 올리기"
        navigationItem.setRightBarButton(postBarButtonItem, animated: true)
        navigationItem.setLeftBarButton(dismissBarButtonItem, animated: true)
    }
    
    @objc private func tapPostButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func tapDismissButton() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension MakeNoticeViewController: UITextViewDelegate {
    public func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "멤버들에게 필요한 내용으로 작성해주세요" {
            textView.text = nil
            textView.textColor = SharedDSKitAsset.Colors.gr100.color
        }
    }
}
