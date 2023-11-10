//
//  Project.swift
//  
//
//  Created by yoonyeosong on 2023/11/06.
//

import Foundation
import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Feature.name+ModulePath.Feature.SignUp.rawValue,
    targets: [
        .feature(
            interface: .Profile
            factory: .init(
                dependencies: [
                    .domain
                ]
            )
        ),
        .feature(
            implements: .Profile,
            factory: .init(
                dependencies: [
                    .feature(interface: .Profile)
                ]
            )
        )
    ]
)
