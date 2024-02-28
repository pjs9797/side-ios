//
//  selfDevelopmentViewController.swift
//  FeatureProfile
//
//  Created by yoonyeosong on 2023/11/20.
//

import UIKit
import RxCocoa
import SharedDSKit

public class SelfDevelopmentViewController: UIViewController {
    let selfDevelopmentView = SelfDevelopmentView()

    public override func loadView() {
        super.loadView()
        view = selfDevelopmentView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        ButtonTapped()
        navigationSetup()
    }

    func navigationSetup() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }

    func ButtonTapped() {
        var buttonCount = 0
        var buttons = [selfDevelopmentView.sideProjectButton, selfDevelopmentView.changeJobButton, selfDevelopmentView.studyButton, selfDevelopmentView.investmentButton, selfDevelopmentView.languageButton, selfDevelopmentView.etcButton]
        selfDevelopmentView.sideProjectButton.rx.tap.subscribe(onNext: {
            if self.selfDevelopmentView.sideProjectButton.isSelected == false {
                self.selfDevelopmentView.sideProjectButton.isSelected = true
                buttonCount += 1
                self.selfDevelopmentView.sideProjectImageView.layer.borderWidth = 1
                self.selfDevelopmentView.sideProjectImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.selfDevelopmentView.sideProjectLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.selfDevelopmentView.sideProjectButton.isSelected = false
                buttonCount -= 1
                self.selfDevelopmentView.sideProjectImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.selfDevelopmentView.sideProjectLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        selfDevelopmentView.changeJobButton.rx.tap.subscribe(onNext: {
            if self.selfDevelopmentView.changeJobButton.isSelected == false {
                self.selfDevelopmentView.changeJobButton.isSelected = true
                buttonCount += 1
                self.selfDevelopmentView.changeJobImageView.layer.borderWidth = 1
                self.selfDevelopmentView.changeJobImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.selfDevelopmentView.changeJobLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.selfDevelopmentView.changeJobButton.isSelected = false
                buttonCount -= 1
                self.selfDevelopmentView.changeJobImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.selfDevelopmentView.changeJobLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        selfDevelopmentView.studyButton.rx.tap.subscribe(onNext: {
            if self.selfDevelopmentView.studyButton.isSelected == false {
                self.selfDevelopmentView.studyButton.isSelected = true
                buttonCount += 1
                self.selfDevelopmentView.studyImageView.layer.borderWidth = 1
                self.selfDevelopmentView.studyImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.selfDevelopmentView.studyLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.selfDevelopmentView.studyButton.isSelected = false
                buttonCount -= 1
                self.selfDevelopmentView.studyImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.selfDevelopmentView.studyLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        selfDevelopmentView.investmentButton.rx.tap.subscribe(onNext: {
            if self.selfDevelopmentView.investmentButton.isSelected == false {
                self.selfDevelopmentView.investmentButton.isSelected = true
                buttonCount += 1
                self.selfDevelopmentView.investmentImageView.layer.borderWidth = 1
                self.selfDevelopmentView.investmentImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.selfDevelopmentView.investmentLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.selfDevelopmentView.investmentButton.isSelected = false
                buttonCount -= 1
                self.selfDevelopmentView.investmentImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.selfDevelopmentView.investmentLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        selfDevelopmentView.languageButton.rx.tap.subscribe(onNext: {
            if self.selfDevelopmentView.languageButton.isSelected == false {
                self.selfDevelopmentView.languageButton.isSelected = true
                buttonCount += 1
                self.selfDevelopmentView.languageImageView.layer.borderWidth = 1
                self.selfDevelopmentView.languageImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.selfDevelopmentView.languageLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.selfDevelopmentView.languageButton.isSelected = false
                buttonCount -= 1
                self.selfDevelopmentView.languageImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.selfDevelopmentView.languageLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        selfDevelopmentView.etcButton.rx.tap.subscribe(onNext: {
            if self.selfDevelopmentView.etcButton.isSelected == false {
                self.selfDevelopmentView.etcButton.isSelected = true
                buttonCount += 1
                self.selfDevelopmentView.etcImageView.layer.borderWidth = 1
                self.selfDevelopmentView.etcImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.selfDevelopmentView.etcLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.selfDevelopmentView.etcButton.isSelected = false
                buttonCount -= 1
                self.selfDevelopmentView.etcImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.selfDevelopmentView.etcLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        self.selfDevelopmentView.nextButton.rx.tap.subscribe(onNext:{
            let hobbyView = HobbyViewController()
            self.navigationController?.pushViewController(hobbyView, animated: false)
        })
    }
}
