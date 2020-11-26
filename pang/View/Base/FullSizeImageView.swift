//
//  FullSizeImageView.swift
//  pang
//
//  Created by 김종원 on 2020/11/25.
//

import SwiftUI

struct FullSizeImageView: View {
    let uiImage: UIImage
    
    @GestureState private var scale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            BackgroundView()
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .scaleEffect(scale)
                .gesture(
                    MagnificationGesture()
                        .updating($scale) { value, scale, trans in
                            withAnimation {
                                scale = value.magnitude
                            }
                        }
                )
        }
    }
}

struct FullSizeImageView_Previews: PreviewProvider {
    static var previews: some View {
        FullSizeImageView(uiImage: UIImage(imageLiteralResourceName: "sample-h"))
    }
}
