//
//  GatheringDetailNoDataViewController.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/26.
//

import UIKit
import Shared
import RxCocoa

public class GatheringDetailNoDataViewController: UIViewController {
    let gatheringDetailNoDataView = GatheringDetailNoDataView()
    
    public override func loadView() {
        super.loadView()
        view = gatheringDetailNoDataView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        buttonTapped()
    }
    
    func buttonTapped() {
        gatheringDetailNoDataView.infoButton.rx.tap.subscribe(onNext: {
            if self.gatheringDetailNoDataView.infoButton.isSelected == false {
                self.gatheringDetailNoDataView.scrollView.setContentOffset(CGPoint(x: 0,
                                                                             y: 350),
                                                                     animated: true)
                self.gatheringDetailNoDataView.infoButton.isSelected = true
                self.gatheringDetailNoDataView.infoButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
                self.gatheringDetailNoDataView.scheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.scheduleButton.isSelected = false
                self.gatheringDetailNoDataView.memberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.memberButton.isSelected = false
                
                self.gatheringDetailNoDataView.stickyInfoButton.isSelected = true
                self.gatheringDetailNoDataView.stickyInfoButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
                self.gatheringDetailNoDataView.stickyScheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyScheduleButton.isSelected = false
                self.gatheringDetailNoDataView.stickyMemberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyMemberButton.isSelected = false
                
            } else {
                self.gatheringDetailNoDataView.infoButton.isSelected = false
                self.gatheringDetailNoDataView.infoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyInfoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            }
        })
        
        gatheringDetailNoDataView.scheduleButton.rx.tap.subscribe(onNext: {
            if self.gatheringDetailNoDataView.scheduleButton.isSelected == false {
                self.gatheringDetailNoDataView.scrollView.setContentOffset(CGPoint(x: 0,
                                                                             y: 520),
                                                                     animated: true)
                self.gatheringDetailNoDataView.scheduleButton.isSelected = true
                self.gatheringDetailNoDataView.scheduleButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
                self.gatheringDetailNoDataView.infoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.infoButton.isSelected = false
                self.gatheringDetailNoDataView.memberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.memberButton.isSelected = false
                
                self.gatheringDetailNoDataView.stickyScheduleButton.isSelected = true
                self.gatheringDetailNoDataView.stickyScheduleButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
                self.gatheringDetailNoDataView.stickyInfoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyInfoButton.isSelected = false
                self.gatheringDetailNoDataView.stickyMemberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyMemberButton.isSelected = false
                
            } else {
                self.gatheringDetailNoDataView.scheduleButton.isSelected = false
                self.gatheringDetailNoDataView.scheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyScheduleButton.isSelected = false
                self.gatheringDetailNoDataView.stickyScheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            }
        })
        
        gatheringDetailNoDataView.memberButton.rx.tap.subscribe(onNext: {
            if self.gatheringDetailNoDataView.memberButton.isSelected == false {
                self.gatheringDetailNoDataView.scrollView.setContentOffset(CGPoint(x: 0,
                                                                             y: 720),
                                                                     animated: true)
                self.gatheringDetailNoDataView.memberButton.isSelected = true
                self.gatheringDetailNoDataView.memberButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
                self.gatheringDetailNoDataView.infoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.infoButton.isSelected = false
                self.gatheringDetailNoDataView.scheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.scheduleButton.isSelected = false
                
                self.gatheringDetailNoDataView.stickyMemberButton.isSelected = true
                self.gatheringDetailNoDataView.stickyMemberButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
                self.gatheringDetailNoDataView.stickyInfoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyInfoButton.isSelected = false
                self.gatheringDetailNoDataView.stickyScheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyScheduleButton.isSelected = false
            } else {
                self.gatheringDetailNoDataView.memberButton.isSelected = false
                self.gatheringDetailNoDataView.memberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyMemberButton.isSelected = false
                self.gatheringDetailNoDataView.stickyMemberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            }
        })
        
        gatheringDetailNoDataView.stickyInfoButton.rx.tap.subscribe(onNext: {
            if self.gatheringDetailNoDataView.stickyInfoButton.isSelected == false {
                self.gatheringDetailNoDataView.scrollView.setContentOffset(CGPoint(x: 0,
                                                                             y: 350),
                                                                     animated: true)
                self.gatheringDetailNoDataView.stickyInfoButton.isSelected = true
                self.gatheringDetailNoDataView.stickyInfoButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
                self.gatheringDetailNoDataView.stickyScheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyScheduleButton.isSelected = false
                self.gatheringDetailNoDataView.stickyMemberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyMemberButton.isSelected = false
                
                self.gatheringDetailNoDataView.infoButton.isSelected = true
                self.gatheringDetailNoDataView.infoButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
                self.gatheringDetailNoDataView.scheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.scheduleButton.isSelected = false
                self.gatheringDetailNoDataView.memberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.memberButton.isSelected = false
            } else {
                self.gatheringDetailNoDataView.stickyInfoButton.isSelected = false
                self.gatheringDetailNoDataView.infoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyInfoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            }
        })
        
        gatheringDetailNoDataView.stickyScheduleButton.rx.tap.subscribe(onNext: {
            if self.gatheringDetailNoDataView.stickyScheduleButton.isSelected == false {
                self.gatheringDetailNoDataView.scrollView.setContentOffset(CGPoint(x: 0,
                                                                             y: 520),
                                                                     animated: true)
                self.gatheringDetailNoDataView.stickyScheduleButton.isSelected = true
                self.gatheringDetailNoDataView.stickyScheduleButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
                self.gatheringDetailNoDataView.stickyInfoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyInfoButton.isSelected = false
                self.gatheringDetailNoDataView.stickyMemberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyMemberButton.isSelected = false
                
                self.gatheringDetailNoDataView.scheduleButton.isSelected = true
                self.gatheringDetailNoDataView.scheduleButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
                self.gatheringDetailNoDataView.infoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.infoButton.isSelected = false
                self.gatheringDetailNoDataView.memberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.memberButton.isSelected = false
            } else {
                self.gatheringDetailNoDataView.stickyScheduleButton.isSelected = false
                self.gatheringDetailNoDataView.scheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyScheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            }
        })
        
        gatheringDetailNoDataView.stickyMemberButton.rx.tap.subscribe(onNext: {
            if self.gatheringDetailNoDataView.stickyMemberButton.isSelected == false {
                self.gatheringDetailNoDataView.scrollView.setContentOffset(CGPoint(x: 0,
                                                                             y: 670),
                                                                     animated: true)
                self.gatheringDetailNoDataView.stickyMemberButton.isSelected = true
                self.gatheringDetailNoDataView.stickyMemberButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
                self.gatheringDetailNoDataView.stickyInfoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyInfoButton.isSelected = false
                self.gatheringDetailNoDataView.stickyScheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyScheduleButton.isSelected = false
                
                self.gatheringDetailNoDataView.memberButton.isSelected = true
                self.gatheringDetailNoDataView.memberButton.setTitleColor(SharedDSKitAsset.Colors.lightGreen.color, for: .normal)
                self.gatheringDetailNoDataView.infoButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.infoButton.isSelected = false
                self.gatheringDetailNoDataView.scheduleButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.scheduleButton.isSelected = false
            } else {
                self.gatheringDetailNoDataView.stickyMemberButton.isSelected = false
                self.gatheringDetailNoDataView.memberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
                self.gatheringDetailNoDataView.stickyMemberButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            }
        })
    }
}
