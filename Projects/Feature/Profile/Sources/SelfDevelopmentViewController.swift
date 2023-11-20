//
//  selfDevelopmentViewController.swift
//  FeatureProfile
//
//  Created by yoonyeosong on 2023/11/20.
//

import UIKit
import RxCocoa
import SharedDSKit

class SelfDevelopmentViewController: UIViewController {
    var selfDevelopmentView = SelfDevelopmentView()
    
    public override func loadView() {
            super.loadView()
            view = selfDevelopmentView
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ButtonTapped()
       
    }
    
    func ButtonTapped() {
        var buttonCount = 0
        var buttons = [selfDevelopmentView.selfDevelopmentButton1, selfDevelopmentView.selfDevelopmentButton2, selfDevelopmentView.selfDevelopmentButton3, selfDevelopmentView.selfDevelopmentButton4, selfDevelopmentView.selfDevelopmentButton5, selfDevelopmentView.selfDevelopmentButton6]
        for button in buttons {
            button.rx.tap.subscribe(onNext: {
                if button.isSelected == false {
                    button.isSelected = true
                    buttonCount += 1
                    button.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                    button.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
                } else {
                    button.isSelected = false
                    buttonCount -= 1
                    button.layer.borderColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1).cgColor
                    button.setTitleColor(SharedDSKitAsset.Colors.gr100.color, for: .normal)
                }
                if buttonCount != 0 {
                    self.selfDevelopmentView.nextButton.isEnabled = true
                    self.selfDevelopmentView.nextButton.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
                    self.selfDevelopmentView.nextButton.setTitleColor(SharedDSKitAsset.Colors.white.color, for: .normal)
                    
                } else{
                    self.selfDevelopmentView.nextButton.isEnabled = false
                    self.selfDevelopmentView.nextButton.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                    self.selfDevelopmentView.nextButton.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
                }
            })
        }
        
        
                    
        
    }

}
