//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 10/30/23.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let targets: [Target] = [
    .domain(
        factory: .init(
            dependencies: [
                .domain(implements: .Auth),
                .core
            ]
        )
    )
]

let project: Project = .makeModule(
    name: "Domain",
    targets: targets
)
