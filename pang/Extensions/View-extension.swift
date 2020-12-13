//
//  View-extension.swift
//  pang
//
//  Created by 김종원 on 2020/11/19.
//

import SwiftUI
import Combine

extension View {
    func neumorphismBackgroundStyle<S: Shape>(inLightMode: Bool, shape: S) -> some View {
        self.modifier(NeumorphismBackgroundStyleModifier(inLightMode: inLightMode, shape: shape))
    }
    
    func cardBackgroundStyle<S: Shape>(isHighlighted: Bool, shape: S) -> some View {
        self.modifier(CardBackgroundStyleModifier(isHighlighted: isHighlighted, shape: shape))
    }
    
    func keyboardAdaptive(edge: Edge.Set) -> some View {
        ModifiedContent(content: self, modifier: KeyboardAdaptive(edge: edge))
    }
}

struct KeyboardAdaptive: ViewModifier {
    @State private var keyboardHeight: CGFloat = 0
    let edge: Edge.Set
    func body(content: Content) -> some View {
        content
            .padding(edge, keyboardHeight)
            .onReceive(Publishers.keyboardHeight) { val in
                withAnimation {
                    self.keyboardHeight = val
                }
            }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
