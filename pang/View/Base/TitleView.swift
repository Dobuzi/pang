//
//  TitleView.swift
//  pang
//
//  Created by 김종원 on 2020/12/23.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Text("pang!")
            .font(.custom("Futura", size: 40))
            .bold()
            .opacity(0.7)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            TitleView()
        }
    }
}
