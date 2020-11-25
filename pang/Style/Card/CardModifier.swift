//
//  CardStyle.swift
//  pang
//
//  Created by 김종원 on 2020/11/22.
//

import SwiftUI

struct CardBackgroundStyleModifier<S: Shape>: ViewModifier {
    let isHighlighted: Bool
    let shape: S
    
    func body(content: Content) -> some View {
        content
            .contentShape(shape)
            .background(CardBackgroundStyle(isHighlighted: isHighlighted, shape: shape))
    }
}
