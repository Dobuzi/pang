//
//  CardBoxView.swift
//  pang
//
//  Created by 김종원 on 2020/11/17.
//

import SwiftUI

struct CardBoxView: View {
    @Environment(\.colorScheme) var colorScheme
    let pang: Pang
    let formattedDate: String
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            CardContentView(pang: pang)
            Text(formattedDate)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .neumorphismBackgroundStyle(inLightMode: colorScheme == .light, shape: RoundedRectangle(cornerRadius: 15))
        .padding()
    }
}

struct CardBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CardBoxView(pang: Pang(text: "example", uiImage: UIImage(systemName: "heart.fill")), formattedDate: "today")
            
            
    }
}
