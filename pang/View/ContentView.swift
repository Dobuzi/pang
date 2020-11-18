//
//  ContentView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            TabView {
                HomeView()
                    .tabItem { Label("Home", systemImage: "house") }
                HomeView()
                    .tabItem { Label("Setting", systemImage: "gear") }
            }
            .tabViewStyle(PageTabViewStyle())
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
