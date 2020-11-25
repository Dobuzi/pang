//
//  LogoView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        ZStack {
            Image(systemName: "burst")
                .font(.largeTitle)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
