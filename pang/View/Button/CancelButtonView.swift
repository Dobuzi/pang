//
//  CancelButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/11/23.
//

import SwiftUI

struct CancelButtonView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Label("Cancel", systemImage: "xmark.circle")
        })
        .foregroundColor(.red)
        .buttonStyle(CardButtonStyle(shape: Capsule()))
        
    }
}

struct CancelButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CancelButtonView()
    }
}
