//
//  PangInputView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct PangInputView: View {
    @EnvironmentObject var pangs: Pangs
    @Binding var pangText: String
    var body: some View {
        HStack {
            TextField("Thinking out loud!", text: $pangText)
                .autocapitalization(.none)
                .multilineTextAlignment(.leading)
                .keyboardType(.twitter)
                .lineLimit(2)
            Button(action: {
                pangs.add(Pang(text: pangText))
                pangText = ""
                UIApplication.shared.endEditing()
                
            }) {
                PangButtonView()
            }
        }
        .padding()
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(10)
        .padding()
        .shadow(radius: 10)
    }
}

struct PangInputView_Previews: PreviewProvider {
    static var previews: some View {
        PangInputView(pangText: .constant(""))
    }
}
