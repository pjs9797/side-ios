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
    name: ModulePath.Shared.name+ModulePath.Shared.Utils.rawValue,
    targets: [
        .shared(
            interface: .Utils,
            factory: .init()
        ),
        .shared(
            implements: .Utils,
            factory: .init(
                dependencies: [
                    .shared(interface: .Utils)
                ]
            )
        ),
    ]
)
