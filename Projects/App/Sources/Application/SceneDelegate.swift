//
//  SceneDelegate.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 10/30/23.
//

import UIKit
import Feature
import FeatureProfile
import FeatureSignUpInterface
import FeatureSignUp
import FeatureHome

import RxSwift
import RxFlow

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    private let coordinator: FlowCoordinator = FlowCoordinator()
    private let disposeBag: DisposeBag = DisposeBag()
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowscene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowscene)
        self.window = window
        
//        self.window?.backgroundColor = .white
        self.window?.rootViewController = LaunchScreenViewController(window: window, coordinator: coordinator)
        self.window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
