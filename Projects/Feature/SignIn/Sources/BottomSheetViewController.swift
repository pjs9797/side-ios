//
//  BottomSheetViewController.swift
//  FeatureSignIn
//
//  Created by 강민성 on 1/10/24.
//

import UIKit
import Shared

public class BottomSheetViewController: UIViewController {
    
    private let dimmedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        view.alpha = 0
        return view
    }()
    
    private let bottomSheetView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.cornerCurve = .continuous
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    private let dragIndicator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = SharedDSKitAsset.Colors.gr10.color
        view.layer.cornerRadius = 3
        return view
    }()
    
    private let contentViewController: UIViewController
    
    private var bottomSheetViewTopConstraint: NSLayoutConstraint!
    
    private lazy var bottomSheetPanStartingTopConstant: CGFloat = 40
    
    public init(contentViewController: UIViewController) {
        self.contentViewController = contentViewController
        
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        render()
        configureGestures()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.showBottomSheet()
    }
    
    public override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate { [weak self] _ in
            self?.showBottomSheet()
        }
    }
    
    private func render() {
        view.addSubViews([dimmedView, bottomSheetView, dragIndicator])
        addChild(contentViewController)
        
        bottomSheetView.addSubViews([contentViewController.view])
        
        contentViewController.didMove(toParent: self)
        bottomSheetView.clipsToBounds = true
        
        dimmedView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        bottomSheetViewTopConstraint =
        bottomSheetView
            .topAnchor
            .constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: view.safeAreaLayoutGuide.layoutFrame.height
            )
        
        NSLayoutConstraint.activate([
                    bottomSheetView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                    bottomSheetView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                    bottomSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    bottomSheetViewTopConstraint,
                ]
        )
        
        contentViewController.view.translatesAutoresizingMaskIntoConstraints = false
        contentViewController.view.snp.makeConstraints { make in
            make.leading.equalTo(bottomSheetView.snp.leading)
            make.top.equalTo(bottomSheetView.snp.top)
            make.trailing.equalTo(bottomSheetView.snp.trailing)
            make.bottom.equalTo(bottomSheetView.snp.bottom)
        }
        
        dragIndicator.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(bottomSheetView.snp.top).offset(8)
            make.width.equalTo(60)
            make.height.equalTo(dragIndicator.layer.cornerRadius * 2)
        }
    }
    
    private func configureGestures() {
        let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(didDimmedViewTapped))
        
        dimmedView.addGestureRecognizer(dimmedTap)
        dimmedView.isUserInteractionEnabled = true
        
        let viewPan = UIPanGestureRecognizer(target: self, action: #selector(didViewPanned))
        
        viewPan.delaysTouchesBegan = false
        viewPan.delaysTouchesEnded = false
        view.addGestureRecognizer(viewPan)
    }
    
    private func popBottomSheet() {
        let safeAreaHeight = view.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding = view.safeAreaInsets.bottom
        let constraintValue = (safeAreaHeight - bottomPadding) - 600
        
        if constraintValue > 0 {
            self.bottomSheetViewTopConstraint.constant = constraintValue
        }
        
        UIView.animate(
            withDuration: 0.25,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                self.dimmedView.alpha = self.dimAlphaWithBottomSheetTopConstraint(value: self.bottomSheetViewTopConstraint.constant)
                self.view.layoutIfNeeded()
            }, completion: nil
        )
    }
    
    private func dimAlphaWithBottomSheetTopConstraint(value: CGFloat) -> CGFloat {
        let fullDimAlpha: CGFloat = 0.6
        
        let safeAreaHeight = view.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding = view.safeAreaInsets.bottom
        
        let fullDimPosition = (safeAreaHeight + bottomPadding - 600) / 2
        
        let noDimPosition = safeAreaHeight + bottomPadding
        
        if value < fullDimPosition {
            return fullDimAlpha
        }
        
        if value > noDimPosition {
            return 0.0
        }
        
        return fullDimAlpha * (1 - ((value - fullDimPosition) / (noDimPosition - fullDimPosition)))
    }
    
    private func showBottomSheet() {
        let safeAreaHeight: CGFloat = view.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding: CGFloat = view.safeAreaInsets.bottom
        
        let constraintValue = (safeAreaHeight + bottomPadding) - 600
        
        if constraintValue > 0 {
            self.bottomSheetViewTopConstraint.constant = constraintValue
        } else {
            self.bottomSheetViewTopConstraint.constant = 40
        }
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            self.dimmedView.alpha = self.dimAlphaWithBottomSheetTopConstraint(value: self.bottomSheetViewTopConstraint.constant)
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

extension BottomSheetViewController {
    @objc private func didDimmedViewTapped() {
        self.hideBottomSheetAndGoBack()
    }
    
    @objc private func didViewPanned(_ panGestureRecognizer: UIPanGestureRecognizer) {
        let transition = panGestureRecognizer.translation(in: view)
        
        let velocity = panGestureRecognizer.velocity(in: view)
        
        switch panGestureRecognizer.state {
        case .began:
            bottomSheetPanStartingTopConstant = bottomSheetViewTopConstraint.constant
            
        case .changed:
            if bottomSheetPanStartingTopConstant + transition.y > 40 {
                bottomSheetViewTopConstraint.constant = bottomSheetPanStartingTopConstant + transition.y
            }
            
            dimmedView.alpha = dimAlphaWithBottomSheetTopConstraint(value: bottomSheetViewTopConstraint.constant)
            
        case .ended:
            if velocity.y > 1500 {
                hideBottomSheetAndGoBack()
                return
            }
            
            let safeAreaHeight = view.safeAreaLayoutGuide.layoutFrame.height
            let bottomPadding = view.safeAreaInsets.bottom
            
            let defaultPadding = safeAreaHeight + bottomPadding - 600
            
            let nearestValue = nearest(to: bottomSheetViewTopConstraint.constant, inVlaues: [40, defaultPadding, safeAreaHeight + bottomPadding])
            
            if nearestValue == defaultPadding {
                showBottomSheet()
            } else {
                hideBottomSheetAndGoBack()
            }
            
        default:
            break
        }
    }
}

extension BottomSheetViewController {
    private func hideBottomSheetAndGoBack() {
        let safeAreaHeight = view.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding = view.safeAreaInsets.bottom
        
        bottomSheetViewTopConstraint.constant = safeAreaHeight + bottomPadding
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.dimmedView.alpha = 0
            self.view.layoutIfNeeded()
        }) { _ in
            if self.presentingViewController != nil {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    private func dimalphaWithBottomSheetTopConstraint(value: CGFloat) -> CGFloat {
        let fullDimAlpha: CGFloat = 0.6
        
        let safeAreaHeight = view.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding = view.safeAreaInsets.bottom
        
        let fullDimPosition = (safeAreaHeight + bottomPadding - 600) / 2
        
        let noDimPosotion = safeAreaHeight + bottomPadding
        
        if value < fullDimPosition {
            return fullDimAlpha
        }
        
        if value > noDimPosotion {
            return 0
        }
        
        return fullDimAlpha * (1 - ((value - fullDimPosition) / (noDimPosotion - fullDimPosition)))
    }
    
    private func nearest(to number: CGFloat, inVlaues values: [CGFloat]) -> CGFloat {
        guard let nearestValue = values.min(by: { abs(number - $0) < abs(number  - $1) }) else {
            return number
        }
        
        return nearestValue
    }
}
