//
//  SignInReactor.swift
//  FeatureSignInInterface
//
//  Created by 강민성 on 1/17/24.
//

import Foundation
import Shared
import Domain

import RxSwift
import RxCocoa
import RxFlow
import ReactorKit

enum SignInError: Error {
    case notSignedUp
    case serverError
}

public class SignInReactor: ReactorKit.Reactor, Stepper {
    
    public var initialState: State = State()
    public var steps = PublishRelay<Step>()
    
    let provider: ServiceProviderType
    
    
    public enum Action {
        case didContinueWithEmailButtonTapped
        case didSignInWithEmailButtonTapped
    }
    
    public enum Mutation {
        case setEmailSignUp
        case setEmailSigning
    }
    
    public struct State {
        
    }
    
    public init(provider: ServiceProviderType) {
        self.provider = provider
        self.initialState = State()
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didContinueWithEmailButtonTapped:
            provider.signUpService.signUpWithEmailData = SignUpWithEmailData()
            steps.accept(SignInStep.agreementsIsRequried)
            return .just(.setEmailSignUp)
        case .didSignInWithEmailButtonTapped:
            steps.accept(SignInStep.emailSigningRequired)
            return .just(.setEmailSignUp)
        }
    }
    
}
