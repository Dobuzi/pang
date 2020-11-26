//
//  HomeView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct HomeView: View {
    @Binding var pangs: Pangs
    @State private var showingSheet = false
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                PangListView(pangs: $pangs)
                    .navigationBarTitle("Pang!", displayMode: .large)
                    .navigationBarItems(trailing: AddButtonView(showingSheet: $showingSheet))
                    .sheet(isPresented: $showingSheet) {
                        PangInputView(pangs: $pangs)
                    }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    @State static var pangs = Pangs.example
    static var previews: some View {
        HomeView(pangs: $pangs)
            .preferredColorScheme(.dark)
    }
}
