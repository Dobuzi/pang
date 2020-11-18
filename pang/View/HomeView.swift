//
//  HomeView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct HomeView: View {
    @State private var pangText = ""
    @ObservedObject var pangs = Pangs()
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                HStack {
                    TitleView()
                    Spacer()
                    RemoveButtonView()
                }
                .padding()
                PangInputView(pangText: $pangText)
                PangListView()
            }
        }
        .environmentObject(pangs)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
