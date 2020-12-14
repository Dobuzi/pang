//
//  LoadingView.swift
//  pang
//
//  Created by 김종원 on 2020/12/14.
//

import SwiftUI

struct LoadingView: View {
    let text: String
    var body: some View {
        ZStack {
            BackgroundView()
                .opacity(0.9)
            VStack {
                Text(text)
                    .font(.headline)
                    .foregroundColor(.secondary)
                ProgressView()
            }
            .padding(30)
            .cardBackgroundStyle(isHighlighted: false, shape: RoundedRectangle(cornerRadius: 15))
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(text: "Loading...")
    }
}
