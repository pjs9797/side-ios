//
//  ChattingRoomContainerViewController.swift
//  FeatureChat
//
//  Created by 강민성 on 12/4/23.
//

import UIKit
import RxSwift
import RxCocoa

enum ContentViewControllerPresentation {
    case embed(ChattingRoomViewController)
    case push(UIViewController)
    case modal(UIViewController)
}

public class ChattingRoomContainerViewController: UIViewController {
    
    private var sideMenuViewController: ChattingRoomSideMenuViewController!
    private var navigator: UINavigationController!
    private var chattingRoomViewController: ChattingRoomViewController! {
        didSet {
            chattingRoomViewController.delegate = self
            navigator.setViewControllers([chattingRoomViewController], animated: false)
        }
    }
    
    convenience init(sideMenuViewController: ChattingRoomSideMenuViewController, chattingRoomViewController: ChattingRoomViewController) {
        self.init()
        self.sideMenuViewController = sideMenuViewController
        self.chattingRoomViewController = chattingRoomViewController
        self.navigator = UINavigationController(rootViewController: chattingRoomViewController)
    }
    
    public override func viewDidLoad() {
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
    
    func itemSelected(item: ContentViewControllerPresentation) {
        switch item {
        case let .embed(viewController):
            updateRootViewController(viewController)
            sideMenuViewController.hide()
        case let .push(viewController):
            sideMenuViewController.hide()
            navigator.pushViewController(viewController, animated: true)
        case let .modal(viewController):
            sideMenuViewController.hide()
            navigator.present(viewController, animated: true, completion: nil)
        }
    }
}


public final class ChattingRoomContainerViewComposer {
    public static func makeContainer() -> ChattingRoomContainerViewController {
        let chattingRoomViewController = ChattingRoomViewController()
        let sideMenuViewController = ChattingRoomSideMenuViewController()
        let sideMenuItems = [SideMenuItem(roomTitle: <#T##String#>, date: <#T##String#>, albumImage: <#T##[UIImage]#>, members: <#T##[String]#>, viewController: <#T##ChattingRoomViewController#>)]
        let container = ChattingRoomContainerViewController(sideMenuViewController: sideMenuViewController, chattingRoomViewController: chattingRoomViewController)
        
        return container
    }
}
