//
//  NoCreatedGatheringViewController.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/11.
//

import UIKit

public class NoCreatedGatheringViewController: UIViewController {

    let noGatheringView = NoCreatedGatheringView()
    
    public override func loadView() {
        super.loadView()
        view = noGatheringView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}
