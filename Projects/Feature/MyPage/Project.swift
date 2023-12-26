//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by coco on 2023/12/13.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Feature.name+ModulePath.Feature.MyPage.rawValue,
    targets: [
        .feature(
            interface: .MyPage,
            factory: .init(
                dependencies: [
                    .domain
                ]
            )
        ),
        .feature(
            implements: .MyPage,
            factory: .init(
                dependencies: [
                    .feature(interface: .MyPage)
                ]
            )
        )
    ]
)
