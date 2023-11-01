//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 11/1/23.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let targets: [Target] = [
    .shared(
        factory: .init(
            dependencies: [
                .shared(implements: .DSKit),
                .shared(implements: .ThirdPartyLib),
                .shared(implements: .Utils)
            ]
        )
    )
]

let project: Project = .makeModule(
    name: "Shared",
    targets: targets
)
