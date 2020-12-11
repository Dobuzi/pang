//
//  ContentView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct ContentView: View {
    @State private var logInSuccess = false
    @State private var pangs = Pangs()
    
    var body: some View {
        Group {
            if logInSuccess {
                TabView {
                    HomeView(pangs: $pangs)
                        .tabItem { Label("Home", systemImage: "house") }
                    SettingView(pangs: $pangs)
                        .tabItem { Label("Setting", systemImage: "gear") }
                }
                .onAppear {
                    UITabBar.appearance().barTintColor = UIColor(Color("Background"))
                    UITabBar.appearance().tintColor = UIColor(.offPurple)
                }
            } else {
                LogInView(logInSuccess: $logInSuccess)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
