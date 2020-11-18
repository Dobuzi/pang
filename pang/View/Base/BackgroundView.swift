//
//  BackgroundView.swift
//  pang
//
//  Created by 김종원 on 2020/11/17.
//

import SwiftUI

struct BackgroundView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Group {
            if colorScheme == .light {
                Color.offWhite
            } else {
                LinearGradient(.darkStart, .darkEnd)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
