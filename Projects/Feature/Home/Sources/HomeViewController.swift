//
//  HomeViewController.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/11/29.
//


import UIKit
import SharedDSKit
import RxSwift

public class HomeViewController: UIViewController {
    let disposeBag = DisposeBag()
    let homeView = HomeView()
    
    public override func loadView() {
        super.loadView()
        view = homeView
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        homeView.studyButton.rx.tap.subscribe(onNext: {
            let nav = CategorySelectedSelfDevelopmentViewController()
            nav.flag = "study"
            self.navigationController?.pushViewController(nav, animated: true)
        })
        homeView.sideButton.rx.tap.subscribe(onNext: {
            let nav = CategorySelectedSelfDevelopmentViewController()
            nav.flag = "side"
            self.navigationController?.pushViewController(nav, animated: true)
        })
        homeView.changeJobButton.rx.tap.subscribe(onNext: {
            let nav = CategorySelectedSelfDevelopmentViewController()
            nav.flag = "change"
            self.navigationController?.pushViewController(nav, animated: true)
        })
        homeView.languageButton.rx.tap.subscribe(onNext: {
            let nav = CategorySelectedSelfDevelopmentViewController()
            nav.flag = "language"
            self.navigationController?.pushViewController(nav, animated: true)
        })
        homeView.investmentButton.rx.tap.subscribe(onNext: {
            let nav = CategorySelectedSelfDevelopmentViewController()
            nav.flag = "investment"
            self.navigationController?.pushViewController(nav, animated: true)
        })
        homeView.etcButton.rx.tap.subscribe(onNext: {
            let nav = CategorySelectedSelfDevelopmentViewController()
            nav.flag = "etc"
            self.navigationController?.pushViewController(nav, animated: true)
        })
        navigationSetup()
        homeView.plusButton.rx.tap
            .bind(onNext: { [weak self] in
                let selectMeetingTypeVC = SelectMeetingTypeViewController(selectMeetingTypeViewModel: SelectMeetingTypeViewModel())
                selectMeetingTypeVC.homeNavigationController = self?.navigationController
                self?.present(selectMeetingTypeVC, animated: false)
            })
            .disposed(by: disposeBag)
        homeView.segmentedControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
        homeView.segmentedControl.selectedSegmentIndex = 0

        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: SharedDSKitAsset.Colors.lightGreen.color, NSAttributedString.Key.font: Fonts.SH02Bold.font]
        let titleTextAttributes2 = [NSAttributedString.Key.font: Fonts.Body02.font, NSAttributedString.Key.foregroundColor: SharedDSKitAsset.Colors.text03.color]
        homeView.segmentedControl.setTitleTextAttributes(titleTextAttributes1, for: .selected)
        homeView.segmentedControl.setTitleTextAttributes(titleTextAttributes2, for: .normal)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func navigationSetup() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    @objc private func didChangeValue(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            homeView.recommendView.isHidden = false
            homeView.selfDevelopmentView.isHidden = true
            homeView.hobbyView.isHidden = true
        } else if segment.selectedSegmentIndex == 1{
            homeView.recommendView.isHidden = true
            homeView.selfDevelopmentView.isHidden = false
            homeView.hobbyView.isHidden = true
        } else {
            homeView.recommendView.isHidden = true
            homeView.selfDevelopmentView.isHidden = true
            homeView.hobbyView.isHidden = false
        }
    }
}

