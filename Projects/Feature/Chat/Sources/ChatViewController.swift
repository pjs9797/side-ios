//
//  ChatViewController.swift
//  FeatureChatInterface
//
//  Created by 강민성 on 11/21/23.
//

import UIKit

class ChatViewController: UIViewController {
    
    private let segmentedControl: UISegmentedControl = {
       let segmentedControl = UnderlineSegmentedControl(items: ["모임", "쪽지"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
