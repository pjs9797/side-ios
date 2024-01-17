//
//  CategorySelectedSelfDevelopmentViewController.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/07.
//

import UIKit
import RxCocoa
import Shared

public class CategorySelectedSelfDevelopmentViewController: UIViewController {
    let selfDevelopmentView = CategorySelectedSelfDevelopmentView()
    var flag = ""
    var labelData = [
        "[디자이너 급구] 사이드 프로젝트",
        "[백엔드] 사이드 프로젝트하실 자바 백엔드 구합니다.",
        "서비스 기획 스터디 모집",
        "대기업 이직 준비",
        "영어 회화 스터디 모집",
        "코테 스터디 모집"
    ]
    var tagData = ["단기", "원데이", "지속", "단기", "원데이", "지속"]
    
    public override func loadView() {
        super.loadView()
        view = selfDevelopmentView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        if flag == "study" {
            self.selfDevelopmentView.studyButton.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
            self.selfDevelopmentView.studyButton.titleLabel?.font = Fonts.SH02Bold.font
            self.selfDevelopmentView.studyView.isHidden = false
            self.selfDevelopmentView.studyButtonUnderline.isHidden = false
          
            self.selfDevelopmentView.sideProjectButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.sideProjectButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.changeJobButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.changeJobButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.languageButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.languageButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.investmentButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.investmentButton.titleLabel?.font = Fonts.Body02.font
            
            self.selfDevelopmentView.sideProjectButtonUnderline.isHidden = true
            self.selfDevelopmentView.changeJobButtonUnderline.isHidden = true
            self.selfDevelopmentView.languageButtonUnderline.isHidden = true
            self.selfDevelopmentView.investmentButtonUnderline.isHidden = true
            
            self.selfDevelopmentView.sideProjectView.isHidden = true
            self.selfDevelopmentView.changeJobView.isHidden = true
            self.selfDevelopmentView.languageView.isHidden = true
            self.selfDevelopmentView.investmentView.isHidden = true
        }
        else if flag == "side" {
            self.selfDevelopmentView.sideProjectButton.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
            self.selfDevelopmentView.sideProjectButton.titleLabel?.font = Fonts.SH02Bold.font
            self.selfDevelopmentView.sideProjectView.isHidden = false
            self.selfDevelopmentView.sideProjectButtonUnderline.isHidden = false
            
            self.selfDevelopmentView.studyButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.studyButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.changeJobButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.changeJobButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.languageButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.languageButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.investmentButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.investmentButton.titleLabel?.font = Fonts.Body02.font
            
            self.selfDevelopmentView.studyButtonUnderline.isHidden = true
            self.selfDevelopmentView.changeJobButtonUnderline.isHidden = true
            self.selfDevelopmentView.languageButtonUnderline.isHidden = true
            self.selfDevelopmentView.investmentButtonUnderline.isHidden = true
            
            self.selfDevelopmentView.studyView.isHidden = true
            self.selfDevelopmentView.changeJobView.isHidden = true
            self.selfDevelopmentView.languageView.isHidden = true
            self.selfDevelopmentView.investmentView.isHidden = true
        }
        else if flag == "change" {
            self.selfDevelopmentView.changeJobButton.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
            self.selfDevelopmentView.changeJobButton.titleLabel?.font = Fonts.SH02Bold.font
            self.selfDevelopmentView.changeJobView.isHidden = false
            self.selfDevelopmentView.changeJobButtonUnderline.isHidden = false
            
            self.selfDevelopmentView.studyButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.studyButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.sideProjectButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.sideProjectButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.languageButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.languageButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.investmentButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.investmentButton.titleLabel?.font = Fonts.Body02.font
            
            self.selfDevelopmentView.studyButtonUnderline.isHidden = true
            self.selfDevelopmentView.sideProjectButtonUnderline.isHidden = true
            self.selfDevelopmentView.languageButtonUnderline.isHidden = true
            self.selfDevelopmentView.investmentButtonUnderline.isHidden = true
            
            self.selfDevelopmentView.studyView.isHidden = true
            self.selfDevelopmentView.sideProjectView.isHidden = true
            self.selfDevelopmentView.languageView.isHidden = true
            self.selfDevelopmentView.investmentView.isHidden = true
        } else if flag == "language" {
            self.selfDevelopmentView.languageButton.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
            self.selfDevelopmentView.languageButton.titleLabel?.font = Fonts.SH02Bold.font
            self.selfDevelopmentView.languageView.isHidden = false
            self.selfDevelopmentView.languageButtonUnderline.isHidden = false
            
            self.selfDevelopmentView.studyButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.studyButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.sideProjectButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.sideProjectButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.changeJobButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.changeJobButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.investmentButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.investmentButton.titleLabel?.font = Fonts.Body02.font
            
            self.selfDevelopmentView.studyButtonUnderline.isHidden = true
            self.selfDevelopmentView.sideProjectButtonUnderline.isHidden = true
            self.selfDevelopmentView.changeJobButtonUnderline.isHidden = true
            self.selfDevelopmentView.investmentButtonUnderline.isHidden = true
            
            self.selfDevelopmentView.studyView.isHidden = true
            self.selfDevelopmentView.sideProjectView.isHidden = true
            self.selfDevelopmentView.changeJobView.isHidden = true
            self.selfDevelopmentView.investmentView.isHidden = true
        } else if flag == "investment" {
            self.selfDevelopmentView.investmentButton.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
            self.selfDevelopmentView.investmentButton.titleLabel?.font = Fonts.SH02Bold.font
            self.selfDevelopmentView.investmentView.isHidden = false
            self.selfDevelopmentView.investmentButtonUnderline.isHidden = false
            
            self.selfDevelopmentView.studyButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.studyButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.sideProjectButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.sideProjectButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.changeJobButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.changeJobButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.languageButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.languageButton.titleLabel?.font = Fonts.Body02.font
            
            self.selfDevelopmentView.studyButtonUnderline.isHidden = true
            self.selfDevelopmentView.sideProjectButtonUnderline.isHidden = true
            self.selfDevelopmentView.changeJobButtonUnderline.isHidden = true
            self.selfDevelopmentView.languageButtonUnderline.isHidden = true
            
            self.selfDevelopmentView.studyView.isHidden = true
            self.selfDevelopmentView.sideProjectView.isHidden = true
            self.selfDevelopmentView.changeJobView.isHidden = true
            self.selfDevelopmentView.languageView.isHidden = true
        } else {
            self.selfDevelopmentView.etcButton.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
            self.selfDevelopmentView.etcButton.titleLabel?.font = Fonts.SH02Bold.font
            self.selfDevelopmentView.etcView.isHidden = false
            self.selfDevelopmentView.etcButtonUnderline.isHidden = false
            
            self.selfDevelopmentView.studyButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.studyButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.sideProjectButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.sideProjectButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.changeJobButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.changeJobButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.languageButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.languageButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.investmentButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.investmentButton.titleLabel?.font = Fonts.Body02.font
            
            self.selfDevelopmentView.studyButtonUnderline.isHidden = true
            self.selfDevelopmentView.sideProjectButtonUnderline.isHidden = true
            self.selfDevelopmentView.changeJobButtonUnderline.isHidden = true
            self.selfDevelopmentView.languageButtonUnderline.isHidden = true
            self.selfDevelopmentView.investmentButtonUnderline.isHidden = true
            
            self.selfDevelopmentView.studyView.isHidden = true
            self.selfDevelopmentView.sideProjectView.isHidden = true
            self.selfDevelopmentView.changeJobView.isHidden = true
            self.selfDevelopmentView.languageView.isHidden = true
            self.selfDevelopmentView.investmentView.isHidden = true
        }
  
        selfDevelopmentView.studyTableView.delegate = self
        selfDevelopmentView.studyTableView.dataSource = self
        selfDevelopmentView.studyTableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemCell")
        
        selfDevelopmentView.sideProjectTableView.delegate = self
        selfDevelopmentView.sideProjectTableView.dataSource = self
        selfDevelopmentView.sideProjectTableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemCell")
        
        selfDevelopmentView.changeJobTableView.delegate = self
        selfDevelopmentView.changeJobTableView.dataSource = self
        selfDevelopmentView.changeJobTableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemCell")
        
        selfDevelopmentView.languageTableView.delegate = self
        selfDevelopmentView.languageTableView.dataSource = self
        selfDevelopmentView.languageTableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemCell")
        
        selfDevelopmentView.investmentTableView.delegate = self
        selfDevelopmentView.investmentTableView.dataSource = self
        selfDevelopmentView.investmentTableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemCell")
        
        selfDevelopmentView.etcTableView.delegate = self
        selfDevelopmentView.etcTableView.dataSource = self
        selfDevelopmentView.etcTableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemCell")
        
        itemClicked()
    }
    
