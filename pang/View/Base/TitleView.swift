//
//  TitleView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI

struct TitleView: View {
    @State private var isTapped = false
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                isTapped.toggle()
            }
        }, label: {
            Label(title: { BrandNameView() }, icon: { LogoView() })
        })
        .buttonStyle(NeumorphismWhiteButtonStyle(shape: RoundedRectangle(cornerRadius: 15)))
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
