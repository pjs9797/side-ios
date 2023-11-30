//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 11/6/23.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Feature.name+ModulePath.Feature.Home.rawValue,
    targets: [
        .feature(
            interface: .Home,
            factory: .init(
                dependencies: [
                    .domain
                ]
            )
        ),
        .feature(
            implements: .Home,
            factory: .init(
                dependencies: [
                    .feature(interface: .Home)
                ]
            )
        )
    ]
)
