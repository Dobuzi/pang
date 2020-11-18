//
//  PangButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct PangButtonView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var pangs: Pangs
    
    @Binding var pangText: String
    
    var body: some View {
        Button(action: {
            if pangText == "" { return }
            withAnimation(.spring()) {
                pangs.add(Pang(text: pangText))
                pangText = ""
                UIApplication.shared.endEditing()
            }
        }) {
            Image(systemName: "burst")
                .font(.title)
        }
        .buttonStyle(NeumorphismWhiteButtonStyle(shape: Circle()))
    }
}

struct PangButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PangButtonView(pangText: .constant("Example"))
    }
}
