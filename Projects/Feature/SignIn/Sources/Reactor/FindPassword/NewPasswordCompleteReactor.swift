//
//  NewPasswordCompleteReactor.swift
//  FeatureSignIn
//
//  Created by 강민성 on 2/9/24.
//

import Foundation
import Shared
import Domain

import RxSwift
import RxCocoa
import ReactorKit
import RxFlow

public class NewPasswordCompleteRactor: ReactorKit.Reactor, Stepper {
    
    public var initialState: State = State()
    public var steps = PublishRelay<Step>()
    
    let provider: ServiceProviderType
    
    public enum Action {
        case didGoBackToSignInButtonTapped
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
        case .didGoBackToSignInButtonTapped:
            steps.accept(SignInStep.userChangedPasswordAndSignInRequired)
            return .empty()
        }
    }
}
