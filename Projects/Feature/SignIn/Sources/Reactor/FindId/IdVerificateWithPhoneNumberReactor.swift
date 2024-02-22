//
//  IdVerificateWithPhoneNumberReactor.swift
//  FeatureSignIn
//
//  Created by 강민성 on 2/1/24.
//

import Foundation
import Shared
import Domain
import CoreStep

import FirebaseAuth
import FirebaseMessaging
import FirebaseCore
import RxSwift
import RxCocoa
import RxFlow
import ReactorKit

public class IdVerificateWithPhoneNumberReactor: ReactorKit.Reactor, Stepper {
    
    public var initialState: State = State()
    public var steps = PublishRelay<Step>()
    
    let provider: ServiceProviderType
    
    private let timerObservable: Observable<Int>? = Observable<Int>
        .interval(.seconds(1), scheduler: MainScheduler.instance)
    
    var timer: Timer?
    
    private var timerTime = 0
    private var timerString = ""
    
    public enum Action {
        case didBackButtonTapped
        case writePhoneNumber(String)
        case writeVerificationNumber(String)
        case didTapRequestVerificationNumberButton
        case didTapVerificateNumberButton
    }
    
    public enum Mutation {
        case setPhoneNumber(String)
        case setVerificateNumber(String)
        
        case updateTime(Int)
        case apiResponseReceived(String)
        
        case setTimerString(String)
        case setInitialTime
    }
    
    public struct State {
        var isIncorrectFormedPhoneNumber: Bool = false
        var isIncorrectVerificationNumber: Bool = false
        
        var phoneNumber: String? = nil
        var verificationNumber: String? = nil
        
        var isStartTimer: Bool = false
        var isTimeOut: Bool = false
        var timerTime = 180
        var timerString = ""
        var isVerificationEnable: Bool = false
        var isVerificationComplete: Bool = false
        
        var verificationId: String? = nil
        
        var intervalValue: Int?
    }
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    init(provider: ServiceProviderType) {
        self.initialState = State()
        self.provider = provider
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didBackButtonTapped:
            steps.accept(SignInStep.popViewController(animated: true))
            return .empty()
            
        case .writePhoneNumber(let phoneNumber):
            return .just(.setPhoneNumber(phoneNumber))
            
        case .writeVerificationNumber(let verificationNumber):
            return .just(.setVerificateNumber(verificationNumber))
            
        case .didTapRequestVerificationNumberButton:
            let intervalObservable = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
                            .map { 180 - $0 }
                            .take(180)
                            .map { Mutation.updateTime($0)}

            //          provider.signinService 에서 인증번호 요청 api 호출하기
            
            let apiObservable = requestVerification(phoneNumber: currentState.phoneNumber)
                .map { Mutation.apiResponseReceived($0) }
            
//                        let apiObservable =
//                            Observable<Int>.just(1)
//                            .map { Mutation.apiResponseReceived($0) }
            
            return Observable.concat([
                Observable.just(.setInitialTime),
                Observable.combineLatest(intervalObservable, apiObservable)
                    .map { (intervalMutation, apiMutation) in
                        return [intervalMutation, apiMutation]
                    }
                    .flatMap { Observable.from($0) }
            ])
            
        case .didTapVerificateNumberButton:
            // provider.signInService 에서 인증번호 인증하기 api 호출하기
            return .empty()
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
            
        case .setPhoneNumber(let phoneNumber):
            state.phoneNumber = phoneNumber
            
        case .setVerificateNumber(let verificationNumber):
            state.verificationNumber = verificationNumber
            
        case .setInitialTime:
            state.timerTime = 180
            
        case .setTimerString(let timerString):
            state.timerString = timerString
            
        case .updateTime(let time):
            state.isStartTimer = true
            state.timerTime = time
            state.timerTime -= 1
            if state.timerTime <= 0 {
                state.isTimeOut = true
                state.timerTime = 0
            }
            state.timerString = formattedTimerString(time: state.timerTime)
            
        case .apiResponseReceived(let verificationId):
            state.verificationId = verificationId
        }
        
        if let phoneNumber = state.phoneNumber {
            if !checkPhoneNumber(phoneNumber: phoneNumber) {
                state.isIncorrectFormedPhoneNumber = true
            }
            else {
                state.isIncorrectFormedPhoneNumber = false
            }
        }
        else {
            state.isVerificationComplete = false
        }
        
        // 임의로 6글자면 충족되게 만든것
        state.isVerificationComplete = state.verificationNumber?.count == 6
        return state
    }
}

extension IdVerificateWithPhoneNumberReactor {
    
    func checkPhoneNumber(phoneNumber: String) -> Bool {
        let regex = "^010-?([0-9]{4})-?([0-9]{4})$"
        let pred = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return pred.evaluate(with: phoneNumber)
    }
    
    func formattedTimerString(time: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter.string(from: TimeInterval(time)) ?? "0:00"
    }
    
    func requestVerification(phoneNumber: String?) -> Observable<String> {
        let phoneNumber = "+82\(phoneNumber!.replacingOccurrences(of: "-", with: ""))"
        
        return Observable.create { observer in
            PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationId, error in
                if let error = error {
                    return observer.onError(error)
                }
                observer.onNext(verificationId ?? "")
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    func verifyCode(smsCode: String) -> Single<String> {
        guard let verificationId = currentState.verificationId else {
            return .never()
        }
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: smsCode)
        
        return Single.create { single in
            Auth.auth().signIn(with: credential) { result, error in
                guard error == nil else { return }
                
                single(.success(""))
            }
            return Disposables.create()
        }
    }
}
