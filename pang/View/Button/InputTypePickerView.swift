//
//  InputTypePickerView.swift
//  pang
//
//  Created by 김종원 on 2020/11/19.
//

import SwiftUI

struct InputTypePickerView: View {
    @Binding var inputType: String
    var body: some View {
        Picker(selection: $inputType, label: Text("Input Type"), content: {
            Text("Text").tag("Text")
            Text("Image").tag("Image")
        })
        .pickerStyle(InlinePickerStyle())
        .frame(height: 80)
        .cardBackgroundStyle(isHighlighted: false, shape: RoundedRectangle(cornerRadius: 15))
        .padding()
        
    }
}

struct InputTypePickerView_Previews: PreviewProvider {
    @State static var inputType = "Text"
    static var previews: some View {
        InputTypePickerView(inputType: $inputType)
    }
}
