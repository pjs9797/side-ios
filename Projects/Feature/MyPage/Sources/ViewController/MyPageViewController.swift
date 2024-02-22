//
//  MyPageViewController.swift
//  FeatureMyPageInterface
//
//  Created by coco on 2023/12/15.
//

import UIKit
import Domain
import Shared

import RxSwift
import RxCocoa
import ReactorKit
import RxFlow

public class MyPageViewController: BaseMyPageViewController, ReactorKit.View {
    
    public typealias Reactor = MyPageReactor
    
    let myPageView = MyPageView()
    
    private let settingsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(SharedDSKitAsset.Icons.iconSetting24.image, for: .normal)
        
        return button
    }()
    
    public override func loadView() {
        super.loadView()
        view = myPageView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        render()
//        myPageView.modifyButton.addTarget(self, action: #selector(modifyButtonClicked), for: .touchUpInside)
    }
    
    public override func configureUI() {
        super.configureUI()
        addNavigationTitleLabel("마이 페이지")
        addBackButton()
        addSettingsButton()
    }
    
    public init(with reactor: Reactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSettingsButton() {
        navigationBarArea.addSubview(settingsButton)
        settingsButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    private func setUp() {
        
    }
    
    private func render() {
        
        myPageView.scrollView.snp.updateConstraints { make in
            make.top.equalTo(navigationBarArea.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
//        myPageView.containerView.snp.makeConstraints { make in
//            make.width.centerX.top.bottom.equalToSuperview()
//            make.edges.equalToSuperview()
//        }
        
        myPageView.profileSectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
        
        myPageView.separatorLine.snp.makeConstraints { make in
            make.top.equalTo(myPageView.profileSectionView.snp.bottom).offset(32)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.height.equalTo(8)
        }
        
        myPageView.tableSectionTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(myPageView.separatorLine.snp.bottom).offset(32)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }
        
        myPageView.tableSectionDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(myPageView.tableSectionTitleLabel.snp.bottom).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }
        
        myPageView.clubsTableView.snp.makeConstraints { make in
            make.top.equalTo(myPageView.tableSectionDescriptionLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    
    
    /*
    @objc func settingButtonTapped() {
        let settingVC = SettingViewController()
        self.navigationController?.pushViewController(settingVC, animated: false)
    }
    
    @objc func modifyButtonClicked() {
        let modifyProfileVC = ModifyProfileViewController()
        self.navigationController?.pushViewController(modifyProfileVC, animated: false)
    }
     */
}

extension MyPageViewController {
    public func bind(reactor: MyPageReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: MyPageReactor) {
        rx.viewWillAppear.map { Reactor.Action.viewWillAppear }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        settingsButton.rx.tap.map { Reactor.Action.didTapSettingsButton }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: MyPageReactor) {
        
    }
}
