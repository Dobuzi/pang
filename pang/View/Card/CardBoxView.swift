//
//  CardBoxView.swift
//  pang
//
//  Created by 김종원 on 2020/11/17.
//

import SwiftUI

struct CardBoxView: View {
    let pang: Pang
    let formattedDate: String
    let backgroundColor: Color
    var body: some View {
        HStack {
            VStack {
                Text(pang.text)
                Spacer()
            }
            Spacer()
            VStack {
                Spacer()
                Text(formattedDate)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }

        }
        
        .padding()
        .background(backgroundColor)
        .cornerRadius(15)
        .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
    }
}

struct CardBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CardBoxView(pang: Pang(text: "Example"), formattedDate: "today", backgroundColor: Color.offWhite)
    }
}
