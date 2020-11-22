//
//  Light.swift
//  pang
//
//  Created by 김종원 on 2020/11/17.
//

import SwiftUI

struct OffWhiteBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(Color.offWhite)
                    .overlay(
                        shape
                            .stroke(Color.gray, lineWidth: 4)
                            .blur(radius: 4)
                            .offset(x: 2, y: 2)
                            .mask(shape.fill(LinearGradient(Color.black, Color.clear)))
                    )
                    .overlay(
                        shape
                            .stroke(Color.white, lineWidth: 8)
                            .blur(radius: 4)
                            .offset(x: -2, y: -2)
                            .mask(shape.fill(LinearGradient(Color.clear, Color.black)))
                    )
                    .shadow(color: .black, radius: 10, x: -5, y: -5)
                    .shadow(color: .white, radius: 10, x: 5, y: 5)
            } else {
                shape
                    .fill(Color.offWhite)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            }
        }
    }
}

struct ColorfulBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(.lightEnd, .lightStart))
                    .overlay(shape.stroke(LinearGradient(.lightStart, .lightEnd), lineWidth: 4))
                    .shadow(color: .lightStart, radius: 10, x: 5, y: 5)
                    .shadow(color: .lightEnd, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(.lightStart, .lightEnd))
                    .shadow(color: .lightStart, radius: 10, x: -10, y: -10)
                    .shadow(color: .lightEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct ColorfulButtonStyle<S: Shape>: ButtonStyle {
    var shape: S
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .contentShape(shape)
            .background(
                ColorfulBackground(isHighlighted: configuration.isPressed, shape: shape)
            )
    }
}

struct ColorfulToggleStyle<S: Shape>: ToggleStyle {
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
            ColorfulBackground(isHighlighted: configuration.isOn, shape: shape)
        )
    }
}

