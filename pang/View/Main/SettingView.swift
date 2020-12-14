//
//  SettingView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI
import FirebaseAuth

struct SettingView: View {
    @EnvironmentObject var info: AppDelegate
    @Binding var pangs: Pangs
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                HStack {
                    Text("Caches")
                    Spacer()
                    SystemImageButtonView(systemImage: "trash") {
                        pangs.removeCache()
                    }
                }
                .frame(width: 150, height: 100)
                HStack {
                    Text("Sign Out")
                    Spacer()
                    SystemImageButtonView(systemImage: "figure.wave") {
                        self.signOut()
                    }
                }
                .frame(width: 150, height: 100)
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            withAnimation {
                info.loginSuccess = false
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    @State static var pangs = Pangs()
    static var previews: some View {
        SettingView(pangs: $pangs)
            .preferredColorScheme(.dark)
    }
}
