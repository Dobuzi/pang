//
//  SettingView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var pangInstance: PangObject
    var body: some View {
        ZStack {
            BackgroundView()
            ZStack {
                HStack {
                    Text("Remove caches")
                    Spacer()
                    RemoveButtonView(systemImage: "trash.circle") {
                        pangInstance.removeCache()
                    }
                }
            }
            .frame(width: 220, height: 100)
            .neumorphismBackgroundStyle(inLightMode: colorScheme == .light, shape: RoundedRectangle(cornerRadius: 15))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(pangInstance: PangObject())
    }
}
