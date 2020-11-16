//
//  PangButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct PangButtonView: View {
    var body: some View {
        Image(systemName: "burst")
            .font(.title)
            .foregroundColor(.white)
            .padding(10)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                                        Color.purple,
                                        Color.purple.opacity(0.7),
                                        Color.white
                    ]),
                    startPoint: .topLeading, endPoint: .bottomTrailing)
                )
            .clipShape(Circle())
            .shadow(radius: 5)
    }
}

struct PangButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PangButtonView()
    }
}
