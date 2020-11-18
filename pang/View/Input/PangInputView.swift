//
//  PangInputView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct PangInputView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var pangs: Pangs
    @Binding var pangText: String
    @Namespace var pangTextField
    var body: some View {
        HStack {
            TextField("Thinking out loud!", text: $pangText)
                .frame(width: .infinity, height: .infinity)
                .autocapitalization(.none)
                .multilineTextAlignment(.leading)
                .keyboardType(.twitter)
                .lineLimit(2)
            PangButtonView(pangText: $pangText)
        }
        .frame(height: 80)
        .padding()
        .background(Color.offWhite)
        .cornerRadius(15)
        .padding()
        .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
    }
}

struct PangInputView_Previews: PreviewProvider {
    static var previews: some View {
        PangInputView(pangText: .constant(""))
    }
}
