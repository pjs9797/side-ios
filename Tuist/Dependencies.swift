//
//  Dependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 10/30/23.
//

import ProjectDescription

let SPM = SwiftPackageManagerDependencies([
    .remote(url: "https://github.com/ReactiveX/RxSwift.git", requirement: .exact("6.6.0")),
    .remote(url: "https://github.com/Alamofire/Alamofire.git", requirement: .upToNextMajor(from: "5.8.1")),
    .remote(url: "https://github.com/ReactorKit/ReactorKit.git", requirement: .upToNextMajor(from: "3.2.0")),
    .remote(url: "https://github.com/SnapKit/SnapKit.git", requirement: .upToNextMajor(from: "5.6.0")),
    .remote(url: "https://github.com/WenchaoD/FSCalendar.git", requirement: .upToNextMajor(from: "2.8.3"))
    .remote(url: "https://github.com/jonkykong/SideMenu", requirement: .upToNextMajor(from: "6.0.0"))
])

let dependencies = Dependencies(
    swiftPackageManager: SPM,
    platforms: [.iOS]
)
