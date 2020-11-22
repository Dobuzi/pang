//
//  ContentView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var pangInstance = PangObject()
    var body: some View {
        ZStack {
            BackgroundView()
            TabView {
                HomeView(pangInstance: pangInstance)
                    .tabItem { Label("Home", systemImage: "house") }
                SettingView(pangInstance: pangInstance)
                    .tabItem { Label("Setting", systemImage: "gear") }
            }
        }
        .environmentObject(pangInstance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            
    }
}
