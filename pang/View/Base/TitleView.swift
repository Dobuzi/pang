//
//  TitleView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI

struct TitleView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isTapped = false
    @State private var titleColor: Color = Color(
        .sRGB,
        red: Double.random(in: 0...1),
        green: Double.random(in: 0...1),
        blue: Double.random(in: 0...1),
        opacity: 1
    )
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                titleColor = Color(
                    .sRGB,
                    red: Double.random(in: 0...1),
                    green: Double.random(in: 0...1),
                    blue: Double.random(in: 0...1),
                    opacity: 1
                )
            }
        }, label: {
            Label(title: { BrandNameView(titleColor: $titleColor) },
                  icon: { LogoView(titleColor: $titleColor) })
        })
        .buttonStyle(NeumorphismButtonStyle(inLightMode: colorScheme == .light, shape: RoundedRectangle(cornerRadius: 15)))
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
            .preferredColorScheme(.dark)
    }
}
