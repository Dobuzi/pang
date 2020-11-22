//
//  PangImageInputView.swift
//  pang
//
//  Created by 김종원 on 2020/11/19.
//

import SwiftUI

struct PangImageInputView: View {
    @Binding var showingImageInputForm: Bool
    @Binding var image: Image?
    @Binding var inputImage: UIImage?
    
    @State private var showingImagePicker = false
    
    var body: some View {
        Group {
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
            } else {
                Text("+ Image")
                    .font(.headline)
                    .foregroundColor(.accentColor)
            }
        }
        .frame(width: showingImageInputForm ? 320 : 0, height: showingImageInputForm ? 180 : 0)
        .background(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray.opacity(0.8),
                                style: StrokeStyle(lineWidth: 1, dash: [image != nil ? 0 : 10])))
        .onTapGesture {
            self.showingImagePicker = true
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage)  {
            ImagePicker(image: self.$inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = self.inputImage else { return }
        guard let compressedImageData = inputImage.jpegData(compressionQuality: 0.25) else { return }
        guard let uiImage = UIImage(data: compressedImageData) else { return }
        self.inputImage = uiImage
        self.image = Image(uiImage: uiImage)
    }
}

struct PangImageInputView_Previews: PreviewProvider {
    @State static var showingImageInputForm: Bool = true
    @State static var image: Image? = nil
    @State static var inputImage: UIImage? = nil
    static var previews: some View {
        PangImageInputView(showingImageInputForm: $showingImageInputForm, image: $image, inputImage: $inputImage)
    }
}
