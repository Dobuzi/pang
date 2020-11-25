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
            Text("pang")
            Text("!")
                .bold()
                .font(.largeTitle)
        }
        .font(.system(.title, design: .rounded))
    }
}

struct BrandNameView_Previews: PreviewProvider {
    static var previews: some View {
        BrandNameView()
    }
}
