//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 10/30/23.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Feature.name+ModulePath.Feature.SignIn.rawValue,
    targets: [
        .feature(
            interface: .SignIn,
            factory: .init(
                dependencies: [
                    .domain
                ]
            )
        ),
        .feature(
            implements: .SignIn,
            factory: .init(
                dependencies: [
                    .feature(interface: .SignIn)
                ]
            )
        )
    ]
)
