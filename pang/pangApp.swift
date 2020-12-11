//
//  pangApp.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI
import Firebase

@main
struct pangApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
