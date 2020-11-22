//
//  Dark.swift
//  pang
//
//  Created by 김종원 on 2020/11/17.
//

import SwiftUI

struct DarkBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(.darkEnd, .darkStart))
                    .overlay(shape.stroke(LinearGradient(.darkStart, .darkEnd), lineWidth: 4))
                    .shadow(color: .darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: .darkEnd, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(.darkStart, .darkEnd))
                    .shadow(color: .darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: .darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct DarkButtonStyle<S: Shape>: ButtonStyle {
    var shape: S
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .contentShape(shape)
            .background(
                DarkBackground(isHighlighted: configuration.isPressed, shape: shape)
            )
    }
}

struct DarkToggleStyle<S: Shape>: ToggleStyle {
    var shape: S
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .foregroundColor(.white)
                .padding()
                .contentShape(shape)
        }
        .background(
            DarkBackground(isHighlighted: configuration.isOn, shape: shape)
        )
    }
}
