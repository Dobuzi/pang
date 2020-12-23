//
//  GlassModifier.swift
//  pang
//
//  Created by 김종원 on 2020/12/17.
//

import SwiftUI

struct GlassCardStyleModifier<S: Shape>: ViewModifier {
    let shape: S
    
    func body(content: Content) -> some View {
        content
            .contentShape(shape)
            .background(GlassCardStyle(shape: shape))
            .shadow(radius: 10)
    }
}
