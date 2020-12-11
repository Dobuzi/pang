//
//  LogInView.swift
//  pang
//
//  Created by 김종원 on 2020/12/09.
//

import SwiftUI
import FirebaseAuth

struct LogInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @Binding var logInSuccess: Bool
    
    @State private var showingSheet = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            Form {
                Section {
                    TextField("이메일", text: $email)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                    SecureField("비밀번호", text: $password)
                        .textContentType(.password)
                }
                
                Section {
                    Button(action: logIn, label: {
                        Text("입장")
                    })
                }
                
                Section {
                    Button(action: { showingSheet = true }) {
                        Text("회원 가입")
                    }
                }
            }
        }
        .sheet(isPresented: $showingSheet) {
            CreateUserView()
        }
    }
    
    func logIn() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error while signing in : \(error.localizedDescription)")
                return
            }
            guard let authResult = authResult else {
                print("No user.")
                return
            }
            print("\(authResult)")
            logInSuccess = true
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView(logInSuccess: .constant(false))
    }
}
