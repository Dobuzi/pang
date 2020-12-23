//
//  ImageButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/11/23.
//

import SwiftUI

struct ImageButtonView: View {
    @Binding var inputImages: [UIImage]
    
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        Button(action: { self.showingImagePicker = true }){
            Image(systemName: "photo")
        }
//        .buttonStyle(CardButtonStyle(shape: Circle()))
        .padding()
        .glassCardStyle(shape: Circle())
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage)  {
            ImagePicker(image: self.$inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = self.inputImage else { return }
        guard let compressedImageData = inputImage.jpegData(compressionQuality: 0.25) else { return }
        guard let uiImage = UIImage(data: compressedImageData) else { return }
        inputImages.append(uiImage)
    }
}

struct ImageButtonView_Previews: PreviewProvider {
    @State static var inputImages: [UIImage] = []
    static var previews: some View {
        ImageButtonView(inputImages: $inputImages)
    }
}
