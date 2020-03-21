//
//  ViewController.swift
//  FaceboookTest
//
//  Created by Umut Sever on 20.03.2020.
//  Copyright © 2020 Umut Sever. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import GoogleSignIn


class ViewController: UIViewController, LoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        
        
        let loginButton = FBLoginButton()
        view.addSubview(loginButton)
        //frame's are obselete, please use constraints instead because its 2016 after all
        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
        
        loginButton.delegate = self
        loginButton.permissions = ["email", "public_profile"]

    }
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            print("Did log out of facebook")
        }
        
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if error != nil {
            print(error)
            return
        }
        
        let accessToken = AccessToken.current
              guard let accessTokenString = accessToken?.tokenString else { return }
              
        let credentials = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        Auth.auth().signIn(with: credentials, completion: { (user, error) in
                  if error != nil {
                      print("Something went wrong with our FB user: ", error ?? "")
                      return
                  }
                  
                  print("Successfully logged in with our user: ", user ?? "")
              })
              
              //...
          
        
        GraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, err) in
            
            if err != nil {
                print("Failed to start graph request:", err)
                return
            }
            print(result)
        }
    }
    }



