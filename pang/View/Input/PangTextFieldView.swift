//
//  PangTextFieldView.swift
//  pang
//
//  Created by 김종원 on 2020/11/19.
//

import SwiftUI
import Combine

struct PangTextFieldView: View {
    @Binding var pangText: String
    let placeHolder: String = "생각을 적어보세요!"
    let wordLimit: Int = 40
    var isFull: Bool {
        pangText.count > wordLimit
    }
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 10) {
            ZStack {
                if pangText.count == 0 {
                    Text(placeHolder)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                TextEditor(text: $pangText)
                    .autocapitalization(.none)
                    .keyboardType(.twitter)
                    .font(.subheadline)
                    .frame(height: 30)
                    .opacity(0.7)
                    .onReceive(Just(self.pangText)) { input in
                        if isFull {
                            self.pangText.removeLast()
                        }
                    }
                    .onAppear {
                        UITextView.appearance().backgroundColor = UIColor(named: "Background")
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
        return PangTextFieldView(pangText: $pangText)
            
    }
}
