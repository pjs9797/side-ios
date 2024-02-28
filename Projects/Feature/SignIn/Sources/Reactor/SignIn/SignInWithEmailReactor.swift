//
//  SignInWithEmailReactor.swift
//  FeatureSignInInterface
//
//  Created by 강민성 on 1/21/24.
//

import Foundation
import Shared
import Domain
import FeatureSignInInterface

import RxSwift
import RxCocoa
import RxFlow
import ReactorKit

public class SignInWithEmailReactor: ReactorKit.Reactor, Stepper {
    
    public var initialState: State = State()
    public var steps = PublishRelay<Step>()
    
    let provider: ServiceProviderType
    
    public enum Action {
        case didBackbuttonTapped
        case writeEmail(String)
        case writePassword(String)
        case didForgotEmailButtonTapped
        case didForgotPasswordButtonTapped
        case didSignInButtonTapped
    }
    
    public enum Mutation {
        case setEmail(String)
        case setPassword(String)
        case setSignInError(Int?)
        case setUserSignIn
    }
    
    public struct State {
        var isSignInEnable: Bool = false
        var isIncorrectFormedEmail: Bool? = nil
        var isIncorrectFormedPassword: Bool? = nil
        
        var email: String? = nil
        var password: String? = nil
        
        var isSignInFailed: Bool = false
        var signInFailMessage: String? = nil
    }
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    init(provider: ServiceProviderType) {
        self.initialState = State()
        self.provider = provider
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didBackbuttonTapped:
            steps.accept(SignInStep.popViewController(animated: true))
            return .empty()
            
        case .writeEmail(let email):
            return .just(.setEmail(email))
            
        case .writePassword(let password):
            return .just(.setPassword(password))
            
        case .didForgotEmailButtonTapped:
            steps.accept(SignInStep.forgotId)
            return .empty()
            
        case .didForgotPasswordButtonTapped:
            steps.accept(SignInStep.forgotPassword)
            return .empty()
            
        case .didSignInButtonTapped:
            guard let email = currentState.email,
                  let password = currentState.password else { return .empty() }
            
            return provider.signInService.signIn(email: email, password: password).validate(statusCode: 200...299).responseData().flatMap { [weak self] response, data -> Observable<Mutation> in
                do {
                    let responseData = try JSONDecoder().decode(SignInResponse.self, from: data) as SignInResponse
                    self?.provider.settingsService.isSignedIn = true
                    self?.provider.settingsService.previousSignInType = .email
                    self?.provider.settingsService.accessToken = responseData.result.accessToken
                    self?.provider.settingsService.refreshToken = responseData.result.refreshToken
                    
//                    self?.steps.accept(SignInStep.userIsSignedIn)
                    
                    return .empty()
                } catch {
                    let responseData = try JSONDecoder().decode(ErrorResponse.self, from: data) as ErrorResponse
                    print(responseData.detail)
                    return .just(.setSignInError(responseData.statusCode))
                }
            }
        }
        
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case .setEmail(let email):
            state.email = email
            
        case .setPassword(let password):
            state.password = password
            print(password)
            if checkCorrectFormedPassword(text: password) {
                // 경고메세지 false
                state.isIncorrectFormedPassword = false
                state.isSignInEnable = true
            }
            // 비밀번호가 형식에 안맞으면
            else {
                // 경고메세지 true
                state.isIncorrectFormedPassword = true
            }
        case .setSignInError(let code):
            switch code {
            case 401:
                state.signInFailMessage = "이메일 또는 비밀번호가 올바르지 않습니다.\n입력한 내용을 다시 확인해 주세요."
                
            default:
                state.signInFailMessage = "알수없는 오류가 발생하였습니다.\n인터넷 환경을 옮기시고, 다시 시도해주세요."
            }
            
        default:
            break
        }
        
        if let email = state.email, let password = state.password {
            if !checkEmail(str: email) {
                state.isIncorrectFormedEmail = true
            } else {
                state.isIncorrectFormedEmail = false
            }
            
//            // 비밀번호가 형식에 맞으면
//            if checkCorrectFormedPassword(text: password) {
//                // 경고메세지 false
//                state.isIncorrectFormedPassword = false
//                state.isSignInEnable = true
//            }
//            // 비밀번호가 형식에 안맞으면
//            else {
//                // 경고메세지 true
//                state.isIncorrectFormedPassword = true
//            }
        }
        else {
            state.isSignInEnable = false
        }
        
        return state
    }
}

extension SignInWithEmailReactor {
    func checkEmail(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
    }
    
    func checkCorrectFormedPassword(text: String) -> Bool {
        //
        guard hasContainsNumber(text: text), hasContainsEnglish(text: text), hasContainsSymbol(text: text), hasMoreThanSixLetters(text: text) else { return false }
        
        return true
    }
    
    func hasContainsNumber(text: String) -> Bool {
        return "\(text)".range(of: "\\p{Number}", options: .regularExpression) != nil
    }
    
    func hasContainsEnglish(text: String) -> Bool {
        return "\(text)".range(of: "\\p{Latin}", options: .regularExpression) != nil
    }
    
    func hasContainsSymbol(text: String) -> Bool {
        return "\(text)".range(of: "(?=.*[!@#$%^&*])", options: .regularExpression) != nil
    }
    
    func hasMoreThanSixLetters(text: String) -> Bool {
        guard text.count >= 6 else { return false }
        
        return true
    }
}
