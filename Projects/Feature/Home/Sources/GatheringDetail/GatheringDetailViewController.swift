//
//  GatheringDetailViewController.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/25.
//

import UIKit
import Shared

public class GatheringDetailViewController: UIViewController {
    let gatheringDetailView = GatheringDetailView()
    
    public override func loadView() {
        super.loadView()
        view = gatheringDetailView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        buttonTapped()
    }
    func infoButtonTapped() {
        if self.gatheringDetailView.infoButton.isSelected == true {
            self.gatheringDetailView.infoButton.isSelected = false
            self.gatheringDetailView.infoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.stickyInfoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        } else {
            self.gatheringDetailView.scrollView.setContentOffset(CGPoint(x: 0,
                                                                         y: 350),
                                                                 animated: true)
            self.gatheringDetailView.infoButton.isSelected = true
            self.gatheringDetailView.infoButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
            self.gatheringDetailView.scheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.scheduleButton.isSelected = false
            self.gatheringDetailView.memberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.memberButton.isSelected = false
            
            self.gatheringDetailView.stickyInfoButton.isSelected = true
            self.gatheringDetailView.stickyInfoButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
            self.gatheringDetailView.stickyScheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.stickyScheduleButton.isSelected = false
            self.gatheringDetailView.stickyMemberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.stickyMemberButton.isSelected = false
        }
    }
    
    func scheduleButtonTapped() {
        if self.gatheringDetailView.scheduleButton.isSelected == true {
            self.gatheringDetailView.scheduleButton.isSelected = false
            self.gatheringDetailView.scheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.stickyScheduleButton.isSelected = false
            self.gatheringDetailView.stickyScheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        } else {
            self.gatheringDetailView.scrollView.setContentOffset(CGPoint(x: 0,
                                                                         y: 520),
                                                                 animated: true)
            self.gatheringDetailView.scheduleButton.isSelected = true
            self.gatheringDetailView.scheduleButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
            self.gatheringDetailView.infoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.infoButton.isSelected = false
            self.gatheringDetailView.memberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.memberButton.isSelected = false
            
            self.gatheringDetailView.stickyScheduleButton.isSelected = true
            self.gatheringDetailView.stickyScheduleButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
            self.gatheringDetailView.stickyInfoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.stickyInfoButton.isSelected = false
            self.gatheringDetailView.stickyMemberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.stickyMemberButton.isSelected = false
        }
    }
    
    func memberButtonTapped() {
        if self.gatheringDetailView.memberButton.isSelected == true {
            self.gatheringDetailView.memberButton.isSelected = false
            self.gatheringDetailView.memberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.stickyMemberButton.isSelected = false
            self.gatheringDetailView.stickyMemberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        } else {
            self.gatheringDetailView.scrollView.setContentOffset(CGPoint(x: 0,
                                                                         y: 720),
                                                                 animated: true)
            self.gatheringDetailView.memberButton.isSelected = true
            self.gatheringDetailView.memberButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
            self.gatheringDetailView.infoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.infoButton.isSelected = false
            self.gatheringDetailView.scheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.scheduleButton.isSelected = false
            
            self.gatheringDetailView.stickyMemberButton.isSelected = true
            self.gatheringDetailView.stickyMemberButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
            self.gatheringDetailView.stickyInfoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.stickyInfoButton.isSelected = false
            self.gatheringDetailView.stickyScheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.stickyScheduleButton.isSelected = false
        }
    }
    
    func stickyInfoButtonTapped() {
        if self.gatheringDetailView.stickyInfoButton.isSelected == true {
            self.gatheringDetailView.stickyInfoButton.isSelected = false
            self.gatheringDetailView.infoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.stickyInfoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        } else {
            self.gatheringDetailView.scrollView.setContentOffset(CGPoint(x: 0,
                                                                         y: 350),
                                                                 animated: true)
            self.gatheringDetailView.stickyInfoButton.isSelected = true
            self.gatheringDetailView.stickyInfoButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
            self.gatheringDetailView.stickyScheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.stickyScheduleButton.isSelected = false
            self.gatheringDetailView.stickyMemberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.stickyMemberButton.isSelected = false
            
            self.gatheringDetailView.infoButton.isSelected = true
            self.gatheringDetailView.infoButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
            self.gatheringDetailView.scheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.scheduleButton.isSelected = false
            self.gatheringDetailView.memberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.memberButton.isSelected = false
        }
    }
    
    func stickyScheduleButtonTapped() {
        if self.gatheringDetailView.stickyScheduleButton.isSelected == true {
            self.gatheringDetailView.stickyScheduleButton.isSelected = false
            self.gatheringDetailView.scheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.stickyScheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        } else {
            self.gatheringDetailView.scrollView.setContentOffset(CGPoint(x: 0,
                                                                         y: 520),
                                                                 animated: true)
            self.gatheringDetailView.stickyScheduleButton.isSelected = true
            self.gatheringDetailView.stickyScheduleButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
            self.gatheringDetailView.stickyInfoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.stickyInfoButton.isSelected = false
            self.gatheringDetailView.stickyMemberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.stickyMemberButton.isSelected = false
            
            self.gatheringDetailView.scheduleButton.isSelected = true
            self.gatheringDetailView.scheduleButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
            self.gatheringDetailView.infoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.infoButton.isSelected = false
            self.gatheringDetailView.memberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.gatheringDetailView.memberButton.isSelected = false
        }
    }
    
    func buttonTapped() {
        gatheringDetailView.infoButton.rx.tap.subscribe(onNext: {
            self.infoButtonTapped()
        })
        
        gatheringDetailView.scheduleButton.rx.tap.subscribe(onNext: {
            self.scheduleButtonTapped()
        })
        
        gatheringDetailView.memberButton.rx.tap.subscribe(onNext: {
            self.memberButtonTapped()
        })
        
        gatheringDetailView.stickyInfoButton.rx.tap.subscribe(onNext: {
            self.stickyInfoButtonTapped()
        })
        
        gatheringDetailView.stickyScheduleButton.rx.tap.subscribe(onNext: {
            self.stickyScheduleButtonTapped()
        })
        
        gatheringDetailView.stickyMemberButton.rx.tap.subscribe(onNext: {
            if self.gatheringDetailView.stickyMemberButton.isSelected == false {
                self.gatheringDetailView.scrollView.setContentOffset(CGPoint(x: 0,
                                                                             y: 720),
                                                                     animated: true)
                self.gatheringDetailView.stickyMemberButton.isSelected = true
                self.gatheringDetailView.stickyMemberButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
                self.gatheringDetailView.stickyInfoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailView.stickyInfoButton.isSelected = false
                self.gatheringDetailView.stickyScheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailView.stickyScheduleButton.isSelected = false
                
                self.gatheringDetailView.memberButton.isSelected = true
                self.gatheringDetailView.memberButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
                self.gatheringDetailView.infoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailView.infoButton.isSelected = false
                self.gatheringDetailView.scheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailView.scheduleButton.isSelected = false
                
            } else {
                self.gatheringDetailView.stickyMemberButton.isSelected = false
                self.gatheringDetailView.memberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailView.stickyMemberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            }
        })
    }
}
