//
//  SignInStep.swift
//  FeatureSignInInterface
//
//  Created by 강민성 on 1/18/24.
//

import Foundation
import Shared

import RxFlow

public enum SignInStep: Step {
    //Global
    case popViewController(animated: Bool)
    
    // SignIn
    case signInRequired
    case emailSigningRequired
    case userIsSignedIn
    case userIsSignedOut
    case forgotId
    case forgotIdPhoneNumberIsRequired
    case forgotIdEmailisRequired
    case forgotPassword
    case forgotPasswordPhoneNumberIsRequired
    case forgotPasswordEmailIsRequired
    case newPasswordWithEmailIsRequired(String)
    case newPasswordWIthPhoneNumberIsRequired(String)
    case agreementsIsRequried // SginIn -> SignUp
    case userChangedPassword
    case userChangedPasswordAndSignInRequired
}
