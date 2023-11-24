//
//  profileMainViewController.swift
//  FeatureProfile
//
//  Created by yoonyeosong on 2023/11/09.
//

import UIKit
import SnapKit
import RxSwift
import Shared
import RxCocoa



public class ProgressBarView: UIView {
    var profileProgressView: UIProgressView = {
        let view = UIProgressView()
        view.trackTintColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1) //progressBar Bacground Color
        
        view.progressTintColor = UIColor(red: 17/255, green: 17/255, blue: 17/255, alpha: 1) //progressBar Color
        view.progress = 1/6
        return view
    }()
}

public class profileMainViewController: UIViewController, UITextFieldDelegate {
    
    let nickNameLabel = UILabel()

    let nickNameView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    let nickNameInputTextField = UITextField() //닉네임 입력 Input
    
    let nextBtn = UIButton()
    
    let progressBar = ProgressBarView().profileProgressView
    
    public override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "프로필 설정"
    }
    
    public override func viewDidLoad() {
        
      
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
        nextBtn.isEnabled = false
        nickNameInputTextField.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
        setUpValue()
        render()
        
        nextBtn.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
//
//        nextBtn.rx
//            .tap
//            .subscribe(onNext: {
//                let genderView = GenderViewController()
//                self.navigationController?.pushViewController(genderView, animated: false)
//            })
     
        
    }
    
    @objc func nextBtnTapped(_ button: UIButton){
        let genderView = GenderViewController()
        self.navigationController?.pushViewController(genderView, animated: false)
    }
    
    
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

            let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)

            if !text.isEmpty {
                nextBtn.isEnabled = true
                nextBtn.backgroundColor = UIColor(red: 104/255, green: 190/255, blue: 18/255, alpha: 1)
                nextBtn.layer.borderColor = CGColor(red: 104/255, green: 190/255, blue: 18/255, alpha: 1)
                nextBtn.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1), for: .normal)
            } else {
                nextBtn.isEnabled = false
                nextBtn.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                nextBtn.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                nextBtn.setTitleColor(UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1), for: .normal)
                
            }
            return true
    }
    
    // 뷰 구성요소 세팅
    func configureUI() {
        view.backgroundColor = .white
        nickNameView.addSubview(nickNameLabel)
        view.addSubview(nickNameView)
        nickNameInputTextField.frame.size.height = 50
        nickNameView.addSubview(nickNameInputTextField)
        
        view.addSubview(nextBtn)
        view.addSubview(progressBar)
        
    }
    
    
    // 요소 내용 설정
    func setUpValue() {
        nickNameLabel.text = "갓생사는 당신의 닉네임을 설정해주세요!"
        nickNameLabel.font  = UIFont.boldSystemFont(ofSize: 20)
        
        //navigationTitle
        self.navigationItem.title = "프로필 설정"
        
        //닉네임 입력
        nickNameInputTextField.placeholder = "닉네임을 입력해주세요."
        nickNameInputTextField.layer.borderWidth = 1
        nickNameInputTextField.layer.borderColor = UIColor.gray.cgColor
        nickNameInputTextField.layer.cornerRadius = 16
        nickNameInputTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0) //앞칸 공백주기
        //inputTextField.clearButtonMode = .always //한번에 지우기

        nextBtn.layer.cornerRadius = 16
        nextBtn.layer.borderWidth = 1
        nextBtn.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        nextBtn.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        nextBtn.setTitle("다음", for: .normal)
        nextBtn.setTitleColor(UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1), for: .normal)
        nextBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    // 뷰 constraint 설정
    func render() {
        nickNameLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(20)
        }
        nickNameView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(324)
            make.top.equalTo(100)
        }
        nickNameInputTextField.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nickNameLabel.snp.bottom).offset(30)
            make.height.equalTo(56)
            make.width.equalTo(335)
            
        }
        nextBtn.snp.makeConstraints{ make in
            make.width.equalTo(375)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
        }
        
        progressBar.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}

