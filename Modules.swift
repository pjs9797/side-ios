//
//  Modules.swift
//  
//
//  Created by yoonyeosong on 2023/11/06.
//

import Foundation
import ProjectDescription

public enum ModulePath {
    case feature(Feature)
    case domain(Domain)
    case core(Core)
    case shared(Shared)
}

public extension ModulePath {
    enum App: String, CaseIterable {
        case iOS
        
        public static let name: String = "App"
    }
}


public extension ModulePath {
    enum Feature: String, CaseIterable{
        case Profile
        
        public static let name: Stirng = "Feature"
    }
}
