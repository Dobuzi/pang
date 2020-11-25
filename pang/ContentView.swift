//
//  ContentView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var pangInstance = PangObject()
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(named: "BackgroundContent")
    }
    
    var body: some View {
        TabView {
            HomeView(pangInstance: pangInstance)
                .tabItem { Label("Home", systemImage: "house") }
            SettingView(pangInstance: pangInstance)
                .tabItem { Label("Setting", systemImage: "gear") }
        }
        .tabViewStyle(DefaultTabViewStyle())
        .environmentObject(pangInstance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
