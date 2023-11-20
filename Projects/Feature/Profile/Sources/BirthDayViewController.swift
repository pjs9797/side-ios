//
//  BirthDayViewController.swift
//  FeatureProfile
//
//  Created by yoonyeosong on 2023/11/10.
//

import UIKit


class BirthDayViewController: UIViewController, UITextFieldDelegate {
    let progressBar = ProgressBarView().profileProgressView
    let birthDayLabel = UILabel()
    
    let birthDayView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let birthDayInputTextField = UITextField()
    
    let nextButton = UIButton()
    
    override func viewDidLoad() {
        
        birthDayInputTextField.delegate = self
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
        super.viewDidLoad()
        nextButton.isEnabled = false
        // Do any additional setup after loading the view.
        progressBar.progress = 3/6
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.title = "프로필 설정"
        
        
        configureUI()
        setUpValue()
        render()
        
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        

    }
    
    @objc func nextButtonTapped(_ button:UIButton){
        let jobSelectView = JobSelectViewController()
        self.navigationController?.pushViewController(jobSelectView, animated: false)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if text.count == 6  {
            nextButton.isEnabled = true
            nextButton.backgroundColor = UIColor(red: 104/255, green: 190/255, blue: 18/255, alpha: 1)
            nextButton.layer.borderColor = CGColor(red: 104/255, green: 190/255, blue: 18/255, alpha: 1)
            nextButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1), for: .normal)
            
        } else {
            
              nextButton.isEnabled = false
              nextButton.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
              nextButton.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
              nextButton.setTitleColor(UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1), for: .normal)
        }
        return true
    
    }
    
    
    func configureUI() {
       
        view.addSubview(birthDayView)
        birthDayView.addSubview(birthDayLabel)
        
        birthDayInputTextField.frame.size.height = 50
        birthDayView.addSubview(birthDayInputTextField)
        
        view.addSubview(nextButton)
        view.addSubview(progressBar)
    }
    
    func setUpValue() {
        birthDayLabel.text = "생년월일 여섯자리를 입력해 주세요!"
        birthDayLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        birthDayInputTextField.placeholder = "생년월일을 여섯자리를 입력해주세요."
        birthDayInputTextField.layer.borderWidth = 1
        birthDayInputTextField.layer.borderColor = UIColor.gray.cgColor
        birthDayInputTextField.layer.cornerRadius = 16
        birthDayInputTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        
        nextButton.layer.cornerRadius = 16
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        nextButton.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1), for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func render() {
        progressBar.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        birthDayLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(20)
            
        }
        
        birthDayView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(324)
            make.top.equalTo(100)
        }

        birthDayInputTextField.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(birthDayLabel.snp.bottom).offset(30)
            make.height.equalTo(56)
            make.width.equalTo(335)
        }
        
        nextButton.snp.makeConstraints{ make in
            make.width.equalTo(375)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
        }
    }
}

