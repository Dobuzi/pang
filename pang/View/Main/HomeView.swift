//
//  HomeView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct HomeView: View {
    @StateObject var pangInstance: PangObject
    @State private var showingSheet = false
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                PangListView(pangInstance: pangInstance)
                    .navigationBarTitle("Pang!", displayMode: .large)
                    .navigationBarItems(trailing: AddButtonView(showingSheet: $showingSheet))
                    .sheet(isPresented: $showingSheet) {
                        PangInputView(pangInstance: pangInstance)
                    }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(pangInstance: PangObject.example)
            .preferredColorScheme(.dark)
    }
}
