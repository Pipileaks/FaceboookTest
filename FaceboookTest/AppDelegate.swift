//
//  AppDelegate.swift
//  FaceboookTest
//
//  Created by Umut Sever on 20.03.2020.
//  Copyright © 2020 Umut Sever. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import GoogleSignIn
import FirebaseFirestoreSwift
import FirebaseFirestore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        // Override point for customization after application launch.
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled = ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?, annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        
        if handled {
            return handled
        }
        else {
        
        return GIDSignIn.sharedInstance().handle(url)
            
        }
    }

    
   
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
      if let error = error {
        if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
          print("The user has not signed in before or they have since signed out.")
        } else {
          print("\(error.localizedDescription)")
        }
        return
      }
        let db = Firestore.firestore()
      // Perform any operations on signed in user here.
      let userId = user.userID                  // For client-side use only!
      let idToken = user.authentication.idToken // Safe to send to the server
      let fullName = user.profile.name
      let givenName = user.profile.givenName
      let familyName = user.profile.familyName
      let email = user.profile.email
        
      // ...
        
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("google").addDocument(data: [

            "email": email,
            "fbID": userId,
            "name": givenName

        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
        
        guard let authentication = user.authentication else { return }
             let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                               accessToken: authentication.accessToken)
               Auth.auth().signIn(with: credential) { (authResult, error) in
               if let error = error {
                   
                   }
                   
             // ...
           }
        
        
    }

     

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
    
    
    
    
}


