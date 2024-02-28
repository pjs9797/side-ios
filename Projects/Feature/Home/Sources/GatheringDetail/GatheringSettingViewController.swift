//
//  GatheringSettingViewController.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2024/01/28.
//

import UIKit

public class GatheringSettingViewController: UIViewController {
    let gatheringSettingView = GatheringSettingView()
    
    public override func loadView() {
        super.loadView()
        view = gatheringSettingView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}
