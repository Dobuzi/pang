//
//  CancelButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/11/23.
//

import SwiftUI

struct CancelButtonView: View {
    @Environment(\.presentationMode) var presentationMode
    let withText: Bool
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            if withText {
                Label("Cancel", systemImage: "xmark.circle")
            } else {
                Image(systemName: "xmark.circle")
            }
            
        })
        .foregroundColor(.red)
        .padding()
        .glassCardStyle(shape: Capsule())
    }
}

struct CancelButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CancelButtonView(withText: true)
    }
}
