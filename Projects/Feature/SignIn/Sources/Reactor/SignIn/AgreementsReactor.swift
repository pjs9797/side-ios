//
//  AgreementsReactor.swift
//  FeatureSignIn
//
//  Created by 강민성 on 1/14/24.
//

import Foundation
import Shared
import Domain
import FeatureSignInInterface

import RxSwift
import RxCocoa
import ReactorKit
import RxFlow

public class AgreementsReactor: ReactorKit.Reactor, Stepper {
    
    public var initialState: State = State()
    public var steps = PublishRelay<Step>()
    
    let provider: ServiceProviderType
    
    public enum Action {
        case agreementButtonTapped(AgreementsButtonType)
        case signInButtonTapped
        
    }
    
    public enum Mutation {
        case updateButton(AgreementsButtonType)
    }
    
    public struct State {
        var isSigninButtonEnable: Bool = false
        var isAgreeAll: Bool = false
        var isAgreeFirst: Bool = false
        var isAgreeSecond: Bool = false
        var isAgreeThird: Bool = false
        var isAgreeFourth: Bool = false
    }
    
    public init(provider: ServiceProviderType) {
        self.provider = provider
        self.initialState = State()
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .agreementButtonTapped(let buttonType):
            return .just(.updateButton(buttonType))
            
        case .signInButtonTapped:
            //            steps.accept(AppStep)
            return .never()
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case .updateButton(let buttonType):
            switch buttonType {
            case .agreeAll:
                if state.isAgreeAll == true {
                    state.isAgreeAll = false
                    state.isAgreeFirst = false
                    state.isAgreeSecond = false
                    state.isAgreeThird = false
                    state.isAgreeFourth = false
                }
                else {
                    state.isAgreeAll = true
                    state.isAgreeFirst = true
                    state.isAgreeSecond = true
                    state.isAgreeThird = true
                    state.isAgreeFourth = true
                }
                
            case .checkedFirst:
                state.isAgreeFirst.toggle()
                if state.isAgreeAll == false {
                    state.isAgreeAll = false
                }
                
            case .checkedSecond:
                state.isAgreeSecond.toggle()
                if state.isAgreeAll == false {
                    state.isAgreeAll = false
                }
                
            case .checkedThird:
                state.isAgreeThird.toggle()
                if state.isAgreeAll == false {
                    state.isAgreeAll = false
                }
                
            case .checkedFourth:
                state.isAgreeFourth.toggle()
                if state.isAgreeAll == false {
                    state.isAgreeAll = false
                }
            }
            
            if state.isAgreeFirst && state.isAgreeSecond && state.isAgreeThird && state.isAgreeFourth {
                // 프로필 생성 진행가능하기
                state.isAgreeAll = true
            }
            else {
                // 프로필 생성 불가능하기
            }
            
            
            return state
        }
    }
}
