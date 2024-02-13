//
//  MyPageViewController.swift
//  FeatureMyPageInterface
//
//  Created by coco on 2023/12/15.
//

import UIKit
import Shared

public class MyPageViewController: UIViewController {
    let myPageView = MyPageView()
    
    public override func loadView() {
        super.loadView()
        
        self.view = myPageView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationbar()
        myPageView.modifyButton.addTarget(self, action: #selector(modifyButtonClicked), for: .touchUpInside)
    }
    
    func setNavigationbar() {
        title = "마이 페이지"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : Fonts.SH03Bold.font,
            .foregroundColor: SharedDSKitAsset.Colors.gr100.color
        ]
        
        let rightButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconSetting24.image, style: .plain, target: self, action: #selector(settingButtonTapped))
        rightButton.tintColor = SharedDSKitAsset.Colors.gr100.color
        navigationItem.rightBarButtonItem = rightButton
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        rightButton.tintColor = SharedDSKitAsset.Colors.gr100.color
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    @objc func settingButtonTapped() {
        let settingVC = SettingViewController()
        self.navigationController?.pushViewController(settingVC, animated: false)
    }
    
    @objc func modifyButtonClicked() {
        let modifyProfileVC = ModifyProfileViewController()
        self.navigationController?.pushViewController(modifyProfileVC, animated: false)
    }
}
