//
//  AppStep.swift
//  CoreNetwork
//
//  Created by 강민성 on 2/22/24.
//

import Foundation
import RxFlow

public enum AppStep: Step {
    // Global
    case popViewController
    case popToRootViewController
    case dismiss
    case present
    
    // SignIn
    case signInRequired
    case userIsSignedIn
    case userIsSignedOut
    case forgotId
    case forgotIdPhoneNumberIsRequired
    case forgotIdEmailisRequired
    case forgotPassword
    case forgotPasswordPhoneNumberIsRequired
    case forgotPasswordEmailIsRequired
    case newPasswordIsRequired(String)
    case userChangedPassword
    
    // SignUp
    case agreementsIsRequried
    // Profile
    
    // Home
    
    // Chat
    
    // MyPage
}
