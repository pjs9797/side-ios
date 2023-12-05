//
//  ChattingRoomContainerViewController.swift
//  FeatureChat
//
//  Created by 강민성 on 12/4/23.
//

import UIKit
import RxSwift
import RxCocoa

class ChattingRoomContainerViewController: UIViewController {

    private var sideMenuViewController: ChattingRoomSideMenuViewController!
    private var navigator: UINavigationController!
    private var chattingRoomViewController: ChattingRoomViewController! {
        didSet {
            chattingRoomViewController.delegate = self
            navigator.setViewControllers([chattingRoomViewController], animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        configureGestures()
        addChildViewController()
    }
    
    
    private func setUp() {
        sideMenuViewController.delegate = self
        chattingRoomViewController.delegate = self
    }
    
    private func configureGestures() {
        let swipeToLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeToLeft))
        swipeToLeftGesture.direction = .left
        swipeToLeftGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeToLeftGesture)
        
        let swipeToRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeToRight))
        swipeToRightGesture.direction = .right
        swipeToRightGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeToRightGesture)
    }
    
    @objc private func swipeToLeft() {
        sideMenuViewController.show()
    }
    
    @objc private func swipeToRight() {
        sideMenuViewController.hide()
    }
    
    private func addChildViewController() {
        addChild(navigator)
        view.addSubview(navigator.view)
        navigator.didMove(toParent: self)
        
        addChild(sideMenuViewController)
        view.addSubview(sideMenuViewController.view)
        sideMenuViewController.didMove(toParent: self)
    }
    
    
}

extension ChattingRoomContainerViewController: ChattingRoomSideMenuDelegate {
    func menuButtonTapped() {
        sideMenuViewController.show()
    }
}
