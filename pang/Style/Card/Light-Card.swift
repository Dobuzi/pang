//
//  Light-Card.swift
//  pang
//
//  Created by 김종원 on 2020/11/22.
//

import SwiftUI

struct LightCardBackgroundStyle<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .shadow(color: .black, radius: 10, x: -5, y: -5)
                    .shadow(color: .white, radius: 10, x: 5, y: 5)
            } else {
                shape
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            }
        }
    }
}

struct LightCardButtonStyle<S: Shape>: ButtonStyle {
    var shape: S
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .contentShape(shape)
            .background(LightCardBackgroundStyle(
                            isHighlighted: configuration.isPressed,
                            shape: shape)
            )
    }
}

struct LightCardToggleStyle<S: Shape>: ToggleStyle {
    var shape: S
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .padding()
                .contentShape(shape)
        }
        .background(LightCardBackgroundStyle(
                        isHighlighted: configuration.isOn,
                        shape: shape)
        )
    }
}
