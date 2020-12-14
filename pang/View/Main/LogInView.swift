//
//  LogInView.swift
//  pang
//
//  Created by 김종원 on 2020/12/09.
//

import SwiftUI
import FirebaseAuth

struct LogInView: View {
    @EnvironmentObject var info: AppDelegate
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    Form {
                        TextField("이메일", text: $email)
                            .keyboardType(.emailAddress)
                            .textContentType(.emailAddress)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        SecureField("비밀번호", text: $password)
                            .textContentType(.password)
                            .autocapitalization(.none)
                        Button(action: logIn, label: {
                            Text("Sign In")
                        })
                        .disabled((email.count < 3 || password.count < 8))
                    }
                    .frame(height: 300)
                    Spacer()
                    GoogleLogInButtonView()

                    HStack {
                        Spacer()
                        NavigationLink(destination: CreateUserView()) {
                            Text("Sign Up")
                                .font(.headline)
                        }
                        .buttonStyle(CardButtonStyle(shape: RoundedRectangle(cornerRadius: 15)))
                    }
                    .padding()
                    
                }
                .background(Color("Background"))
                
                if info.onProcess {
                    LoadingView(text: "Signing In...")
                }
            }
            .navigationBarTitle("pang!")
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
            info.onProcess = true
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
            
            withAnimation {
                info.onProcess = false
                info.loginSuccess = true
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
            
            
    }
}
