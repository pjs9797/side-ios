//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 2/22/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let targets: [Target] = [
    .core(
        interface: .Step,
        factory: .init(
            dependencies: [
                .shared
            ]
        )
    ),
    .core(
        implements: .Step,
        factory: .init(
            dependencies: [
                .core(interface: .Step)
            ]
        )
    )
]
let project: Project = .makeModule(
    name: "CoreStep",
    targets: targets
)
