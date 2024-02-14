//
//  SelectPositionViewController.swift
//  FeatureMyPageInterface
//
//  Created by coco on 2023/12/25.
//
import UIKit
import Shared

class SelectPositionViewController: UIViewController {
    let selectPositionView = SelectPositionView()
    
    override func loadView() {
        super.loadView()
        view = selectPositionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapDimmedView))
        selectPositionView.dimmedView.addGestureRecognizer(tapGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        selectPositionView.topBarView.addGestureRecognizer(panGesture)
    }
    
    @objc func handleTapDimmedView() {
        dismiss(animated: true)
    }
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        dismiss(animated: true)
    }
}
