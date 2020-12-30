//
//  GoogleLogInButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/12/12.
//

import SwiftUI
import GoogleSignIn

struct GoogleLogInButtonView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var info: AppDelegate
    
    var body: some View {
        Button(action: self.signInWithGoogle) {
            HStack {
                Image("btn_google_light_normal_ios")
                Spacer()
                Text("Google")
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .frame(width: 130, height: 50)
            .background(Color("Google").opacity(0.2))
            .cornerRadius(5)
            .shadow(radius: 5)
        }
    }
    
    func signInWithGoogle() {
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
        withAnimation {
            GIDSignIn.sharedInstance()?.signIn()
        }
    }
}

struct GoogleLogInButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            GoogleLogInButtonView()
        }
    }
}
