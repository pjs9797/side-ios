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
        implements: .ThirdPartyLib,
        factory: .init(
            dependencies: [
                .external(name: "RxSwift"),
                .external(name: "ReactorKit"),
                .external(name: "Alamofire"),
                .external(name: "RxCocoa"),
                .external(name: "FSCalendar"),
                .external(name: "SideMenu")
            ]
        )
    )
]

let project: Project = .init(
    name: "SharedThirdPartyLib",
    targets: targets
)
