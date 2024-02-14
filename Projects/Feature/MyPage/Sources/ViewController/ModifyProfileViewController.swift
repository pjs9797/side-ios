//
//  ModifyProfileViewController.swift
//  FeatureMyPageInterface
//
//  Created by coco on 2023/12/22.
//

import UIKit
import Shared

class ModifyProfileViewController: UIViewController {
    let modifyProfileView = ModifyProfileView()

    override func loadView() {
        super.loadView()
        
        self.view = modifyProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationbar()
        
        let tapUserImageGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped(sender:)))
        modifyProfileView.containerView.addGestureRecognizer(tapUserImageGesture)
        
        let tapPositionGesture = UITapGestureRecognizer(target: self, action: #selector(selectPositionTapped))
        modifyProfileView.positionView.addGestureRecognizer(tapPositionGesture)
    }
    
    func setNavigationbar() {
        self.navigationController?.navigationBar.tintColor = SharedDSKitAsset.Colors.gr100.color
        self.navigationItem.title = "프로필수정"
    }
    
    @objc func profileImageTapped(sender: UITapGestureRecognizer) {
        print(#function)
    }
    
    @objc func selectPositionTapped(sender: UITapGestureRecognizer) {
        let positionVC = SelectPositionViewController()
        positionVC.modalPresentationStyle = .overCurrentContext
        present(positionVC, animated: true)
    }
}
