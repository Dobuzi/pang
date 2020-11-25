//
//  PangTextFieldView.swift
//  pang
//
//  Created by 김종원 on 2020/11/19.
//

import SwiftUI
import Combine

struct PangTextFieldView: View {
    @StateObject var pangInstance: PangObject
    @Binding var pangText: String
    let wordLimit: Int = 40
    var isFull: Bool {
        pangText.count > wordLimit
    }
    var body: some View {
        VStack(alignment: .trailing, spacing: 10) {
            TextEditor(text: $pangText)
                .autocapitalization(.none)
                .keyboardType(.twitter)
                .frame(height: 90)
                .cornerRadius(5)
                .onReceive(Just(self.pangText)) { input in
                    if isFull {
                        self.pangText.removeLast()
                    }
                }
                
            Text("\(pangText.count) / \(wordLimit)")
                .foregroundColor(.secondary)
                .font(.subheadline)
        }
    }
}

struct PangTextFieldView_Previews: PreviewProvider {
    @State static var pangText: String = ""
    static var previews: some View {
        return PangTextFieldView(pangInstance: PangObject(), pangText: $pangText)
            
    }
}
