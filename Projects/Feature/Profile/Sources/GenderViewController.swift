//
//  GenderViewController.swift
//  FeatureProfile
//
//  Created by yoonyeosong on 2023/11/09.
//

import UIKit
import UIKit
import SnapKit
import RxSwift

class GenderViewController: UIViewController {
    let progressBar = ProgressBarView().profileProgressView //progressBar
    let nextBtn = UIButton()
    let genderLabel = UILabel()
    let genderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let manButton = UIButton()
    let womanButton = UIButton()
    
    override func viewDidLoad() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
        nextBtn.isEnabled = false
        super.viewDidLoad()
        
        progressBar.progress = 2/6
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.title = "프로필 설정"
        
        
        
        
        
        
        
        configureUI()
        setUpValue()
        render()
//        nextBtn.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
        manButton.addTarget(self, action: #selector(manButtonTapped), for: .touchUpInside)
        womanButton.addTarget(self, action: #selector(womanButtonTapped), for: .touchUpInside)
    

      
        // Do any additional setup after loading the view.
    }
//    @objc func nextBtnTapped(_ button: UIButton){
//        let birthDayView = BirthDayViewController()
//        self.navigationController?.pushViewController(birthDayView, animated: false)
//    }
//
    
    @objc func manButtonTapped(_ button: UIButton){
        self.manButton.layer.borderColor = CGColor(red: 104/255, green: 190/255, blue: 18/255, alpha: 1)
        self.womanButton.layer.borderColor = CGColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
        self.nextBtn.isEnabled = true
        self.nextBtn.backgroundColor = UIColor(red: 104/255, green: 190/255, blue: 18/255, alpha: 1)
        self.nextBtn.layer.borderColor = CGColor(red: 104/255, green: 190/255, blue: 18/255, alpha: 1)
        self.nextBtn.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1), for: .normal)
    }
    
    @objc func womanButtonTapped(_ button: UIButton){
        self.womanButton.layer.borderColor = CGColor(red: 104/255, green: 190/255, blue: 18/255, alpha: 1)
        self.manButton.layer.borderColor = CGColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
        self.nextBtn.isEnabled = true
        self.nextBtn.backgroundColor = UIColor(red: 104/255, green: 190/255, blue: 18/255, alpha: 1)
        self.nextBtn.layer.borderColor = CGColor(red: 104/255, green: 190/255, blue: 18/255, alpha: 1)
        self.nextBtn.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1), for: .normal)
    }
    
    func configureUI() {
      

        view.addSubview(nextBtn)
        
        view.addSubview(genderView)
        
        genderView.addSubview(genderLabel)
        genderView.addSubview(manButton)
        genderView.addSubview(womanButton)
        
        view.addSubview(progressBar)
    }
    
    func setUpValue() {
        
        genderLabel.text = "성별은 무엇인가요?"
        genderLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        nextBtn.layer.cornerRadius = 16
        nextBtn.layer.borderWidth = 1
        nextBtn.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        nextBtn.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        nextBtn.setTitle("다음", for: .normal)
        nextBtn.setTitleColor(UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1), for: .normal)
        nextBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        manButton.setTitle("남성", for: .normal)
        manButton.setTitleColor(UIColor(red: 17/255, green: 17/255, blue: 17/255, alpha: 1), for: .normal)
        manButton.layer.cornerRadius = 16
        manButton.layer.borderWidth = 1
        manButton.layer.borderColor = CGColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
        
        womanButton.setTitle("여성", for: .normal)
        womanButton.setTitleColor(UIColor(red: 17/255, green: 17/255, blue: 17/255, alpha: 1), for: .normal)
        womanButton.layer.cornerRadius = 16
        womanButton.layer.borderWidth = 1
        womanButton.layer.borderColor = CGColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
        
        
    }
    
    func render() {
        
        genderLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(20)
        }
        
        genderView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(100)
            make.height.equalTo(461)
        }
        
        progressBar.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        nextBtn.snp.makeConstraints{ make in
            make.width.equalTo(375)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
        }

        manButton.snp.makeConstraints{ make in
            make.width.equalTo(159.5)
            make.height.equalTo(193)
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(genderLabel.snp.bottom).offset(30)
           
           
        }
        womanButton.snp.makeConstraints{ make in
            make.width.equalTo(159.5)
            make.height.equalTo(193)
            make.leading.equalTo(manButton.snp.trailing).offset(34)
            make.top.equalTo(genderLabel.snp.bottom).offset(30)
        }
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

