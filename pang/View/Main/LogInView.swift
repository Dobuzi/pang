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
    @State private var showingAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
    @Binding var logInSuccess: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                Form {
                    Section {
                        TextField("이메일", text: $email)
                            .keyboardType(.emailAddress)
                            .textContentType(.emailAddress)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        SecureField("비밀번호", text: $password)
                            .textContentType(.password)
                            .autocapitalization(.none)
                        Button(action: logIn, label: {
                            Text("Log In")
                        })
                        .disabled((email.count < 3 || password.count < 8))
                        GoogleLogInButtonView()
                    }
                    
                    Section {
                        NavigationLink(
                            destination: CreateUserView(),
                            label: {
                                Text("회원 가입")
                            })
                    }
                }
                .background(Color("Background"))
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
            }
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
            }
        }
    }
    
    func logIn() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error while signing in : \(error.localizedDescription)")
                alertTitle = "로그 인 에러"
                alertMessage = error.localizedDescription
                showingAlert = true
                return
            }
            guard let authResult = authResult else {
                print("No user.")
                alertTitle = "로그 인 에러"
                alertMessage = "사용자가 존재하지 않습니다."
                showingAlert = true
                return
            }
            print(authResult)
            guard authResult.user.isEmailVerified else {
                print("Email is not verified")
                alertTitle = "이메일 미인증"
                DispatchQueue.main.async {
                    authResult.user.sendEmailVerification { error in
                        if let error = error {
                            print(error.localizedDescription)
                            alertMessage = "이메일 인증 후 재시도 부탁드립니다."
                            return
                        } else {
                            print("Successfully sent email verification")
                            alertMessage = "이메일 인증 후 재시도 부탁드립니다. 인증 이메일이 재송부 되었습니다."
                            return
                        }
                    }
                }
                showingAlert = true
                return
            }
            logInSuccess = true
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView(logInSuccess: .constant(false))
    }
}
