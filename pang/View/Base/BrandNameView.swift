//
//  BrandNameView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI

struct BrandNameView: View {
    @Binding var titleColor: Color
    var body: some View {
        HStack(spacing: 0) {
            Text("p")
            Text("a")
                .bold()
            Text("ng")
            Text("!")
                .bold()
                .font(.largeTitle)
        }
        .font(.system(.title, design: .rounded))
        .foregroundColor(titleColor)
        
    }
}

struct BrandNameView_Previews: PreviewProvider {
    static var previews: some View {
        BrandNameView(titleColor: .constant(Color(
            .sRGB,
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1),
            opacity: 1
        )))
    }
}
