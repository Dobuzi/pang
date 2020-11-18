//
//  BrandNameView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI

struct BrandNameView: View {
    var body: some View {
        HStack(spacing: 0) {
            Text("p")
                .fontWeight(.bold)
                .font(.title)
            Text("a")
                .foregroundColor(.purple)
                .font(.title)
                .fontWeight(.bold)
            Text("ng")
                .fontWeight(.bold)
                .font(.title)
            Text("!")
                .foregroundColor(.purple)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}

struct BrandNameView_Previews: PreviewProvider {
    static var previews: some View {
        BrandNameView()
    }
}
