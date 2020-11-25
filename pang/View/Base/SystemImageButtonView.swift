//
//  RemoveButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI

struct SystemImageButtonView: View {
    let systemImage: String
    let content: () -> Void
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.content()
            }
        }, label: {
            Image(systemName: systemImage)
                .font(.headline)
        })
        .buttonStyle(CardButtonStyle(shape: Circle()))
    }
}

struct SystemImageButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SystemImageButtonView(systemImage: "trash") {
        }
    }
}
