//
//  MyPageReactor.swift
//  FeatureMyPage
//
//  Created by 강민성 on 2/13/24.
//

import Foundation
import Domain
import Shared
import FeatureMyPageInterface
import CoreStep

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
        case setMyProfile(MyPageResult)
    }
    
    public struct State {
         var phoneNumber: String? = nil
         var nickname: String? = nil
         var email: String? = nil
         var birth: String? = nil
         var profileImageUrl: String? = nil
         var jobMajor: String? = nil
         var develops: [String] = []
         var hobbies: [String] = []
         var myClubCount: Int = 0
         var clubBookmarkCount: String? = nil
    }
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    public init(provider: ServiceProviderType) {
        self.initialState = State()
        self.provider = provider
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewWillAppear:
            return provider.myPageService.getMyProfile().data().decode(type: MyPageResponse.self, decoder: JSONDecoder())
                .map { response -> Mutation in
                    return .setMyProfile(response.result)
                }
            
        case .didTapSettingsButton:
            steps.accept(MyPageStep.settingsRequired)
            return .empty()
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case .setMyProfile(let data):
            state.phoneNumber = data.phoneNumber
            state.birth = data.birth
            state.email = data.email
            state.nickname = data.nickname
            state.profileImageUrl = data.profileImageUrl
            state.clubBookmarkCount = data.clubBookmarkCount
            state.develops = data.develops
            state.jobMajor = data.jobMajor
            state.myClubCount = data.myClubCount
            state.hobbies = data.hobbies
        }
        
        return state
    }
}
