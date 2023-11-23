//
//  ChatViewController.swift
//  FeatureChatInterface
//
//  Created by 강민성 on 11/21/23.
//

import UIKit
import Shared

class ChatViewController: UIViewController {
    
    private let segmentedControl: UISegmentedControl = {
       let segmentedControl = UnderlineSegmentedControl(items: ["모임", "쪽지"])
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: SharedDSKitAsset.Colors.lightGreen.color], for: .selected)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: SharedDSKitAsset.Colors.text03.color], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : Fonts.SH02Bold.font], for: .selected)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : Fonts.Body02.font], for: .normal)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let chatListViewController = ChattingListViewController()
    
    private let directMessageViewController = DirectMessageViewController()
    
    var dataViewControllers = [ChattingListViewController(), DirectMessageViewController()]
    
    var currentPage: Int = 0 {
        didSet {
            let direction: UIPageViewController.NavigationDirection = oldValue <= self.currentPage ? .forward : .reverse
            pageViewController.setViewControllers([dataViewControllers[self.currentPage]], direction: direction, animated: true)
        }
    }
    
    private lazy var pageViewController: UIPageViewController = {
        let viewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        viewController.setViewControllers([self.dataViewControllers[0]], direction: .forward, animated: true)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        viewController.delegate = self
        viewController.dataSource = self
        
        return viewController
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension ChatViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = self.dataViewControllers.firstIndex(of: viewController), index - 1 >= 0  else { return nil }
        return self.dataViewControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = self.dataViewControllers.firstIndex(of: viewController), index + 1 < self.dataViewControllers.count  else { return nil }
        return self.dataViewControllers[index + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewController = pageViewController.viewControllers?[0], let index = self.dataViewControllers.firstIndex(of: viewController) else { return }
        
        self.currentPage = index
        self.segmentedControl.selectedSegmentIndex = index
    }
    

    
}
