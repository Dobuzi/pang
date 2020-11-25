//
//  Neumorphism.swift
//  pang
//
//  Created by 김종원 on 2020/11/17.
//

import SwiftUI

struct NeumorphismButtonStyle<S: Shape>: ButtonStyle {
    var inLightMode: Bool
    var shape: S
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .padding()
            .contentShape(shape)
            .background(
                Group {
                    if inLightMode {
                        OffWhiteBackground(isHighlighted: configuration.isPressed, shape: shape)
                    } else {
                        DarkBackground(isHighlighted: configuration.isPressed, shape: shape)
                    }
                }
            )
    }
}

struct NeumorphismBackgroundStyleModifier<S: Shape>: ViewModifier {
    var inLightMode: Bool
    var shape: S
    func body(content: Content) -> some View {
        content
            .contentShape(shape)
            .padding()
            .background(
                Group {
                    if inLightMode {
                        OffWhiteBackground(isHighlighted: false, shape: shape)
                    } else {
                        DarkBackground(isHighlighted: false, shape: shape)
                    }
                }
            )
    }
}