    func itemClicked() {
        selfDevelopmentView.studyButton.rx.tap.subscribe(onNext: {
            self.selfDevelopmentView.studyButton.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
            self.selfDevelopmentView.studyButton.titleLabel?.font = Fonts.SH02Bold.font
            self.selfDevelopmentView.studyView.isHidden = false
            self.selfDevelopmentView.studyButtonUnderline.isHidden = false
          
            self.selfDevelopmentView.sideProjectButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.sideProjectButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.changeJobButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.changeJobButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.languageButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.languageButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.investmentButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.investmentButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.etcButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.etcButton.titleLabel?.font = Fonts.Body02.font
            
            self.selfDevelopmentView.sideProjectButtonUnderline.isHidden = true
            self.selfDevelopmentView.changeJobButtonUnderline.isHidden = true
            self.selfDevelopmentView.languageButtonUnderline.isHidden = true
            self.selfDevelopmentView.investmentButtonUnderline.isHidden = true
            self.selfDevelopmentView.etcButtonUnderline.isHidden = true
            
            self.selfDevelopmentView.sideProjectView.isHidden = true
            self.selfDevelopmentView.changeJobView.isHidden = true
            self.selfDevelopmentView.languageView.isHidden = true
            self.selfDevelopmentView.investmentView.isHidden = true
            self.selfDevelopmentView.etcView.isHidden = true
        })
        selfDevelopmentView.sideProjectButton.rx.tap.subscribe(onNext: {
            self.selfDevelopmentView.sideProjectButton.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
            self.selfDevelopmentView.sideProjectButton.titleLabel?.font = Fonts.SH02Bold.font
            self.selfDevelopmentView.sideProjectView.isHidden = false
            self.selfDevelopmentView.sideProjectButtonUnderline.isHidden = false
            
            self.selfDevelopmentView.studyButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.studyButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.changeJobButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.changeJobButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.languageButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.languageButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.investmentButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.investmentButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.etcButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.etcButton.titleLabel?.font = Fonts.Body02.font
            
            self.selfDevelopmentView.studyButtonUnderline.isHidden = true
            self.selfDevelopmentView.changeJobButtonUnderline.isHidden = true
            self.selfDevelopmentView.languageButtonUnderline.isHidden = true
            self.selfDevelopmentView.investmentButtonUnderline.isHidden = true
            self.selfDevelopmentView.etcButtonUnderline.isHidden = true
            
            self.selfDevelopmentView.studyView.isHidden = true
            self.selfDevelopmentView.changeJobView.isHidden = true
            self.selfDevelopmentView.languageView.isHidden = true
            self.selfDevelopmentView.investmentView.isHidden = true
            self.selfDevelopmentView.etcView.isHidden = true
        })
        selfDevelopmentView.changeJobButton.rx.tap.subscribe(onNext: {
            self.selfDevelopmentView.changeJobButton.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
            self.selfDevelopmentView.changeJobButton.titleLabel?.font = Fonts.SH02Bold.font
            self.selfDevelopmentView.changeJobView.isHidden = false
            self.selfDevelopmentView.changeJobButtonUnderline.isHidden = false
            
            self.selfDevelopmentView.studyButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.studyButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.sideProjectButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.sideProjectButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.languageButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.languageButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.investmentButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.investmentButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.etcButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.etcButton.titleLabel?.font = Fonts.Body02.font
            
            self.selfDevelopmentView.studyButtonUnderline.isHidden = true
            self.selfDevelopmentView.sideProjectButtonUnderline.isHidden = true
            self.selfDevelopmentView.languageButtonUnderline.isHidden = true
            self.selfDevelopmentView.investmentButtonUnderline.isHidden = true
            self.selfDevelopmentView.etcButtonUnderline.isHidden = true
            
            self.selfDevelopmentView.studyView.isHidden = true
            self.selfDevelopmentView.sideProjectView.isHidden = true
            self.selfDevelopmentView.languageView.isHidden = true
            self.selfDevelopmentView.investmentView.isHidden = true
            self.selfDevelopmentView.etcView.isHidden = true
        })
        selfDevelopmentView.languageButton.rx.tap.subscribe(onNext: {
            self.selfDevelopmentView.languageButton.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
            self.selfDevelopmentView.languageButton.titleLabel?.font = Fonts.SH02Bold.font
            self.selfDevelopmentView.languageView.isHidden = false
            self.selfDevelopmentView.languageButtonUnderline.isHidden = false
            
            self.selfDevelopmentView.studyButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.studyButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.sideProjectButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.sideProjectButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.changeJobButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.changeJobButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.investmentButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.investmentButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.etcButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.etcButton.titleLabel?.font = Fonts.Body02.font
            
            self.selfDevelopmentView.studyButtonUnderline.isHidden = true
            self.selfDevelopmentView.sideProjectButtonUnderline.isHidden = true
            self.selfDevelopmentView.changeJobButtonUnderline.isHidden = true
            self.selfDevelopmentView.investmentButtonUnderline.isHidden = true
            self.selfDevelopmentView.etcButtonUnderline.isHidden = true
            
            self.selfDevelopmentView.studyView.isHidden = true
            self.selfDevelopmentView.sideProjectView.isHidden = true
            self.selfDevelopmentView.changeJobView.isHidden = true
            self.selfDevelopmentView.investmentView.isHidden = true
            self.selfDevelopmentView.etcView.isHidden = true
        })
        selfDevelopmentView.investmentButton.rx.tap.subscribe(onNext: {
            self.selfDevelopmentView.investmentButton.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
            self.selfDevelopmentView.investmentButton.titleLabel?.font = Fonts.SH02Bold.font
            self.selfDevelopmentView.investmentView.isHidden = false
            self.selfDevelopmentView.investmentButtonUnderline.isHidden = false
            
            self.selfDevelopmentView.studyButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.studyButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.sideProjectButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.sideProjectButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.changeJobButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.changeJobButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.languageButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.languageButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.etcButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.etcButton.titleLabel?.font = Fonts.Body02.font
            
            self.selfDevelopmentView.studyButtonUnderline.isHidden = true
            self.selfDevelopmentView.sideProjectButtonUnderline.isHidden = true
            self.selfDevelopmentView.changeJobButtonUnderline.isHidden = true
            self.selfDevelopmentView.languageButtonUnderline.isHidden = true
            self.selfDevelopmentView.etcButtonUnderline.isHidden = true
            
            self.selfDevelopmentView.studyView.isHidden = true
            self.selfDevelopmentView.sideProjectView.isHidden = true
            self.selfDevelopmentView.changeJobView.isHidden = true
            self.selfDevelopmentView.languageView.isHidden = true
            self.selfDevelopmentView.etcView.isHidden = true
        })
        selfDevelopmentView.etcButton.rx.tap.subscribe(onNext: {
            self.selfDevelopmentView.etcButton.setTitleColor(SharedDSKitAsset.Colors.green.color, for: .normal)
            self.selfDevelopmentView.etcButton.titleLabel?.font = Fonts.SH02Bold.font
            self.selfDevelopmentView.etcView.isHidden = false
            self.selfDevelopmentView.etcButtonUnderline.isHidden = false
            
            self.selfDevelopmentView.studyButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.studyButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.sideProjectButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.sideProjectButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.changeJobButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.changeJobButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.languageButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.languageButton.titleLabel?.font = Fonts.Body02.font
            self.selfDevelopmentView.investmentButton.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
            self.selfDevelopmentView.investmentButton.titleLabel?.font = Fonts.Body02.font
            
            self.selfDevelopmentView.studyButtonUnderline.isHidden = true
            self.selfDevelopmentView.sideProjectButtonUnderline.isHidden = true
            self.selfDevelopmentView.changeJobButtonUnderline.isHidden = true
            self.selfDevelopmentView.languageButtonUnderline.isHidden = true
            self.selfDevelopmentView.investmentButtonUnderline.isHidden = true
            
            self.selfDevelopmentView.studyView.isHidden = true
            self.selfDevelopmentView.sideProjectView.isHidden = true
            self.selfDevelopmentView.changeJobView.isHidden = true
            self.selfDevelopmentView.languageView.isHidden = true
            self.selfDevelopmentView.investmentView.isHidden = true
        })
    }
}

extension CategorySelectedSelfDevelopmentViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: 현재는 API 연동이 안되어있으므로 임의의 값 사용.
        return 6
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        let shortTermButtonBackgroundColor = UIColor(red: 227/255, green: 238/255, blue: 251/255, alpha: 1)
        let shortTermButtonTitleColor = UIColor(red: 0, green: 85/255, blue: 163/255, alpha: 1)
        let oneDayButtonBackgroundColor = UIColor(red: 251/255, green: 235/255, blue: 251/255, alpha: 1)
        let oneDayButtonTitleColor = UIColor(red: 224/255, green: 99/255, blue: 36/255, alpha: 1)
        let longTermButtonBackgroundColor = UIColor(red: 235/255, green: 248/255, blue: 220/255, alpha: 1)
        let longTermButtonTitleColor = UIColor(red: 81/255, green: 163/255, blue: 0, alpha: 1)
        cell.label.text = labelData[indexPath.row]
        cell.tagButton.setTitle(tagData[indexPath.row], for: .normal)
        
        if cell.tagButton.currentTitle == "단기" {
            cell.tagButton.backgroundColor = shortTermButtonBackgroundColor
            cell.tagButton.setTitleColor(shortTermButtonTitleColor, for: .normal)
        } else if cell.tagButton.currentTitle == "원데이" {
            cell.tagButton.backgroundColor = oneDayButtonBackgroundColor
            cell.tagButton.setTitleColor(oneDayButtonTitleColor, for: .normal)
        } else {
            cell.tagButton.backgroundColor = longTermButtonBackgroundColor
            cell.tagButton.setTitleColor(longTermButtonTitleColor, for: .normal)
        }
        return cell
    }
}
