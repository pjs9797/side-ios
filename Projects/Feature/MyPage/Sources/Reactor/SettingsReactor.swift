//
//  SettingsReactor.swift
//  FeatureMyPage
//
//  Created by 강민성 on 2/13/24.
//

import Foundation
import Domain
import Shared
import CoreStep

import RxSwift
import RxCocoa
import ReactorKit
import RxFlow

public class SettingsReactor: ReactorKit.Reactor, Stepper {
    
    public var initialState: State = State()
    public var steps = PublishRelay<Step>()
    
    let provider: ServiceProviderType
    
    public enum Action {
        case didTapBackButton
    }
    
    public enum Mutation {
        
    }
    
    public struct State {
        
    }
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    public init(provider: ServiceProviderType) {
        self.initialState = State()
        self.provider = provider
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didTapBackButton:
            steps.accept(MyPageStep.popViewController(animated: true))
            return .empty()
        }
    }
}

