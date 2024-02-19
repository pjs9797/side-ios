//
//  DataRepository.swift
//  CoreNetwork
//
//  Created by 강민성 on 1/15/24.
//

import Foundation
import RxSwift
import Alamofire

import CoreNetwork

public protocol ServiceProviderType {
    var settingsService: SettingService { get }
    var signInService: SignInService { get }
    var signUpService: SignUpService { get }
    var userService: UserService { get }
    var createMeetingService: CreateMeetingService { get }
    var myPageService: MyPageService { get }
}

final public class DataRepository: ServiceProviderType {
    
    public static let shared = DataRepository()
    
    var disposeBag: DisposeBag = DisposeBag()
    
    let backgroundScheduler = ConcurrentDispatchQueueScheduler(queue: DispatchQueue.global())
    
    public lazy var settingsService: SettingService = SettingService.shared
    
    lazy var networkManager: NetworkReachabilityManager? = {
        let manager = NetworkReachabilityManager(host: "www.apple.com")
        manager?.startListening(onUpdatePerforming: { status in
            switch status {
            case .reachable(_):
                print("네트워크 연결 가능")
                
            case .notReachable:
                print("네트워크 연결 불가능")
                
            case .unknown:
                print("네트워크 연결상태 알수없음")
            }
        })
        
        return manager
    }()
    
    private init() {
        self.disposeBag = DisposeBag()
    }
    
    lazy public var signInService: SignInService = SignInService(baseURL: APIServiceURL.baseURL, isLogging: true)
    
    lazy public var signUpService: SignUpService = SignUpService(baseURL: APIServiceURL.baseURL, isLogging: true)
    
    lazy public var userService: UserService = UserService(baseURL: APIServiceURL.baseURL, isLogging: true)
    
    lazy public var createMeetingService: CreateMeetingService = CreateMeetingService(baseURL: APIServiceURL.baseURL, isLogging: true)
    
    lazy public var myPageService: MyPageService = MyPageService(baseURL: APIServiceURL.baseURL, isLogging: true)
}
