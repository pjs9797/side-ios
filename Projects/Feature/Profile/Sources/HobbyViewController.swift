//
//  HobbyViewController.swift
//  FeatureProfile
//
//  Created by yoonyeosong on 2023/11/20.
//

import UIKit
import RxCocoa
import SharedDSKit

class HobbyViewController: UIViewController {
    var hobbyView = HobbyView()
    
    public override func loadView() {
        super.loadView()
        view = hobbyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ButtonTapped()
        navigationSetup()
    }
    
    func navigationSetup() {
        self.navigationItem.title = "프로필 설정"
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    func ButtonTapped() {
        var buttonCount = 0
        var buttons = [hobbyView.cafeButton, hobbyView.cultureButton, hobbyView.sportsButton, hobbyView.tripButton, hobbyView.danceButton, hobbyView.craftsButton, hobbyView.firendButton, hobbyView.bookButton, hobbyView.etcButton]
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
                           self.hobbyView.nextButton.isEnabled = true
                           self.hobbyView.nextButton.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
                           self.hobbyView.nextButton.setTitleColor(SharedDSKitAsset.Colors.white.color, for: .normal)

                       } else{
                           self.hobbyView.nextButton.isEnabled = false
                           self.hobbyView.nextButton.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                           self.hobbyView.nextButton.setTitleColor(SharedDSKitAsset.Colors.gr30.color, for: .normal)
                }
            })
        }
    }

}
