//
//  GoogleLogInButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/12/12.
//

import SwiftUI
import GoogleSignIn

struct GoogleLogInButtonView: View {
    var body: some View {
        Button(action: self.signInWithGoogle, label: {
            Image("btn_google_light_normal_ios")
        })
    }
    
    func signInWithGoogle() {
        print(UIApplication.shared.windows.first ?? "")
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
        GIDSignIn.sharedInstance()?.signIn()
    }
}

struct GoogleLogInButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleLogInButtonView()
    }
}
