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
        HStack {
            VStack(alignment: .leading) {
                if let text = pang.text {
                    Text(text)
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(pang.images, id: \.self) { uiImage in
                            NavigationLink(destination: FullSizeImageView(uiImage: uiImage)) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 90)
                                    .cornerRadius(5)
                                    .cardBackgroundStyle(isHighlighted: false, shape: RoundedRectangle(cornerRadius: 5))
                            }
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

struct CardContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CardContentView(pang: PangObject.example.pangs[4])
        }
    }
}
