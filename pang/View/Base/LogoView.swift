//
//  LogoView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI

struct LogoView: View {
    @Binding var titleColor: Color
    var body: some View {
        ZStack {
            Image(systemName: "burst")
                .font(.largeTitle)
            Image(systemName: "burst")
                .font(.body)
                .foregroundColor(titleColor)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView(titleColor: .constant(Color(
            .sRGB,
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1),
            opacity: 1
        )))
    }
}
