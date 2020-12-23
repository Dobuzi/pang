//
//  ex.swift
//  pang
//
//  Created by 김종원 on 2020/12/17.
//

import SwiftUI

struct ex: View {
    var body: some View {
        ZStack {
            GlassBackgroundStyle()
            Text("my word")
                .padding()
                .frame(width: 200, height: 100)
                .glassCardStyle(shape: RoundedRectangle(cornerRadius: 15))
        }
    }
}

struct ex_Previews: PreviewProvider {
    static var previews: some View {
        ex()
            .preferredColorScheme(.dark)
    }
}
