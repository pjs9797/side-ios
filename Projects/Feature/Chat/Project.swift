//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 11/21/23.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Feature.name+ModulePath.Feature.Chat.rawValue,
    targets: [
        .feature(
            interface: .Chat,
            factory: .init(
                dependencies: [
                    .domain
                ]
            )
        ),
        .feature(
            implements: .Chat,
            factory: .init(
                dependencies: [
                    .feature(interface: .Chat)
                ]
            )
        )
    ]
)
    

