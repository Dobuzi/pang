//
//  PangButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct PangButtonView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var pangInstance: PangObject
    
    @Binding var pangText: String
    @Binding var inputImage: UIImage?
    @Binding var image: Image?
    
    var body: some View {
        Button(action: self.uploadPang) {
            Image(systemName: "burst")
                .font(.headline)
        }
        .buttonStyle(NeumorphismButtonStyle(inLightMode: colorScheme == .light, shape: Circle()))
    }
    
    func uploadPang() {
        guard pangText != "" || inputImage != nil else { return }
        withAnimation(.spring()) {
            pangInstance.add(Pang(text: pangText, uiImage: inputImage))
            inputImage = nil
            image = nil
            pangText = ""
            UIApplication.shared.endEditing()
        }
    }
}

struct PangButtonView_Previews: PreviewProvider {
    @State static var inputType: String = "Text"
    @State static var pangText: String = ""
    @State static var inputImage: UIImage? = nil
    @State static var image: Image? = nil
    static var previews: some View {
        PangButtonView(pangInstance: PangObject(), pangText: $pangText, inputImage: $inputImage, image: $image)
    }
}
