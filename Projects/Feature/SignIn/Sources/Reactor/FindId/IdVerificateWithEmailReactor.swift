//
//  IdVerificateWithEmailReactor.swift
//  FeatureSignIn
//
//  Created by 강민성 on 1/29/24.
//

import Foundation
import Shared
import Domain

import RxSwift
import RxCocoa
import RxFlow
import ReactorKit

public class IdVerificateWithEmailReactor: ReactorKit.Reactor, Stepper {
    
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
        case writeEmail(String)
        case writeVerificationNumber(String)
        case didTapRequestVerificationNumberButton
        case didTapVerificateNumberButton
    }
    
    public enum Mutation {
        case setEmail(String)
        case setVerificateNumber(String)
        
        case updateTime(Int)
        case apiResponseReceived(Int)
        
        case setTimerString(String)
        case setInitialTime
    }
    
    public struct State {
        var isIncorrectFormedEmail: Bool = false
        var isIncorrectVerificationNumber: Bool = false
        
        var email: String? = nil
        var verificationNumber: String? = nil
        
        var isStartTimer: Bool = false
        var isTimeOut: Bool = false
        var timerTime = 180
        var timerString = ""
        var isVerificationEnable: Bool = false
        var isVerificationComplete: Bool = false
        
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
            
        case .writeEmail(let email):
            return .just(.setEmail(email))
            
        case .writeVerificationNumber(let verificationNumber):
            return .just(.setVerificateNumber(verificationNumber))
            
        case .didTapRequestVerificationNumberButton:
            let intervalObservable = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
                            .map { 180 - $0 }
                            .take(180)
                            .map { Mutation.updateTime($0)}

            //          provider.signinService 에서 인증번호 요청 api 호출하기
                        let apiObservable =
                            Observable<Int>.just(1)
                            .map { Mutation.apiResponseReceived($0) }
            
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
        case .setEmail(let email):
            state.email = email
            
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
            
        case .apiResponseReceived(_):
            break
        }
        
        if let email = state.email {
            if !checkEmail(str: email) {
                state.isIncorrectFormedEmail = true
            }
            else {
                state.isIncorrectFormedEmail = false
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

extension IdVerificateWithEmailReactor {
    func checkEmail(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
    }
    
    func formattedTimerString(time: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter.string(from: TimeInterval(time)) ?? "0:00"
    }
}
