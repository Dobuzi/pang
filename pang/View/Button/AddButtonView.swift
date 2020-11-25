//
//  AddButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/11/23.
//

import SwiftUI

struct AddButtonView: View {
    @Binding var showingSheet: Bool
    var body: some View {
        Button(action: { self.showingSheet.toggle() }) {
            Label("Add", systemImage: "plus.circle")
        }
        .foregroundColor(.offPurple)
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView(showingSheet: .constant(false))
    }
}
