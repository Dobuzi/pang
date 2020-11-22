//
//  RemoveButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI

struct RemoveButtonView: View {
    @Environment(\.colorScheme) var colorScheme
    let systemImage: String
    let content: () -> Void
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.content()
            }
        }, label: {
            Image(systemName: systemImage)
                .font(.title)
        })
        .buttonStyle(NeumorphismButtonStyle(inLightMode: colorScheme == .light, shape: Circle()))
    }
}

struct RemoveButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveButtonView(systemImage: "trash.circle") {
        }
    }
}
