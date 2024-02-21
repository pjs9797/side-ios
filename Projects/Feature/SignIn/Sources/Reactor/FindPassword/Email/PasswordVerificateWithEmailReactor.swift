//
//  PasswordVerificateWithEmailReactor.swift
//  FeatureSignIn
//
//  Created by 강민성 on 2/4/24.
//

import Foundation
import Shared
import Domain

import RxSwift
import RxCocoa
import RxFlow
import ReactorKit

public class PasswordVerificateWithEmailReactor: ReactorKit.Reactor, Stepper {
    
    public var initialState: State = State()
    public var steps = PublishRelay<Step>()
    
    let provider: ServiceProviderType
    
    var timer: Timer?
    
    private var timerTime = 0
    private var timerString = ""
    
    public enum Action {
        case didBackButtonTapped
        case writeEmail(String)
        case writeVerificationCode(String)
        case didTapRequestVerificationNumberButton
        case didTapVerificateCompleteButton
    }
    
    public enum Mutation {
        case setEmail(String)
        case setVerificateCode(String)
        
        case updateTime(Int)
        case apiRequested(Int)
        
        case setTimerString(String)
        case setInitialTime
        
        case setError
    }
    
    public struct State {
        var isIncorrectFormedEmail: Bool = false
        var isIncorrectVerificationCode: Bool = false
        
        var email: String? = nil
        var verificationCode: String? = nil
        
        var isStartTimer: Bool = false
        var isTimeOut: Bool = false
        var timerTime = 180
        var timerString = ""
        var isVerificationEnable: Bool = false
        var isVerificationComplete: Bool? = nil
        
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
            
        case .writeVerificationCode(let verificationCode):
            return .just(.setVerificateCode(verificationCode))
            
        case .didTapRequestVerificationNumberButton:
            guard let email = currentState.email else { return .empty() }
            
            let apiObservable = provider.signInService.sendEmailForVerificationToFindPassword(email: email)
                .validate(statusCode: 200...299)
                .map { _ in Mutation.apiRequested(0) }
            
            let intervalObservable = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
                            .map { 180 - $0 }
                            .take(180)
                            .map { Mutation.updateTime($0)}
            
            return Observable.concat([
                Observable.just(.setInitialTime),
                Observable.combineLatest(intervalObservable, apiObservable)
                    .map { (intervalMutation, apiMutation) in
                        return [intervalMutation, apiMutation]
                    }
                    .flatMap { Observable.from($0) }
            ])
            
        case .didTapVerificateCompleteButton:
            guard let email = currentState.email else { return .empty() }
            guard let code = currentState.verificationCode else { return .empty() }
            
            return provider.signInService.checkCodeWithEmail(email: email, code: code).responseData().flatMap { [weak self] response, data -> Observable<Mutation> in
                switch response.statusCode {
                case 400...499:
                    return .just(.setError)
                default:
                    self?.steps.accept(SignInStep.newPasswordWithEmailIsRequired(email))
                    return .empty()
                }
            }
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case .setEmail(let email):
            state.email = email
            
        case .setVerificateCode(let verificationCode):
            state.verificationCode = verificationCode
            
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
            
        case .apiRequested(_):
            break
            
        case .setError:
            state.isIncorrectVerificationCode = true
        }
        
        if let email = state.email {
            if !checkEmail(str: email) && email != "" {
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
        state.isVerificationComplete = state.verificationCode?.count == 6
        return state
    }
}

extension PasswordVerificateWithEmailReactor {
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
