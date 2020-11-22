//
//  PangTextFieldView.swift
//  pang
//
//  Created by 김종원 on 2020/11/19.
//

import SwiftUI

struct PangTextFieldView: View {
    @StateObject var pangInstance: PangObject
    @Binding var pangText: String
    var body: some View {
        TextField("적는 공간", text: $pangText)
            .autocapitalization(.none)
            .multilineTextAlignment(.leading)
            .keyboardType(.twitter)
            // style
            .frame(height: 90)
            .padding(.horizontal)
    }
}

struct PangTextFieldView_Previews: PreviewProvider {
    static var pangText: String = ""
    static var previews: some View {
        return PangTextFieldView(pangInstance: PangObject(), pangText: .constant(""))
            
    }
}
