//
//  MyPageReactor.swift
//  FeatureMyPage
//
//  Created by 강민성 on 2/13/24.
//

import Foundation
import Domain
import Shared

import RxSwift
import RxCocoa
import ReactorKit
import RxFlow

public class MyPageReactor: ReactorKit.Reactor, Stepper {
    
    public var initialState: State = State()
    public var steps = PublishRelay<Step>()
    
    let provider: ServiceProviderType
    
    public enum Action {
        case viewWillAppear
        case didTapSettingsButton
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
        case .viewWillAppear:
            return .never()
            
        case .didTapSettingsButton:
            steps.accept(MyPageStep.settingsRequired)
            return .empty()
        }
    }
}
