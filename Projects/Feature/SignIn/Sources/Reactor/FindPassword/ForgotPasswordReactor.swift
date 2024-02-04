//
//  ForgotPasswordReactor.swift
//  FeatureSignInInterface
//
//  Created by 강민성 on 2/4/24.
//

import Foundation
import Domain
import Shared

import RxSwift
import RxCocoa
import ReactorKit
import RxFlow

public class ForgotPasswordReactor: ReactorKit.Reactor, Stepper {
    
    public var initialState: State = State()
    public var steps = PublishRelay<Step>()
    
    let provider: ServiceProviderType
    
    public enum Action {
        case didbackButtonTapped
        case didFindWithEmailButtonTapped
        case didFindWithPhoneNumberTapped
    }
    
    public enum Mutation {
        
    }
    
    public struct State {
        
    }
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    init(provider: ServiceProviderType) {
        self.initialState = State()
        self.provider = provider
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didbackButtonTapped:
            steps.accept(SignInStep.popViewController(animated: true))
            return .empty()
            
        case .didFindWithEmailButtonTapped:
            steps.accept(SignInStep.forgotPasswordEmailIsRequired)
            return .empty()
            
        case .didFindWithPhoneNumberTapped:
            steps.accept(SignInStep.forgotPasswordPhoneNumberIsRequired)
            return .empty()
        }
    }
}
