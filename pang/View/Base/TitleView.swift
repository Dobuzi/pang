//
//  TitleView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Label(title: { BrandNameView() }) {
            LogoView()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
