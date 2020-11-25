//
//  PangButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct PangButtonView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var pangInstance: PangObject
    
    @Binding var pangText: String
    @Binding var inputImages: [UIImage]
    
    var body: some View {
        Button(action: self.uploadPang) {
            HStack {
                Label(
                    title: { Text("Pang!") },
                    icon: { Image(systemName: "burst") }
                )
            }
        }
        .buttonStyle(CardButtonStyle(shape: Capsule()))
    }
    
    func uploadPang() {
        withAnimation(.spring()) {
            pangInstance.add(Pang(text: pangText == "" ? nil : pangText, images: inputImages))
            inputImages = []
            pangText = ""
            UIApplication.shared.endEditing()
        }
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct PangButtonView_Previews: PreviewProvider {
    @State static var inputType: String = "Text"
    @State static var pangText: String = ""
    @State static var inputImages: [UIImage] = []
    static var previews: some View {
        PangButtonView(pangInstance: PangObject(), pangText: $pangText, inputImages: $inputImages)
    }
}
