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
    .feature(
        factory: .init(
            dependencies: [
                .domain,
                .feature(implements: .SignIn),
                .feature(implements: .SignUp),
                .feature(implements: .Profile),
                .feature(implements: .Chat),
                .feature(implements: .Home)
            ]
        )
    )
]

let project: Project = .makeModule(
    name: "Feature",
    targets: targets
)
