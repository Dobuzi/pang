//
//  GlassStyle.swift
//  pang
//
//  Created by 김종원 on 2020/12/17.
//

import SwiftUI

struct GlassBackgroundStyle: View {
    @State private var startPoint = UnitPoint(x: 0, y: -2)
    @State private var endPoint = UnitPoint(x: 4, y: 0)
    private let colors1: [Color] = [.init("Gradient1"),
                                    .init("Gradient2"),
                                    .init("Gradient3"),
                                    .init("Gradient4")]
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors1), startPoint: startPoint, endPoint: endPoint)
            .opacity(0.6)
            .edgesIgnoringSafeArea(.all)
            .animation(Animation.easeInOut(duration: 10).repeatForever())
            .onAppear {
                self.startPoint = UnitPoint(x: 4, y: 0)
                self.endPoint = UnitPoint(x: 0, y: 2)

                self.startPoint = UnitPoint(x: -4, y: 2)
                self.endPoint = UnitPoint(x: 4, y: 0)
            }
    }
}

struct GlassCardStyle<S: Shape>: View {
    let shape: S
    
    var body: some View {
        shape
            .fill(Color("Background").opacity(0.2))
            .overlay(shape.stroke(Color("Background").opacity(0.5), lineWidth: 0.5))
    }
}
