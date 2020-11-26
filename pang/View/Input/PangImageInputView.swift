//
//  PangImageInputView.swift
//  pang
//
//  Created by 김종원 on 2020/11/19.
//

import SwiftUI

struct PangImageInputView: View {
    @Binding var inputImages: [UIImage]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(inputImages, id: \.self) { uiImage in
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 90 * 2)
                        .cornerRadius(5)
                }
            }
        }
        .frame(height: 90 * 2 + 60)
    }
}

struct PangImageInputView_Previews: PreviewProvider {
    @State static var inputImages: [UIImage] = [
        UIImage(imageLiteralResourceName: "sample-s"),
        UIImage(imageLiteralResourceName: "sample-h"),
        UIImage(imageLiteralResourceName: "sample-v")
    ]
    
    static var previews: some View {
        PangImageInputView(inputImages: $inputImages)
    }
}
