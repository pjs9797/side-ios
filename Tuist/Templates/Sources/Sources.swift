//
//  Sources.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 11/1/23.
//

import ProjectDescription

private let layerAttribute = Template.Attribute.required("layer")
private let nameAttribute = Template.Attribute.required("name")

private let template = Template(
    description: "A template for a new module's sources target",
    attributes: [
        layerAttribute,
        nameAttribute
    ],
    items: [
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/Sources/Sources.swift",
            templatePath: "Sources.stencil"
        )
    ]
)
