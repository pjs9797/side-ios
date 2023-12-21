//
//  SignInViewController.swift
//  FeatureSignIn
//
//  Created by 강민성 on 11/6/23.
//

import UIKit
import Shared

public class SignInViewController: UIViewController {
    
    var signInView = SignInView()
    
    public override func loadView() {
        super.loadView()
        view = signInView
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    


}
