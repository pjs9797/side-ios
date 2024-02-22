//
//  Modules.swift
//  MyPlugin
//
//  Created by 강민성 on 10/30/23.
//

import Foundation
import ProjectDescription

public enum ModulePath {
    case feature(Feature)
    case domain(Domain)
    case core(Core)
    case shared(Shared)
    case flow(Flow)
}

// MARK: AppModule

public extension ModulePath {
    enum App: String, CaseIterable {
        case iOS
        
        public static let name: String = "App"
    }
}


// MARK: FeatureModule
public extension ModulePath {
    enum Feature: String, CaseIterable {
        case SignIn
        case SignUp
        case Profile
        case Chat
        case Home
        case MyPage
        
        public static let name: String = "Feature"
    }
}

// MARK: DomainModule

public extension ModulePath {
    enum Domain: String, CaseIterable {
        case Auth
        
        public static let name: String = "Domain"
    }
}

// MARK: CoreModule

public extension ModulePath {
    enum Core: String, CaseIterable {
        case Network
        case Step
        
        public static let name: String = "Core"
    }
}

// MARK: SharedModule

public extension ModulePath {
    enum Shared: String, CaseIterable {
        case Utils
        case DSKit
        case ThirdPartyLib
        
        public static let name: String = "Shared"
    }
}

// MARK: FlowModule

public extension ModulePath {
    enum Flow: String, CaseIterable {
        case flow
        
        public static let name: String = "Flow"
    }
}
