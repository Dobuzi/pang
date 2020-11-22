//
//  HomeView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct HomeView: View {
    @StateObject var pangInstance: PangObject
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                HStack {
                    TitleView()
                    Spacer()
                    RemoveButtonView(systemImage: "arrow.clockwise") {
                        self.pangInstance.removePangs()
                    }
                }
                .padding()
                PangInputView(pangInstance: pangInstance)
                PangListView(pangInstance: pangInstance)
                    .padding(.top, 30)
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(pangInstance: PangObject())
            .preferredColorScheme(.dark)
    }
}
