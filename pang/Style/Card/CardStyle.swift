//
//  Light-CardStyle.swift
//  pang
//
//  Created by 김종원 on 2020/11/22.
//

import SwiftUI

struct CardBackgroundStyle<S: Shape>: View {
    let isHighlighted: Bool
    let shape: S
    
    var body: some View {
        shape
            .fill(Color("BackgroundContent"))
            .shadow(color: Color("DarkShadow"), radius: 10, x: isHighlighted ? -5 : 10, y: isHighlighted ? -5 : 10)
            .shadow(color: Color("LightShadow"), radius: 10, x: isHighlighted ? 5 : -5, y: isHighlighted ? 5 : -5)
    }
}

struct CardButtonStyle<S: Shape>: ButtonStyle {
    let shape: S
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .contentShape(shape)
            .background(CardBackgroundStyle(isHighlighted: configuration.isPressed, shape: shape))
    }
}

struct CardToggleStyle<S: Shape>: ToggleStyle {
    let isLightMode: Bool
    let shape: S
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .padding()
                .contentShape(shape)
        }
        .background(CardBackgroundStyle(isHighlighted: configuration.isOn, shape: shape))
    }
}
