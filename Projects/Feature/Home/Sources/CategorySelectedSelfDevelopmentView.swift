//
//  CategorySelectedSelfDevelopmentView.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/06.
//

import UIKit
import Shared

public class CategorySelectedSelfDevelopmentView: UIView {
    let studyTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    let sideProjectTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    let changeJobTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    let languageTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    let investmentTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    let etcTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    let studyButton: UIButton = {
        let button = UIButton()
        button.setTitle("스터디/자격증", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        return button
    }()
    let studyButtonUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.green.color
        return view
    }()
    let sideProjectButton: UIButton = {
        let button = UIButton()
        button.setTitle("사이드프로젝트", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        return button
    }()
    let sideProjectButtonUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.green.color
        view.isHidden = true
        return view
    }()
    let changeJobButton: UIButton = {
        let button = UIButton()
        button.setTitle("이직준비", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        return button
    }()
    let changeJobButtonUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.green.color
        view.isHidden = true
        return view
    }()
    let languageButton: UIButton = {
        let button = UIButton()
        button.setTitle("어학", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        return button
    }()
    let languageButtonUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.green.color
        view.isHidden = true
        return view
    }()
    let investmentButton: UIButton = {
        let button = UIButton()
        button.setTitle("제테크", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        return button
    }()
    let investmentButtonUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.green.color
        view.isHidden = true
        return view
    }()
    let etcButton: UIButton = {
        let button = UIButton()
        button.setTitle("기타", for: .normal)
        button.titleLabel?.font = Fonts.Body02.font
        button.setTitleColor(SharedDSKitAsset.Colors.text03.color, for: .normal)
        return button
    }()
    let etcButtonUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.green.color
        view.isHidden = true
        return view
    }()
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: .zero, height: 50)
        return scrollView
    }()
    
    let studyView: UIView = {
        let vc = UIView()
        vc.backgroundColor = .red
        vc.isHidden = true
      return vc
    }()
    let sideProjectView: UIView = {
        let vc = UIView()
        vc.backgroundColor = .green
        vc.isHidden = true
        return vc
    }()
    let changeJobView: UIView = {
        let vc = UIView()
        vc.backgroundColor = .blue
        vc.isHidden = true
        return vc
    }()
    let languageView: UIView = {
        let vc = UIView()
        vc.backgroundColor = .black
        vc.isHidden = true
        return vc
    }()
    let investmentView: UIView = {
        let vc = UIView()
        vc.backgroundColor = .yellow
        vc.isHidden = true
        return vc
    }()
    let etcView: UIView = {
        let vc = UIView()
        vc.backgroundColor = .yellow
        vc.isHidden = true
        return vc
    }()
    let entireButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitle("전체", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.text01.color, for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.layer.cornerRadius = 16
        return button
    }()
    let oneDayButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitle("원데이", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.text01.color, for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.layer.cornerRadius = 16
        return button
    }()
    let shortTermButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitle("단기", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.text01.color, for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.layer.cornerRadius = 16
        return button
    }()
    let longTermButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.Caption.font
        button.setTitle("지속", for: .normal)
        button.setTitleColor(SharedDSKitAsset.Colors.text01.color, for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.layer.cornerRadius = 16
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        self.backgroundColor = .white
        scrollView.addSubViews([studyButton, sideProjectButton, changeJobButton, languageButton, investmentButton, etcButton, studyButtonUnderline, sideProjectButtonUnderline, changeJobButtonUnderline, languageButtonUnderline, investmentButtonUnderline, etcButtonUnderline])
        addSubViews([entireButton, oneDayButton, shortTermButton, longTermButton, scrollView, studyView, sideProjectView, changeJobView, languageView, investmentView, etcView])
      
        studyTableView.rowHeight = UITableView.automaticDimension
        studyTableView.estimatedRowHeight = UITableView.automaticDimension
        
        studyView.addSubview(studyTableView)
        sideProjectView.addSubview(sideProjectTableView)
        changeJobView.addSubview(changeJobTableView)
        languageView.addSubview(languageTableView)
        investmentView.addSubview(investmentTableView)
        etcView.addSubview(etcTableView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        entireButton.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(45)
            make.height.equalTo(32)
        }
        oneDayButton.snp.makeConstraints { make in
            make.top.equalTo(entireButton.snp.top)
            make.leading.equalTo(entireButton.snp.trailing).offset(8)
            make.width.equalTo(56)
            make.height.equalTo(32)
        }
        shortTermButton.snp.makeConstraints { make in
            make.top.equalTo(entireButton.snp.top)
            make.leading.equalTo(oneDayButton.snp.trailing).offset(8)
            make.width.equalTo(45)
            make.height.equalTo(32)
        }
        longTermButton.snp.makeConstraints { make in
            make.top.equalTo(entireButton.snp.top)
            make.leading.equalTo(shortTermButton.snp.trailing).offset(8)
            make.width.equalTo(45)
            make.height.equalTo(32)
        }
        studyView.snp.makeConstraints { make in
            make.top.equalTo(entireButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        sideProjectView.snp.makeConstraints { make in
            make.top.equalTo(entireButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        changeJobView.snp.makeConstraints { make in
            make.top.equalTo(entireButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        languageView.snp.makeConstraints { make in
            make.top.equalTo(entireButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        investmentView.snp.makeConstraints { make in
            make.top.equalTo(entireButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        etcView.snp.makeConstraints { make in
            make.top.equalTo(entireButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        studyTableView.snp.makeConstraints { make in
            make.top.equalTo(entireButton.snp.bottom).offset(16)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        etcTableView.snp.makeConstraints { make in
            make.top.equalTo(entireButton.snp.bottom).offset(16)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        sideProjectTableView.snp.makeConstraints { make in
            make.top.equalTo(entireButton.snp.bottom).offset(16)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        changeJobTableView.snp.makeConstraints { make in
            make.top.equalTo(entireButton.snp.bottom).offset(16)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        languageTableView.snp.makeConstraints { make in
            make.top.equalTo(entireButton.snp.bottom).offset(16)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        investmentTableView.snp.makeConstraints { make in
            make.top.equalTo(entireButton.snp.bottom).offset(16)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        etcTableView.snp.makeConstraints { make in
            make.top.equalTo(entireButton.snp.bottom).offset(16)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        studyButton.snp.makeConstraints { make in
            make.width.equalTo(121)
            make.height.equalTo(48)
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview()
            
        }
        sideProjectButton.snp.makeConstraints { make in
            make.width.equalTo(133)
            make.height.equalTo(48)
            make.leading.equalTo(studyButton.snp.trailing)
            make.top.equalToSuperview()
        }
        changeJobButton.snp.makeConstraints { make in
            make.width.equalTo(92)
            make.height.equalTo(48)
            make.leading.equalTo(sideProjectButton.snp.trailing)
            make.top.equalToSuperview()
        }
        languageButton.snp.makeConstraints { make in
            make.width.equalTo(92)
            make.height.equalTo(48)
            make.leading.equalTo(changeJobButton.snp.trailing)
            make.top.equalToSuperview()
        }
        investmentButton.snp.makeConstraints { make in
            make.width.equalTo(92)
            make.height.equalTo(48)
            make.leading.equalTo(languageButton.snp.trailing)
            make.top.equalToSuperview()
        }
        etcButton.snp.makeConstraints { make in
            make.width.equalTo(92)
            make.height.equalTo(48)
            make.leading.equalTo(investmentButton.snp.trailing)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }
        studyButtonUnderline.snp.makeConstraints { make in
            make.top.equalTo(studyButton.snp.bottom)
            make.width.equalTo(studyButton.snp.width)
            make.height.equalTo(2)
            make.leading.equalTo(studyButton.snp.leading)
        }
        sideProjectButtonUnderline.snp.makeConstraints { make in
            make.top.equalTo(sideProjectButton.snp.bottom)
            make.width.equalTo(sideProjectButton.snp.width)
            make.height.equalTo(2)
            make.leading.equalTo(sideProjectButton.snp.leading)
        }
        changeJobButtonUnderline.snp.makeConstraints { make in
            make.top.equalTo(changeJobButton.snp.bottom)
            make.width.equalTo(changeJobButton.snp.width)
            make.height.equalTo(2)
            make.leading.equalTo(changeJobButton.snp.leading)
        }
        languageButtonUnderline.snp.makeConstraints { make in
            make.top.equalTo(languageButton.snp.bottom)
            make.width.equalTo(languageButton.snp.width)
            make.height.equalTo(2)
            make.leading.equalTo(languageButton.snp.leading)
        }
        investmentButtonUnderline.snp.makeConstraints { make in
            make.top.equalTo(investmentButton.snp.bottom)
            make.width.equalTo(investmentButton.snp.width)
            make.height.equalTo(2)
            make.leading.equalTo(investmentButton.snp.leading)
        }
        etcButtonUnderline.snp.makeConstraints { make in
            make.top.equalTo(etcButton.snp.bottom)
            make.width.equalTo(etcButton.snp.width)
            make.height.equalTo(2)
            make.leading.equalTo(etcButton.snp.leading)
        }
        
    }
}
