//
//  GithubLogInButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/12/23.
//

import SwiftUI
import FirebaseAuth

struct GithubLogInButtonView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var info: AppDelegate
    var background: Color {
        colorScheme == .light ? .white : .black
    }
    var image: String {
        colorScheme == .light ? "GitHub-Mark" : "GitHub-Mark-Light"
    }
    var body: some View {
        Button(action: self.signInWithGithub) {
            HStack {
                Image(image)
                    .opacity(0.8)
                    .padding(.leading, 10)
                Spacer()
                Text("Github")
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .frame(width: 130, height: 50)
            .background(background.opacity(0.2))
            .cornerRadius(5)
            .shadow(radius: 5)
        }
    }
    
    func signInWithGithub() {
        let provider = OAuthProvider(providerID: "github.com")
        provider.customParameters = ["allow_signup": "false"]
        provider.scopes = ["user:email"]
        
        provider.getCredentialWith(nil) { credential, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let credential = credential {
                Auth.auth().signIn(with: credential) { authResult, error in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    // User is signed in.
                    // IdP data available in authResult.additionalUserInfo.profile.
                    if let profile = authResult?.additionalUserInfo?.profile {
                        print(profile.debugDescription)
                    }
                    guard let oauthCredential = authResult?.credential as? OAuthCredential else { return }
                    // GitHub OAuth access token can also be retrieved by:
                    // oauthCredential.accessToken
                    if let token = oauthCredential.accessToken {
                        print(token)
                    }
                    // GitHub OAuth ID token can be retrieved by calling:
                    // oauthCredential.idToken
                    if let idToken = oauthCredential.idToken {
                        print(idToken)
                    }
                }
            }
        }
    }
}

struct GithubLogInButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GithubLogInButtonView()
            
    }
}
