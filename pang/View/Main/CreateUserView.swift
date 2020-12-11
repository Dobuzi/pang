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
    
    @State private var newEmail: String = ""
    @State private var newPassword1: String = ""
    @State private var newPassword2: String = ""
    
    @State private var emailIsValid: Bool = false
    @State private var password1IsValid: Bool = false
    @State private var password2IsValid: Bool = false
    
    @State private var secureLevel = 0
    
    private let passwordRules = UITextInputPasswordRules(
        descriptor: "required: upper; required: lower; required: digit; max-consecutive: 2; minlength: 8;")
    
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
                        Image(systemName: password1IsValid ? "checkmark" : "xmark")
                            .foregroundColor(password1IsValid ? .green : .red)
                    }
                    
                    HStack {
                        SecureField("비밀번호 확인", text: $newPassword2) { createUser() }
                        Image(systemName: password2IsValid ? "checkmark" : "xmark")
                            .foregroundColor(password2IsValid ? .green : .red)
                    }
                    
                }
                .onChange(of: newEmail, perform: checkEmail)
                .onChange(of: newPassword1, perform: checkPassword1)
                .onChange(of: newPassword2, perform: checkPassword2)
                
                Section {
                    Button(action: createUser, label: {
                        Text("회원 가입")
                    })
                    .disabled(!(emailIsValid && password1IsValid && password2IsValid))
                }
                
                Section {
                    Button(action: { presentationMode.wrappedValue.dismiss() }, label: {
                        Text("취소")
                            .foregroundColor(.red)
                    })
                }
            }
        }
    }
    
    func checkEmail(_ email: String) {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        emailIsValid = emailPredicate.evaluate(with: email)
    }
    
    func checkPassword1(_ password1: String) {
        guard password1.count >= 8 && password1.count <= 32 else { password1IsValid = false; return }
        
        var counter = 0
        
        let digitFormat = ".*[0-9].*"
        let digitPredicate = NSPredicate(format: "SELF MATCHES %@", digitFormat)
        if digitPredicate.evaluate(with: password1) {
            counter += 1
        }
        
        let lowercaseFormat = ".*[a-z].*"
        let lowercasePredicate = NSPredicate(format: "SELF MATCHES %@", lowercaseFormat)
        if lowercasePredicate.evaluate(with: password1) {
            counter += 1
        }
        
        let uppercaseFormat = ".*[A-Z].*"
        let uppercasePredicate = NSPredicate(format: "SELF MATCHES %@", uppercaseFormat)
        if uppercasePredicate.evaluate(with: password1) {
            counter += 1
        }
        
        let specialFormat = ".*[*.!@#$%^&(){}[]:\";'<>,.?/~`_+-=|\\].*"
        let specialPredicate = NSPredicate(format: "SELF MATCHES %@", specialFormat)
        if specialPredicate.evaluate(with: password1) {
            counter += 1
        }
        
        if counter > 2 {
            password1IsValid = true
        } else {
            password1IsValid = false
        }
        
    }
    
    func checkPassword2(_ password2: String) {
        password2IsValid = password2 == newPassword1
    }
    
    func createUser() {
        guard emailIsValid && password1IsValid && password2IsValid else { return }
        
        Auth.auth().createUser(withEmail: newEmail, password: newPassword1) { authResult, error in
          // ...
        }
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
    }
}
