//
//  PangInputView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct PangInputView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var pangInstance: PangObject
//    @State private var inputType = "Text"
    @State private var showingImageInputForm = false
    @State private var pangText: String = ""
    @State private var inputImage: UIImage?
    @State private var image: Image?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                PangTextFieldView(pangInstance: pangInstance, pangText: $pangText)
                PangButtonView(pangInstance: pangInstance,
                               pangText: $pangText,
                               inputImage: $inputImage,
                               image: $image)
            }
            VStack {
                PangImageInputView(showingImageInputForm: $showingImageInputForm, image: $image, inputImage: $inputImage)
                Button(action: {
                    withAnimation {
                        showingImageInputForm.toggle()
                    }
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.offWhite)
                            .frame(width: 320, height: 30)
                        Image(systemName: showingImageInputForm ? "chevron.up" : "chevron.down")
                    }
                    
                }
            }
        }
        .neumorphismBackgroundStyle(inLightMode: colorScheme == .light, shape: RoundedRectangle(cornerRadius: 15))
        .padding()
    }
}

struct PangInputView_Previews: PreviewProvider {
    static var previews: some View {
        PangInputView(pangInstance: PangObject())
            
            
    }
}
