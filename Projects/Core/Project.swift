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
    .core(
        factory: .init(
            dependencies: [
                .core(implements: .Network),
                .shared
            ]
        )
    )
]


let project: Project = .makeModule(
    name: "Core",
    targets: targets
)
