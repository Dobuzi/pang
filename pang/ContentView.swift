//
//  ContentView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct ContentView: View {
    @StateObject var info: AppDelegate
    @State private var pangs = Pangs()
    
    var body: some View {
        Group {
            if info.loginSuccess {
                TabView {
                    HomeView(pangs: $pangs)
                        .tabItem { Label("Home", systemImage: "house") }
                    SettingView(pangs: $pangs)
                        .tabItem { Label("Setting", systemImage: "gear") }
                }
                .onAppear {
                    UITabBar.appearance().barTintColor = .clear
                }
            } else {
                LogInView()
            }
        }
        .environmentObject(info)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(info: AppDelegate())
    }
}
