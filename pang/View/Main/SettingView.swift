//
//  SettingView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI

struct SettingView: View {
    @StateObject var pangInstance: PangObject
    var body: some View {
        ZStack {
            BackgroundView()
            HStack {
                Text("Caches")
                Spacer()
                SystemImageButtonView(systemImage: "trash") {
                    pangInstance.removeCache()
                }
            }
            .frame(width: 150, height: 100)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(pangInstance: PangObject())
    }
}
