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
    .remote(url: "https://github.com/jonkykong/SideMenu", requirement: .upToNextMajor(from: "6.0.0")),
    .remote(url: "https://github.com/WenchaoD/FSCalendar.git", requirement: .upToNextMajor(from: "2.8.3")),
    .remote(url: "https://github.com/firebase/firebase-ios-sdk", requirement: .upToNextMajor(from: "10.19.1")),
    .remote(url: "https://github.com/guoyingtao/Mantis.git", requirement: .exact("2.18.0")),
    .remote(url: "https://github.com/RxSwiftCommunity/RxFlow.git", requirement: .upToNextMajor(from: "2.10.0")),
    .remote(url: "https://github.com/RxSwiftCommunity/RxAlamofire.git", requirement: .upToNextMajor(from: "6.1.0")),
    .remote(url: "https://github.com/airbnb/lottie-spm.git", requirement: .upToNextMajor(from: "4.4.0")),
    .remote(url: "https://github.com/RxSwiftCommunity/RxKeyboard.git", requirement: .exact("2.0.1"))
], productTypes: [
    "FSCalendar": .framework,
    "Firebase": .framework,
    "Mantis": .framework
])

let dependencies = Dependencies(
    swiftPackageManager: SPM,
    platforms: [.iOS]
)
