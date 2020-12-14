//
//  CreateUserView.swift
//  pang
//
//  Created by 김종원 on 2020/12/09.
//

import SwiftUI
import FirebaseAuth

struct CreateUserView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var info: AppDelegate
    
    @State private var newEmail: String = ""
    @State private var newPassword1: String = ""
    @State private var newPassword2: String = ""
    
    @State private var emailIsValid: Bool = false
    @State private var password1IsValid: Bool = false
    @State private var password2IsValid: Bool = false
    
    @State private var secureLevel = 0
    @State private var showingSecureInfo = false
    @State private var infoTitle = "비밀 번호 등급 기준"
    @State private var infoMessage = "\n① 8~64자\n② 영어 대/소문자, 숫자, 특수 문자 중 3가지 이상\n③ 사용 가능 특수 문자 : !@#$%^&*()_=/?+~.,-"
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            BackgroundView()
            Form {
                Section {
                    HStack {
                        TextField("이메일", text: $newEmail)
                            .keyboardType(.emailAddress)
                            .disableAutocorrection(true)
                            .textContentType(.emailAddress)
                            .autocapitalization(.none)
                        Image(systemName: emailIsValid ? "checkmark" : "xmark")
                            .foregroundColor(emailIsValid ? .green : .red)
                    }
                    HStack {
                        SecureField("비밀번호", text: $newPassword1)
                            .textContentType(.newPassword)
                            .autocapitalization(.none)
                            .keyboardType(.default)
                        Image(systemName: password1IsValid ? "checkmark" : "xmark")
                            .foregroundColor(password1IsValid ? .green : .red)
                    }
                    
                    HStack {
                        SecureField("비밀번호 확인", text: $newPassword2)
                            .textContentType(.newPassword)
                            .autocapitalization(.none)
                            .keyboardType(.default)
                        Image(systemName: password2IsValid ? "checkmark" : "xmark")
                            .foregroundColor(password2IsValid ? .green : .red)
                    }
                    HStack {
                        Capsule(style: .continuous)
                            .frame(height: 10)
                            .foregroundColor(secureLevel > 0 ? .red : .secondary)
                            .opacity(0.5)
                        Capsule(style: .continuous)
                            .frame(height: 10)
                            .foregroundColor(secureLevel > 1 ? .yellow : .secondary)
                            .opacity(0.5)
                        Capsule(style: .continuous)
                            .frame(height: 10)
                            .foregroundColor(secureLevel > 2 ? .green : .secondary)
                            .opacity(0.5)
                    }
                }
                .onChange(of: newEmail, perform: checkEmail)
                .onChange(of: newPassword1, perform: checkPassword1)
                .onChange(of: newPassword2, perform: checkPassword2)
                .onTapGesture {
                    withAnimation {
                        self.hideKeyboard()
                    }
                }
                
                Section {
                    InfoButtonView(showingInfo: $showingSecureInfo, labelTitle: infoTitle, title: infoTitle, message: infoMessage)
                }
            }
            if info.onProcess {
                LoadingView(text: "Signing In...")
            }
        }
        .navigationBarItems(trailing: Button(action: createUser) { Text("회원 가입") }
                                .disabled(!(emailIsValid && password1IsValid && password2IsValid)))
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK")) { presentationMode.wrappedValue.dismiss() }
            )
        }
    }
    
    func checkEmail(_ email: String) {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        emailIsValid = emailPredicate.evaluate(with: email)
    }
    
    func checkPassword1(_ password1: String) {
        print(password1)
        guard password1.count >= 8 && password1.count <= 64 else {
            withAnimation {
                password1IsValid = false
                secureLevel = 0
            }
            return
        }
        
        var counter = 0
        
        let digitFormat = ".*[0-9].*"
        let digitPredicate = NSPredicate(format: "SELF MATCHES %@", digitFormat)
        if digitPredicate.evaluate(with: password1) {
            print("digited")
            counter += 1
        }
        
        let lowercaseFormat = ".*[a-z].*"
        let lowercasePredicate = NSPredicate(format: "SELF MATCHES %@", lowercaseFormat)
        if lowercasePredicate.evaluate(with: password1) {
            print("lowercased")
            counter += 1
        }
        
        let uppercaseFormat = ".*[A-Z].*"
        let uppercasePredicate = NSPredicate(format: "SELF MATCHES %@", uppercaseFormat)
        if uppercasePredicate.evaluate(with: password1) {
            print("uppercased")
            counter += 1
        }
        
        let specialFormat = ".*[!@#$%^&*()_=/?+~.,-].*"
        let specialPredicate = NSPredicate(format: "SELF MATCHES %@", specialFormat)
        if specialPredicate.evaluate(with: password1) {
            print("special words")
            counter += 1
        }
        
        withAnimation {
            secureLevel = counter
            
            if secureLevel > 2 {
                password1IsValid = true
            } else {
                password1IsValid = false
            }
        }
    }
    
    func checkPassword2(_ password2: String) {
        password2IsValid = (password2 == newPassword1) && password1IsValid
    }
    
    func createUser() {
        info.onProcess = true
        Auth.auth().createUser(withEmail: newEmail, password: newPassword1) { authResult, error in
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }
            
            guard let authResult = authResult else {
                print("No authResult.")
                return
            }
            
            authResult.user.sendEmailVerification { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                } else {
                    print("Success to create user")
                    alertTitle = "회원 가입 완료"
                    alertMessage = "이메일 인증 후 사용 가능합니다."
                    showingAlert = true
                    return
                }
            }
        }
        info.onProcess = false
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateUserView()
        }
        .preferredColorScheme(.dark)
    }
}
