//
//  Gradient-extension.swift
//  pang
//
//  Created by 김종원 on 2020/11/17.
//

import SwiftUI

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
