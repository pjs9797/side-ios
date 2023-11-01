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
    .shared(
        implements: .DSKit,
        factory: .init(
            dependencies: [
                .external(name: "SnapKit")
            ]
        )
    )
]

let project: Project = .init(
    name: "SharedDSKit",
    targets: targets,
    resourceSynthesizers: [
        .assets(),
        .fonts()
    ]
)
