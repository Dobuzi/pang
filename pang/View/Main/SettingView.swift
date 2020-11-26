//
//  SettingView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI

struct SettingView: View {
    @Binding var pangs: Pangs
    var body: some View {
        ZStack {
            BackgroundView()
            HStack {
                Text("Caches")
                Spacer()
                SystemImageButtonView(systemImage: "trash") {
                    pangs.removeCache()
                }
            }
            .frame(width: 150, height: 100)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    @State static var pangs = Pangs()
    static var previews: some View {
        SettingView(pangs: $pangs)
            .preferredColorScheme(.dark)
    }
}
