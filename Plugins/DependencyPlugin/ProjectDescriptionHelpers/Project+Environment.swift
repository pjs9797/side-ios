//
//  Project+Environment.swift
//  MyPlugin
//
//  Created by 강민성 on 10/30/23.
//

import Foundation
import ProjectDescription

public extension Project {
    enum Environment {
        public static let appName = "TP"
        public static let deploymentTarget = DeploymentTarget.iOS(targetVersion: "15.0", devices: [.iphone])
        public static let bundlePrefix = "sideteam.io.tp"
    }
}
