//
//  AddButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/11/23.
//

import SwiftUI

struct AddButtonView: View {
    @Binding var pangs: Pangs
    @Binding var showingSheet: Bool
    
    var body: some View {
        Button(action: {
            self.showingSheet = true
        }) {
            Label("Add", systemImage: "plus.circle")
        }
        .foregroundColor(.offPurple)
        .sheet(isPresented: $showingSheet) {
            PangInputView(pangs: $pangs)
        }
    }
}

struct AddButtonView_Previews: PreviewProvider {
    @State static var pangs = Pangs.example
    static var previews: some View {
        AddButtonView(pangs: $pangs, showingSheet: .constant(false))
    }
}
