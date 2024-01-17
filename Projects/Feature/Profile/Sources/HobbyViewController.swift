//
//  HobbyViewController.swift
//  FeatureProfile
//
//  Created by yoonyeosong on 2023/11/20.
//

import UIKit
import RxCocoa
import SharedDSKit
import FeatureHome

public class HobbyViewController: UIViewController {
    var hobbyView = HobbyView()
    
    public override func loadView() {
        super.loadView()
        view = hobbyView
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        hobbyView.nextButton.isEnabled = false
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

        hobbyView.musicButton.rx.tap.subscribe(onNext: {
            if self.hobbyView.musicButton.isSelected == false {
                self.hobbyView.musicButton.isSelected = true
                buttonCount += 1
                self.hobbyView.musicImageView.layer.borderWidth = 1
                self.hobbyView.musicImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.hobbyView.musicLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.hobbyView.musicButton.isSelected = false
                buttonCount -= 1
                self.hobbyView.musicImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.hobbyView.musicLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        hobbyView.cultureButton.rx.tap.subscribe(onNext: {
            if self.hobbyView.cultureButton.isSelected == false {
                self.hobbyView.cultureButton.isSelected = true
                buttonCount += 1
                self.hobbyView.cultureImageView.layer.borderWidth = 1
                self.hobbyView.cultureImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.hobbyView.cultureLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.hobbyView.cultureButton.isSelected = false
                buttonCount -= 1
                self.hobbyView.cultureImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.hobbyView.cultureLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        hobbyView.sportsButton.rx.tap.subscribe(onNext: {
            if self.hobbyView.sportsButton.isSelected == false {
                self.hobbyView.sportsButton.isSelected = true
                buttonCount += 1
                self.hobbyView.sportsImageView.layer.borderWidth = 1
                self.hobbyView.sportsImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.hobbyView.sportsLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.hobbyView.sportsButton.isSelected = false
                buttonCount -= 1
                self.hobbyView.sportsImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.hobbyView.sportsLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        hobbyView.driveButton.rx.tap.subscribe(onNext: {
            if self.hobbyView.driveButton.isSelected == false {
                self.hobbyView.driveButton.isSelected = true
                buttonCount += 1
                self.hobbyView.driveImageView.layer.borderWidth = 1
                self.hobbyView.driveImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.hobbyView.driveLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.hobbyView.driveButton.isSelected = false
                buttonCount -= 1
                self.hobbyView.driveImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.hobbyView.driveLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        hobbyView.craftsButton.rx.tap.subscribe(onNext: {
            if self.hobbyView.craftsButton.isSelected == false {
                self.hobbyView.craftsButton.isSelected = true
                buttonCount += 1
                self.hobbyView.craftsImageView.layer.borderWidth = 1
                self.hobbyView.craftsImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.hobbyView.craftsLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.hobbyView.craftsButton.isSelected = false
                buttonCount -= 1
                self.hobbyView.craftsImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.hobbyView.craftsLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        hobbyView.danceButton.rx.tap.subscribe(onNext: {
            if self.hobbyView.danceButton.isSelected == false {
                self.hobbyView.danceButton.isSelected = true
                buttonCount += 1
                self.hobbyView.danceImageView.layer.borderWidth = 1
                self.hobbyView.danceImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.hobbyView.danceLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.hobbyView.danceButton.isSelected = false
                buttonCount -= 1
                self.hobbyView.danceImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.hobbyView.danceLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        hobbyView.friendsButton.rx.tap.subscribe(onNext: {
            if self.hobbyView.friendsButton.isSelected == false {
                self.hobbyView.friendsButton.isSelected = true
                buttonCount += 1
                self.hobbyView.friendsImageView.layer.borderWidth = 1
                self.hobbyView.friendsImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.hobbyView.friendsLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.hobbyView.friendsButton.isSelected = false
                buttonCount -= 1
                self.hobbyView.friendsImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.hobbyView.friendsLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        hobbyView.hotPlaceButton.rx.tap.subscribe(onNext: {
            if self.hobbyView.hotPlaceButton.isSelected == false {
                self.hobbyView.hotPlaceButton.isSelected = true
                buttonCount += 1
                self.hobbyView.hotPlaceImageView.layer.borderWidth = 1
                self.hobbyView.hotPlaceImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.hobbyView.hotPlaceLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.hobbyView.hotPlaceButton.isSelected = false
                buttonCount -= 1
                self.hobbyView.hotPlaceImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.hobbyView.hotPlaceLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        hobbyView.bookButton.rx.tap.subscribe(onNext: {
            if self.hobbyView.bookButton.isSelected == false {
                self.hobbyView.bookButton.isSelected = true
                buttonCount += 1
                self.hobbyView.bookImageView.layer.borderWidth = 1
                self.hobbyView.bookImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.hobbyView.bookLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.hobbyView.bookButton.isSelected = false
                buttonCount -= 1
                self.hobbyView.bookImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.hobbyView.bookLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        hobbyView.languageButton.rx.tap.subscribe(onNext: {
            if self.hobbyView.languageButton.isSelected == false {
                self.hobbyView.languageButton.isSelected = true
                buttonCount += 1
                self.hobbyView.languageImageView.layer.borderWidth = 1
                self.hobbyView.languageImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.hobbyView.languageLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.hobbyView.languageButton.isSelected = false
                buttonCount -= 1
                self.hobbyView.languageImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.hobbyView.languageLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        hobbyView.photoButton.rx.tap.subscribe(onNext: {
            if self.hobbyView.photoButton.isSelected == false {
                self.hobbyView.photoButton.isSelected = true
                buttonCount += 1
                self.hobbyView.photoImageView.layer.borderWidth = 1
                self.hobbyView.photoImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.hobbyView.photoLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.hobbyView.photoButton.isSelected = false
                buttonCount -= 1
                self.hobbyView.photoImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.hobbyView.photoLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        hobbyView.etcButton.rx.tap.subscribe(onNext: {
            if self.hobbyView.etcButton.isSelected == false {
                self.hobbyView.etcButton.isSelected = true
                buttonCount += 1
                self.hobbyView.etcImageView.layer.borderWidth = 1
                self.hobbyView.etcImageView.layer.borderColor = SharedDSKitAsset.Colors.lightGreen.color.cgColor
                self.hobbyView.etcLabel.textColor = SharedDSKitAsset.Colors.lightGreen.color
            } else {
                self.hobbyView.etcButton.isSelected = false
                buttonCount -= 1
                self.hobbyView.etcImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.hobbyView.etcLabel.textColor = SharedDSKitAsset.Colors.text01.color
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
        hobbyView.nextButton.rx.tap.subscribe(onNext: {
            let homeView = HomeViewController()
            let root = UINavigationController(rootViewController: homeView)
            self.view.window?.rootViewController = root
            homeView.navigationController?.navigationBar.shadowImage = UIImage()
  
//            self.navigationController?.pushViewController(homeView, animated: true)
//            self.view.window?.rootViewController = homeView
            self.view.window?.makeKeyAndVisible()
        })
    }
}
