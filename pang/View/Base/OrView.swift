//
//  OrView.swift
//  pang
//
//  Created by 김종원 on 2020/12/21.
//

import SwiftUI

struct OrView: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
            Text("OR")
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
        }
    }
}

struct OrView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            OrView()
        }
    }
}
