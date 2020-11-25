//
//  PangInputView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct PangInputView: View {
    @StateObject var pangInstance: PangObject
    @State private var pangText: String = ""
    @State private var inputImages: [UIImage] = []
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 30) {
                HStack {
                    CancelButtonView()
                    Spacer()
                    PangButtonView(pangInstance: pangInstance, pangText: $pangText, inputImages: $inputImages)
                        .disabled(pangText == "" && inputImages.count == 0)
                }
                PangTextFieldView(pangInstance: pangInstance, pangText: $pangText)
                PangImageInputView(inputImages: $inputImages)
                Spacer()
                HStack {
                    Spacer()
                    ImageButtonView(inputImages: $inputImages)
                }
            }
            .padding()
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct PangInputView_Previews: PreviewProvider {
    static var previews: some View {
        PangInputView(pangInstance: PangObject())
            
    }
}
