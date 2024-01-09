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
    .app(
        implements: .iOS,
        factory: .init(
            infoPlist: .file(path: "Support/Info.plist"),
            entitlements: .file(path: .relativeToRoot("App.entitlements")),
            dependencies: [
                .feature
            ]
        )
    )
]

let project: Project = .makeModule(
    name: "TP",
    targets: targets
)
