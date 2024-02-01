//
//  IdVerificateWithPhoneNumberViewController.swift
//  FeatureSignIn
//
//  Created by 강민성 on 2/1/24.
//

import UIKit
import Shared
import Domain

import RxSwift
import RxCocoa
import RxFlow
import ReactorKit

public class IdVerificateWithPhoneNumberViewController: BaseViewController, ReactorKit.View {
    
    public typealias Reactor = IdVerificateWithPhoneNumberReactor
    
    let idVerificateWithPhoneNumberView = IdVerificateWithPhoneNumberView()
    
    let timerView: UILabel = {
        let label = UILabel()
        label.textColor = SharedDSKitAsset.Colors.green.color
        label.font = Fonts.Caption.font
        label.textAlignment = .right
        
        return label
    }()
    
    let okImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark")
        imageView.tintColor = SharedDSKitAsset.Colors.green.color
        
        return imageView
    }()
    
    public override func loadView() {
        super.loadView()
        view = idVerificateWithPhoneNumberView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        render()
        // Do any additional setup after loading the view.
    }
    
    init(with reactor: Reactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    public override func configureUI() {
        super.configureUI()
        addBackButton()
        addNavigationTitleLabel("아이디 찾기")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        idVerificateWithPhoneNumberView.emailVerificateInputView.inputViewErrorLabel.isHidden = true
        idVerificateWithPhoneNumberView.verificationNumberInputView.isHidden = true
    }
    
    private func render() {
        idVerificateWithPhoneNumberView.verificationNumberInputView.inputViewTextField.leftView = okImageView
        idVerificateWithPhoneNumberView.verificationNumberInputView.inputViewTextField.leftView?.isHidden = true
        idVerificateWithPhoneNumberView.verificationNumberInputView.inputViewTextField.rightView = timerView
        
        idVerificateWithPhoneNumberView.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(navigationBarArea.snp.bottom).offset(60)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(68)
        }
        
        idVerificateWithPhoneNumberView.descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(idVerificateWithPhoneNumberView.titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(48)

        }
        
        idVerificateWithPhoneNumberView.emailVerificateInputView.snp.makeConstraints { make in
            make.top.equalTo(idVerificateWithPhoneNumberView.descriptionLabel.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
//            make.height.equalTo(56)
        }
        
        idVerificateWithPhoneNumberView.verificationNumberInputView.snp.makeConstraints { make in
            make.top.equalTo(idVerificateWithPhoneNumberView.emailVerificateInputView.snp.bottom).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
//            make.height.equalTo(56)
        }
        
        idVerificateWithPhoneNumberView.verificationCompletedButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(52)
        }
    }
    
}

extension IdVerificateWithPhoneNumberViewController {
    public func bind(reactor: IdVerificateWithPhoneNumberReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: IdVerificateWithPhoneNumberReactor) {
        backButton.rx.tap
            .map { Reactor.Action.didBackButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        idVerificateWithPhoneNumberView.emailVerificateInputView.verificationInputViewTextField.rx.text
            .orEmpty
            .map { Reactor.Action.writePhoneNumber($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        idVerificateWithPhoneNumberView.emailVerificateInputView.verificateButton.rx
            .tap
            .map { Reactor.Action.didTapRequestVerificationNumberButton }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        idVerificateWithPhoneNumberView.verificationNumberInputView.inputViewTextField.rx.text
            .orEmpty
            .map { Reactor.Action.writeVerificationNumber($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
    }
    
    private func bindState(reactor: IdVerificateWithPhoneNumberReactor) {
        reactor.state.map { $0.isStartTimer }
            .subscribe(onNext: { [weak self] start in
                if start {
                    self?.idVerificateWithPhoneNumberView.verificationNumberInputView.isHidden = false
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isVerificationComplete }
            .bind(to: idVerificateWithPhoneNumberView.verificationCompletedButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.timerTime == 0 }
            .bind(to: idVerificateWithPhoneNumberView.emailVerificateInputView.verificateButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.timerString }
            .bind(to: timerView.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isIncorrectFormedPhoneNumber }
            .subscribe(onNext: { [weak self] error in
                if !error {
                    self?.idVerificateWithPhoneNumberView.emailVerificateInputView.verificationInputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                    self?.idVerificateWithPhoneNumberView.emailVerificateInputView.verificateButton.layer.borderColor = SharedDSKitAsset.Colors.gr50.color.cgColor
                    self?.idVerificateWithPhoneNumberView.emailVerificateInputView.verificationInputViewTextField.leftView?.isHidden = true
                } else {
                    self?.idVerificateWithPhoneNumberView.emailVerificateInputView.verificationInputViewTextField.layer.borderColor = SharedDSKitAsset.Colors.red.color.cgColor
                    self?.idVerificateWithPhoneNumberView.emailVerificateInputView.inputViewErrorLabel.text = "올바른 전화번호를 입력해 주세요."
                    self?.idVerificateWithPhoneNumberView.emailVerificateInputView.verificationInputViewTextField.leftView?.isHidden = false
                    self?.idVerificateWithPhoneNumberView.emailVerificateInputView.verificateButton.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                    self?.idVerificateWithPhoneNumberView.emailVerificateInputView.verificateButton.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
                }
                self?.idVerificateWithPhoneNumberView.emailVerificateInputView.verificateButton.isEnabled = !error
                self?.idVerificateWithPhoneNumberView.emailVerificateInputView.inputViewErrorLabel.isHidden = !error
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isVerificationComplete }
            .subscribe(onNext: { [weak self] complete in
                if complete {
                    self?.idVerificateWithPhoneNumberView.verificationNumberInputView.inputViewTextField.rightView?.isHidden = true
                    self?.idVerificateWithPhoneNumberView.verificationNumberInputView.inputViewTextField.leftView?.isHidden = false
                    self?.idVerificateWithPhoneNumberView.verificationNumberInputView.inputViewErrorLabel.text = "인증이 완료 되었습니다."
                    self?.idVerificateWithPhoneNumberView.verificationNumberInputView.inputViewErrorLabel.textColor = SharedDSKitAsset.Colors.green.color
                    self?.idVerificateWithPhoneNumberView.verificationCompletedButton.backgroundColor = SharedDSKitAsset.Colors.green.color
                }
                else {
                    self?.idVerificateWithPhoneNumberView.verificationCompletedButton.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
                }
            })
            .disposed(by: disposeBag)
    }
}
