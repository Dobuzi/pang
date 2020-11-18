//
//  Neumorphism.swift
//  pang
//
//  Created by 김종원 on 2020/11/17.
//

import SwiftUI

struct NeumorphismWhiteButtonStyle<S: Shape>: ButtonStyle {
    var shape: S
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .contentShape(shape)
            .background(
                Group {
                    if configuration.isPressed {
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
                    } else {
                        shape
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
    }
}
