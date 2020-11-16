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
        VStack {
            PangInputView(pangText: $pangText)
            List {
                ForEach(pangs.pangs.reversed()) { pang in
                    Text(pang.text)
                }
            }
        }
        .environmentObject(pangs)
        .onTapGesture {
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
