//
//  NewPasswordInputWithPhoneNumberReactor.swift
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

public class NewPasswordInputWithPhoneNumberReactor: ReactorKit.Reactor, Stepper {
    
    public var initialState: State = State()
    public var steps = PublishRelay<Step>()
    
    let provider: ServiceProviderType
    
    public enum Action {
        case didBackButtonTapped
        case writePassword(String)
        case writeConfirmPassword(String)
        case didTapChangePasswordCompleteButton
    }
    
    public enum Mutation {
        case setPassword(String)
        case setConfirmPassword(String)
        case pushCompleteView
    }
    
    public struct State {
        var isIncorrectFormedPassword: Bool? = nil
        var isIncorrectFormedConfirmPassword: Bool? = nil
        
        var isPasswordContainsEnglish: Bool = false
        var isPasswordContainsSymbol: Bool = false
        var isPasswordContainsNumber: Bool = false
        var isPasswordLengthIsMoreThanSix: Bool = false
        
        var isSamePasswordBefore: Bool = false
        var isCompleteEnable: Bool = false

        var password: String? = nil
        var confirmPassword: String? = nil
        var shouldPushCompleteView: Bool = false
    }
    
    private let disposeBag: DisposeBag = DisposeBag()
    let phoneNumber: String
    
    init(provider: ServiceProviderType, phoneNumber: String) {
        self.initialState = State()
        self.provider = provider
        self.phoneNumber = phoneNumber
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didBackButtonTapped:
            steps.accept(SignInStep.popViewController(animated: true))
            return .empty()
            
        case .writePassword(let password):
            return .just(.setPassword(password))
            
        case .writeConfirmPassword(let confirmPassword):
            return .just(.setConfirmPassword(confirmPassword))
            
        case .didTapChangePasswordCompleteButton:
            steps.accept(SignInStep.userChangedPassword)
            return .empty()
            /*
            API 적용되면 적용시킬것
            guard let password = initialState.password else { return .empty() }
            return provider.signInService.setPasswordWithEmail(email: email, password: password).validate(statusCode: 200...299)
                .flatMap { [weak self] _ -> Observable<Mutation> in
                    self?.steps.accept(SignInStep.userChangedPassword)
                    return .empty()
                }
            
            */
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case .setPassword(let password):
            state.password = password
            state.isPasswordContainsEnglish = checkPasswordContainsEnglish(password)
            state.isPasswordContainsSymbol = checkPasswordContainsSymbol(password)
            state.isPasswordContainsNumber = checkPasswordContainsNumber(password)
            state.isPasswordLengthIsMoreThanSix = 6...20 ~= password.count
            
            if state.isPasswordContainsNumber &&
                state.isPasswordContainsEnglish &&
                state.isPasswordContainsSymbol &&
                state.isPasswordLengthIsMoreThanSix {
                state.isIncorrectFormedPassword = false
            }
            else {
                state.isIncorrectFormedPassword = true
            }
            
        case .setConfirmPassword(let confirmPassword):
            state.confirmPassword = confirmPassword
            
            // 두 비밀번호가 다르고, 두 비밀번호가 입력되지 않은 상태라면
            if state.password != state.confirmPassword && state.password != "" && state.confirmPassword != "" {
                // enable false
                state.isIncorrectFormedConfirmPassword = true
                state.isCompleteEnable = false
            }
            else {
                state.isIncorrectFormedConfirmPassword = false
                state.isCompleteEnable = true
            }
            
        case .pushCompleteView:
            state.shouldPushCompleteView = true
        }
        return state
    }
    
    private func checkPasswordContainsEnglish(_ string: String) -> Bool {
        let regex = "[a-zA-Z]"
        
        if string.range(of: regex, options: .regularExpression) != nil {
            return true
        }
        else {
            return false
        }
    }
    
    private func checkPasswordContainsSymbol(_ string: String) -> Bool {
        let regex = "[!@#$%^&=+]"
        
        if string.range(of: regex, options: .regularExpression) != nil {
            return true
        }
        else {
            return false
        }
    }
    
    private func checkPasswordContainsNumber(_ string: String) -> Bool {
        let regex = "[0-9]"
        
        if string.range(of: regex, options: .regularExpression) != nil {
            return true
        }
        else {
            return false
        }
    }
}
