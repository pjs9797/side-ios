//
//  ForgotIdReactor.swift
//  FeatureSignIn
//
//  Created by 강민성 on 1/29/24.
//

import Foundation
import Domain
import Shared

import RxSwift
import RxCocoa
import ReactorKit
import RxFlow

public class ForgotIdReactor: ReactorKit.Reactor, Stepper {
    
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
            steps.accept(SignInStep.forgotIdEmailisRequired)
            return .empty()
            
        case .didFindWithPhoneNumberTapped:
            steps.accept(SignInStep.forgotIdPhoneNumberIsRequired)
            return .empty()
        }
    }
}
