//
//  pangApp.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct pangApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView(info: self.delegate)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate, GIDSignInDelegate, ObservableObject {
    @Published var onProcess = false {
        willSet {
            self.objectWillChange.send()
        }
    }
    @Published var loginSuccess = false {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        self.onProcess = true
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let auth = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let authResult = authResult else {
                print("No user info.")
                return
            }
            
            guard let email = authResult.user.email else { return }
            print("google login user email : \(email)")
            print(authResult.user.displayName ?? "who with no name")
            self.onProcess = false
            self.loginSuccess = true
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        self.onProcess = true
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let auth = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let authResult = authResult else {
                print("No user info.")
                return
            }
            
            guard let email = authResult.user.email else { return }
            print("google login user email : \(email)")
            print(authResult.user.displayName ?? "who with no name")
            self.onProcess = false
            self.loginSuccess = true
        }
    }
}
