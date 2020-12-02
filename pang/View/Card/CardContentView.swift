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
                        .font(.subheadline)
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(pang.images, id: \.self) { uiImage in
                            NavigationLink(destination: FullSizeImageView(uiImage: uiImage)) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(5)
                            }
                            .frame(height: 100)
                        }
                    }
                }
            }
        }
    }
}

struct CardContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CardContentView(pang: Pangs.example.zonePangs[4])
        }
    }
}
