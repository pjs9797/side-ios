//
//  JobSelectViewController.swift
//  FeatureProfile
//
//  Created by yoonyeosong on 2023/11/10.
//

import UIKit

class JobSelectViewController: UIViewController {

    let progressBar = ProgressBarView().profileProgressView
    let jobLabel = UILabel()
    let jobView: UIView = { //직무선택 메인 뷰
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let jobButtonView: UIView = { // 직무선택 버튼 뷰
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let jobButton1 = UIButton()
    let jobButton2 = UIButton()
    let jobButton3 = UIButton()
    let jobButton4 = UIButton()
    let jobButton5 = UIButton()
    
    
    
    
    
    var buttonCount = 0
    let nextButton = UIButton()
    
    override func viewDidLoad() {
        let buttonArray = [jobButton1, jobButton2, jobButton3, jobButton4, jobButton5]
        
        
        for selectedButton in buttonArray {
            selectedButton.addTarget(self, action: #selector(jobButtonTapped), for: .touchUpInside)
        }
        
        
        
        
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "프로필 설정"
        
        progressBar.progress = 4/6
        // Do any additional setup after loading the view.
        
        configureUI()
        setUpValue()
        render()
        
//        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
//
//
//
    }
//    @objc func nextButtonTapped(_ button: UIButton){
//        let selfDevelopmentView = SelfDevelopmentViewController()
//        self.navigationController?.pushViewController(selfDevelopmentView, animated: false)
//    }
    
    @objc func jobButtonTapped(_ button: UIButton){
        if button.isSelected == true {
            buttonCount -= 1
            button.isSelected = false
            button.layer.borderColor = CGColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            button.setTitleColor(UIColor(red: 17/255, green: 17/255, blue: 17/255, alpha: 1), for: .normal)
            
            
            
        }else {
            buttonCount += 1
            button.isSelected = true
            button.layer.borderColor = CGColor(red: 104/255, green: 190/255, blue: 18/255, alpha: 1)
            button.setTitleColor(UIColor(red: 81/255, green: 163/255, blue: 0/1, alpha: 1), for: .normal)
            
            
        }
        if buttonCount >= 1{
            self.nextButton.isEnabled = true
            self.nextButton.backgroundColor = UIColor(red: 104/255, green: 190/255, blue: 18/255, alpha: 1)
            self.nextButton.layer.borderColor = CGColor(red: 104/255, green: 190/255, blue: 18/255, alpha: 1)
            self.nextButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1), for: .normal)
        }else {
            self.nextButton.isEnabled = false
            self.nextButton.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            self.nextButton.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            self.nextButton.setTitleColor(UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1), for: .normal)
        }
    }
    
    func configureUI(){
        
        let buttonArray = [jobButton1, jobButton2, jobButton3, jobButton4]
        
        view.addSubview(jobView)
        view.addSubview(nextButton)
        jobView.addSubview(jobLabel)
        
        jobView.addSubview(jobButtonView)
        
        
        for button in buttonArray {
            jobButtonView.addSubview(button)
        }
        
        
        view.addSubview(progressBar)
    }
    
    func setUpValue() {
      
        
        jobLabel.text = "귀하의 직무는 무엇인가요?"
        jobLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        
        jobButton1.setTitle("기획·전략·경영", for: .normal)
        jobButton1.setTitleColor(UIColor(red: 17/255, green: 17/255, blue: 17/255, alpha: 1), for: .normal)
        
        jobButton2.setTitle("개발", for: .normal)
        jobButton2.setTitleColor(UIColor(red: 17/255, green: 17/255, blue: 17/255, alpha: 1), for: .normal)
        
        jobButton3.setTitle("데이터·AI·ML", for: .normal)
        jobButton3.setTitleColor(UIColor(red: 17/255, green: 17/255, blue: 17/255, alpha: 1), for: .normal)
        
        jobButton4.setTitle("마케팅·광고홍보", for: .normal)
        jobButton4.setTitleColor(UIColor(red: 17/255, green: 17/255, blue: 17/255, alpha: 1), for: .normal)
        
        nextButton.layer.cornerRadius = 16
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        nextButton.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1), for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func render() {
        
        let buttonArray = [jobButton1, jobButton2, jobButton3, jobButton4]
        for button in buttonArray {
            button.layer.cornerRadius = 20
            button.layer.borderColor = CGColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            button.layer.borderWidth = 1
        }
        
        
        progressBar.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        jobLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(20)
            
        }
        jobView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(712)
            make.top.equalTo(100)
        }
        
        jobButtonView.snp.makeConstraints{ make in
            make.top.equalTo(jobLabel).offset(60)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(544)
            make.width.equalTo(335)
        }
        
        jobButton1.snp.makeConstraints{ make in
            make.width.equalTo(144)
            make.height.equalTo(40)
            make.leading.equalTo(jobButtonView)
            make.top.equalTo(jobButtonView)
        }
        
        
        jobButton2.snp.makeConstraints{ make in
            make.width.equalTo(80)
            make.height.equalTo(40)
            make.leading.equalTo(jobButton1.snp.trailing).offset(8)
        }
       
        
        jobButton3.snp.makeConstraints{ make in
            make.width.equalTo(140)
            make.height.equalTo(40)
            make.leading.equalToSuperview()
            make.top.equalTo(jobButton1.snp.bottom).offset(16)
            
        }
        
        jobButton4.snp.makeConstraints{ make in
            make.width.equalTo(140)
            make.height.equalTo(40)
            make.leading.equalTo(jobButton3.snp.trailing).offset(8)
            make.top.equalTo(jobButton2.snp.bottom).offset(16)
            
        }
        
        nextButton.snp.makeConstraints{ make in
            make.width.equalTo(375)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
        }
        
        
    }
}
