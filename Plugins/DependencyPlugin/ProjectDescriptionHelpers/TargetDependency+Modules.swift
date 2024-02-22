//
//  TargetDependency+Modules.swift
//  MyPlugin
//
//  Created by 강민성 on 10/30/23.
//

import Foundation
import ProjectDescription

// MARK: TargetDependency + App

public extension TargetDependency {
    static var app: Self {
        return .project(target: ModulePath.App.name, path: .app)
    }
    
    static func app(implements module: ModulePath.App) -> Self {
        return .target(name: ModulePath.App.name + module.rawValue)
    }
}

// MARK: TargetDependency + Feature

public extension TargetDependency {
    static var feature: Self {
        return .project(target: ModulePath.Feature.name, path: .feature)
    }
    
    static func feature(implements module: ModulePath.Feature) -> Self {
        return .project(target: ModulePath.Feature.name + module.rawValue, path: .feature(implementation: module))
    }
    
    static func feature(interface module: ModulePath.Feature) -> Self {
        return .project(target: ModulePath.Feature.name + module.rawValue + "Interface", path: .feature(implementation: module))
    }
    
}

// MARK: TargetDependency + Domain

public extension TargetDependency {
    static var domain: Self {
        return .project(target: ModulePath.Domain.name, path: .domain)
    }
    
    static func domain(implements module: ModulePath.Domain) -> Self {
        return .project(target: ModulePath.Domain.name + module.rawValue, path: .domain(implementation: module))
    }
    
    static func domain(interface module: ModulePath.Domain) -> Self {
        return .project(target: ModulePath.Domain.name + module.rawValue + "Interface", path: .domain(implementation: module))
    }
}

// MARK: TargetDependency + Core

public extension TargetDependency {
    static var core: Self {
        return .project(target: ModulePath.Core.name, path: .core)
    }
    
    static func core(implements module: ModulePath.Core) -> Self {
        return .project(target: ModulePath.Core.name + module.rawValue, path: .core(implementation: module))
    }
    
    static func core(interface module: ModulePath.Core) -> Self {
        return .project(target: ModulePath.Core.name + module.rawValue + "Interface", path: .core(implementation: module))
    }
}

// MARK: TargetDependency + Shared

public extension TargetDependency {
    static var shared: Self {
        return .project(target: ModulePath.Shared.name, path: .shared)
    }
    
    static func shared(implements module: ModulePath.Shared) -> Self {
        return .project(target: ModulePath.Shared.name + module.rawValue, path: .shared(implementation: module))
    }
    
    static func shared(interface module: ModulePath.Shared) -> Self {
        return .project(target: ModulePath.Shared.name + module.rawValue + "Interface", path: .shared(implementation: module))
    }
}

// MARK: TargetDependency + Flow

public extension TargetDependency {
    static var flow: Self {
        return .project(target: ModulePath.Flow.name, path: .flow)
    }
    
    static func flow(implements module: ModulePath.Flow) -> Self {
        return .project(target: ModulePath.Flow.name + module.rawValue, path: .flow(implementation: module))
    }
}
