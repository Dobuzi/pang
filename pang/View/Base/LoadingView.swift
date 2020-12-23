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
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .offPurple))
            }
            .padding(30)
            .glassCardStyle(shape: RoundedRectangle(cornerRadius: 15))
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(text: "준비 중...")
    }
}
