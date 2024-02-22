//
//  Target+Templates.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 10/30/23.
//

import ProjectDescription
import DependencyPlugin

// MARK: Target + Template

public struct TargetFactory {
    var name: String
    var platform: Platform
    var product: Product
    var productName: String?
    var bundleId: String?
    var deploymentTarget: DeploymentTarget?
    var infoPlist: InfoPlist?
    var sources: SourceFilesList?
    var resources: ResourceFileElements?
    var copyFiles: [CopyFilesAction]?
    var headers: Headers?
    var entitlements: Entitlements?
    var scripts: [TargetScript]
    var dependencies: [TargetDependency]
    var settings: Settings?
    var coreDataModels: [CoreDataModel]
    var environment: [String: String]
    var launchArguments: [LaunchArgument]
    var additionalFiles: [FileElement]
    
    public init(
        name: String = "",
        platform: Platform = .iOS,
        product: Product = .staticLibrary,
        productName: String? = nil,
        bundleId: String? = nil,
        deploymentTarget: DeploymentTarget? = nil,
        infoPlist: InfoPlist? = .default,
        sources: SourceFilesList? = .sources,
        resources: ResourceFileElements? = nil,
        copyFiles: [CopyFilesAction]? = nil,
        headers: Headers? = nil,
        entitlements: Entitlements? = nil,
        scripts: [TargetScript] = [],
        dependencies: [TargetDependency] = [],
        settings: Settings? = nil,
        coreDataModels: [CoreDataModel] = [],
        environment: [String : String] = [:],
        launchArguments: [LaunchArgument] = [],
        additionalFiles: [FileElement] = []) {
        self.name = name
        self.platform = platform
        self.product = product
        self.productName = productName
        self.deploymentTarget = Project.Environment.deploymentTarget
        self.bundleId = bundleId
        self.infoPlist = infoPlist
        self.sources = sources
        self.resources = resources
        self.copyFiles = copyFiles
        self.headers = headers
        self.entitlements = entitlements
        self.scripts = scripts
        self.dependencies = dependencies
        self.settings = settings
        self.coreDataModels = coreDataModels
        self.environment = environment
        self.launchArguments = launchArguments
        self.additionalFiles = additionalFiles
    }
}

public extension Target {
    private static func make(factory: TargetFactory) -> Self {
        return .init(
            name: factory.name,
            platform: factory.platform,
            product: factory.product,
            productName: factory.productName,
            bundleId: factory.bundleId ?? Project.Environment.bundlePrefix + ".\(factory.name)",
            deploymentTarget: factory.deploymentTarget,
            infoPlist: factory.infoPlist,
            sources: factory.sources,
            resources: factory.resources,
            copyFiles: factory.copyFiles,
            headers: factory.headers,
            entitlements: factory.entitlements,
            scripts: factory.scripts,
            dependencies: factory.dependencies,
            settings: factory.settings,
            coreDataModels: factory.coreDataModels,
            environment: factory.environment,
            launchArguments: factory.launchArguments,
            additionalFiles: factory.additionalFiles
        )
    }
}

// MARK: Target + App

public extension Target {
    static func app(implements module: ModulePath.App, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.App.name + module.rawValue
        
        switch module {
        case .iOS:
            newFactory.platform = .iOS
            newFactory.product = .app
            newFactory.name = Project.Environment.appName
            newFactory.bundleId = Project.Environment.bundlePrefix
            newFactory.sources = .sources
            newFactory.resources = ["Resources/**"]
            newFactory.productName = "TP"
        }
        return make(factory: newFactory)
    }
}


// MARK: Target + Feature

public extension Target {
    static func feature(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Feature.name
        
        return make(factory: newFactory)
    }
    
    static func feature(implements module: ModulePath.Feature, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Feature.name + module.rawValue
        
        return make(factory: newFactory)
    }
    
    static func feature(interface module: ModulePath.Feature, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Feature.name + module.rawValue + "Interface"
        newFactory.sources = .interface
        
        return make(factory: newFactory)
    }
    
}

// MARK: Target + Domain

public extension Target {
    static func domain(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Domain.name
        
        return make(factory: newFactory)
    }
    
    static func domain(implements module: ModulePath.Domain, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Domain.name + module.rawValue
        
        return make(factory: newFactory)
    }
    
    static func domain(interface module: ModulePath.Domain, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Domain.name + module.rawValue + "Interface"
        newFactory.sources = .interface
        
        return make(factory: newFactory)
    }
}

// MARK: Target + Core

public extension Target {
    static func core(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Core.name
        
        return make(factory: newFactory)
    }
    
    static func core(implements module: ModulePath.Core, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Core.name + module.rawValue
        
        return make(factory: newFactory)
    }
    
    static func core(interface module: ModulePath.Core, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Core.name + module.rawValue + "Interface"
        newFactory.sources = .interface
        
        return make(factory: newFactory)
    }
}

// MARK: Target + Shared

public extension Target {
    static func shared(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Shared.name
        
        return make(factory: newFactory)
    }
    
    static func shared(implements module: ModulePath.Shared, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Shared.name + module.rawValue
        
        if module == .DSKit {
            newFactory.sources = .sources
            newFactory.resources = ["Resources/**"]
            newFactory.product = .staticFramework
        }
        
        return make(factory: newFactory)
    }
    
    static func shared(interface module: ModulePath.Shared, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Shared.name + module.rawValue + "Interface"
        newFactory.sources = .interface
        
        return make(factory: newFactory)
    }
}

// MARK: Target + Flow

public extension Target {
    static func flow(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Flow.name
        
        return make(factory: newFactory)
    }
    
    static func flow(implements module: ModulePath.Flow, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Flow.name
        
        return make(factory: newFactory)
    }
}
