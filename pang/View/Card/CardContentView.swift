//
//  CardContentView.swift
//  pang
//
//  Created by 김종원 on 2020/11/22.
//

import SwiftUI

struct CardContentView: View {
    let pang: Pang
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let text = pang.text {
                Text(text)
            }
            HStack {
                Spacer()
                if let uiImage = pang.uiImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160 * 1.5, height: 90 * 1.5)
                        .cornerRadius(15)
                }
                Spacer()
            }
        }
    }
}

struct CardContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardContentView(pang: Pang(text: "example", uiImage: UIImage(systemName: "heart")))
    }
}
