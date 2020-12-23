//
//  BackgroundView.swift
//  pang
//
//  Created by 김종원 on 2020/11/17.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        GlassBackgroundStyle()
            .onTapGesture {
                self.hideKeyboard()
            }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
