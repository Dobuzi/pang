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
    
    @State private var showingSheet = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Spacer()
                TitleView()
                LogInFormView()
                OrView()
                    .opacity(0.5)
                    .padding()
                GoogleLogInButtonView()
                GithubLogInButtonView()
                Spacer()
                HStack {
                    Spacer()
                    Button(action: { self.showingSheet = true }) {
                        Text("회원 가입")
                            .font(.subheadline)
                            .foregroundColor(.offPurple)
                    }
                    .padding()
                    .glassCardStyle(shape: Capsule())
                }
            }
            .padding()
            if info.onProcess {
                LoadingView(text: "입장 중...")
            }
        }
        .sheet(isPresented: $showingSheet, content: {
            CreateUserView()
        })
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
            .environmentObject(AppDelegate())
    }
}
