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
    name: ModulePath.Domain.name+ModulePath.Domain.Auth.rawValue,
    targets: [
        .domain(
            interface: .Auth,
            factory: .init(
                dependencies: [
                    .core
                ]
            )
        ),
        .domain(
            implements: .Auth,
            factory: .init(
                dependencies: [
                    .domain(interface: .Auth),
                ]
            )
        ),
    ]
)
