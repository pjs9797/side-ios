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

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowscene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame:UIScreen.main.bounds)
        window?.windowScene = windowscene
        
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
