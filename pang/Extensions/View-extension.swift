//
//  View-extension.swift
//  pang
//
//  Created by 김종원 on 2020/11/19.
//

import SwiftUI

extension View {
    func neumorphismBackgroundStyle<S: Shape>(inLightMode: Bool, shape: S) -> some View {
        self.modifier(NeumorphismBackgroundStyle(inLightMode: inLightMode, shape: shape))
    }
}
