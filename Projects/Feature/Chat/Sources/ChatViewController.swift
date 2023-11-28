//
//  ChatViewController.swift
//  FeatureChat
//
//  Created by 강민성 on 11/21/23.
//

import UIKit
import Shared

import SnapKit

public class ChatViewController: UIViewController {
    
    private let mockUpLabel: UILabel = {
        let label = UILabel()
        label.text = "채팅"
        label.font = Fonts.SH03Bold.font
        label.textColor = SharedDSKitAsset.Colors.gr100.color
        label.textAlignment = .center
        return label
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UnderlineSegmentedControl(items: ["모임", "쪽지"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.setViewControllers([self.dataViewControllers[0]], direction: .forward, animated: true)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        return pageViewController
    }()
    
    var currentPage: Int = 0 {
        didSet {
            let direction: UIPageViewController.NavigationDirection = oldValue <= self.currentPage ? .forward : .reverse
            self.pageViewController.setViewControllers(
                [dataViewControllers[self.currentPage]],
                direction: direction,
                animated: true,
                completion: nil
            )
        }
    }
    
    var chattingListViewController = ChattingListViewController()
    
    var directMessageViewController = DirectMessageViewController()
    
    var dataViewControllers: [UIViewController] {
        [chattingListViewController, directMessageViewController]
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubViews([mockUpLabel, segmentedControl, pageViewController.view])
        
        mockUpLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(44)
            make.height.equalTo(56)
        }
        
        NSLayoutConstraint.activate([
            self.segmentedControl.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.segmentedControl.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.segmentedControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            self.segmentedControl.heightAnchor.constraint(equalToConstant: 49),
        ])
        
        NSLayoutConstraint.activate([
            self.pageViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 4),
            self.pageViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -4),
            self.pageViewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -4),
            self.pageViewController.view.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor, constant: 5),
        ])
        
        self.segmentedControl.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor:
                    SharedDSKitAsset.Colors.text03.color,
                .font: Fonts.Body02.font
            ],
            for: .normal)
        self.segmentedControl.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor:
                    SharedDSKitAsset.Colors.green.color,
                .font: Fonts.SH02Bold.font
            ],
            for: .selected
        )
        self.segmentedControl.addTarget(self, action: #selector(changeValue(control:)), for: .valueChanged)
        self.segmentedControl.selectedSegmentIndex = 0
        self.changeValue(control: self.segmentedControl)
        removeSwipeGesture()
    }
    
    @objc private func changeValue(control: UISegmentedControl) {
        self.currentPage = control.selectedSegmentIndex
    }
    
    func removeSwipeGesture(){
        for view in self.pageViewController.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = false
            }
        }
    }
}

extension ChatViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    public func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard
            let index = self.dataViewControllers.firstIndex(of: viewController),
            index - 1 >= 0
        else { return nil }
        return self.dataViewControllers[index - 1]
    }
    public func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard
            let index = self.dataViewControllers.firstIndex(of: viewController),
            index + 1 < self.dataViewControllers.count
        else { return nil }
        return self.dataViewControllers[index + 1]
    }
    public func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        guard
            let viewController = pageViewController.viewControllers?[0],
            let index = self.dataViewControllers.firstIndex(of: viewController)
        else { return }
        self.currentPage = index
        self.segmentedControl.selectedSegmentIndex = index
    }
}
