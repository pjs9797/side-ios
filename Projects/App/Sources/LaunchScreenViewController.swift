//
//  LaunchScreenViewController.swift
//  TP
//
//  Created by 강민성 on 1/27/24.
//

import UIKit
import Shared
import Domain
import FeatureSignIn

import Lottie
import RxFlow
import SnapKit

class LaunchScreenViewController: UIViewController {

    private let animationView: LottieAnimationView = {
        let view = LottieAnimationView(name: "launch_lottie")
        view.loopMode = .playOnce
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "SABUZAC"
        label.font = Fonts.H07.font
        label.textColor = .white
        
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "퇴근 후에 사부작"
        label.font = Fonts.SH03.font
        label.textColor = .white
        
        return label
    }()
    
    let window: UIWindow
    let coordinator: FlowCoordinator
    
    init(window: UIWindow, coordinator: FlowCoordinator) {
        self.window = window
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = SharedDSKitAsset.Colors.lightGreen.color
        render()
        animationView.play { done in
            if done {
                self.coordinateToAppFlow()
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        animationView.stop()
    }
    
    private func render() {
        view.addSubViews([animationView, titleLabel, subTitleLabel])
        
        animationView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.top).offset(-16)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-60)
        }
    }
    
    private func coordinateToAppFlow() {
        let provider: ServiceProviderType = DataRepository.shared
        let appFlow = AppFlow(with: window, provider: provider)
//        let signInFlow = SignInFlow(with: provider)
        let appStepper = AppStepper(provider: provider)
//        let signInStepper = SignInStepper(provider: provider)
        
        coordinator.coordinate(flow: appFlow, with: appStepper)
//        coordinator.coordinate(flow: signInFlow, with: signInStepper)
        
        if provider.settingsService.isSignedIn {
//            appStepper.steps.accept(AppStep.userIsSignedIn)
        }
        else {
            appStepper.steps.accept(AppStep.signInRequired)
//            signInStepper.steps.accept(SignInStep.signInRequired)
        }
        //TODO: 나중에 제거 예정
        appStepper.steps.accept(AppStep.goToTabBar)
        window.makeKeyAndVisible()
    }

}
