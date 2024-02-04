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
        var isIncorrectFormedPassword: Bool = false
        var isIncorrectFormedConfirmPassword: Bool = false
        
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
            guard let password = initialState.password else { return .empty() }
            
            return provider.signInService.setPasswordWithPhoneNumber(phoneNumber: phoneNumber, password: password).validate(statusCode: 200...299)
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
            
        case .setConfirmPassword(let confirmPassword):
            state.confirmPassword = confirmPassword
            
        case .pushCompleteView:
            state.shouldPushCompleteView = true
        }
        
        return state
    }
}
