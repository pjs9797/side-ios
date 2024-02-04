//
//  NewPasswordInputWithEmailViewReactor.swift
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

public class NewPasswordInputWithEmailReactor: ReactorKit.Reactor, Stepper {
    
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
        var isIncorrectFormedPassword: Bool = false
        var isIncorrectFormedConfirmPassword: Bool = false
        
        var isPasswordContainsEnglish: Bool = false
        var isPasswordContainsSymbol: Bool = false
        var isPasswordContainsNumber: Bool = false
        var ispasswordLengthIsMorethanSix: Bool = false
        
        var isNotContainsEnglish: Bool = false
        var isNotContainsSymbol: Bool = false
        var isNotContainsNumber: Bool = false
        var isNotMoreThanSix: Bool = false
        var isCompleteEnable: Bool = false

        var password: String? = nil
        var confirmPassword: String? = nil
        var shouldPushCompleteView: Bool = false
    }
    
    private let disposeBag: DisposeBag = DisposeBag()
    let email: String
    
    init(provider: ServiceProviderType, email: String) {
        self.initialState = State()
        self.provider = provider
        self.email = email
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
            guard let password = initialState.password else { return .empty() }
            
            return provider.signInService.setPasswordWithEmail(email: email, password: password).validate(statusCode: 200...299)
                .map { _ in
                    Mutation.pushCompleteView
                }
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
            state.ispasswordLengthIsMorethanSix = 6...25 ~= password.count
            
            if !state.isPasswordContainsNumber {
                state.isNotContainsNumber = true
            }
            else {
                state.isNotContainsNumber = true
            }
            
            if !state.isPasswordContainsSymbol {
                state.isNotContainsSymbol = true
            }
            else {
                state.isNotContainsSymbol = true
            }
            
            if !state.isPasswordContainsEnglish {
                state.isNotContainsEnglish = true
            }
            else {
                state.isNotContainsEnglish = true
            }
            
            if !state.ispasswordLengthIsMorethanSix {
                state.isNotMoreThanSix = true
            }
            else {
                state.isNotMoreThanSix = true
            }
            
            if state.isPasswordContainsNumber && state.isPasswordContainsEnglish && state.isPasswordContainsSymbol && state.ispasswordLengthIsMorethanSix {
                state.isCompleteEnable = true
            }
            else {
                state.isCompleteEnable = false
            }
            
        case .setConfirmPassword(let confirmPassword):
            state.confirmPassword = confirmPassword
            
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
        let regex = "[!@#$%^&*()-=+]"
        
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
