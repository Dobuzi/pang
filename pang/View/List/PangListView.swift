//
//  PangListView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI

struct PangListView: View {
    @StateObject var pangInstance: PangObject
    private let itemHeight: CGFloat = 120
    private let scaleModifier: CGFloat = 3000
    private let degreeModifier: Double = 20
    var body: some View {
        GeometryReader { superGeo in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 150) {
                    ForEach(pangInstance.pangs.reversed()) { pang in
                        GeometryReader { geo in
                            CardView(pang: pang)
                                .scaleEffect(1 - CGFloat(geo.frame(in: .global).minY - superGeo.frame(in: .global).minY) / scaleModifier)
                                .rotation3DEffect(
                                    .degrees(
                                        -Double(
                                            geo.frame(in: .global).minY - superGeo.frame(in: .global).minY
                                        ) / degreeModifier
                                    ),
                                    axis: (x: 1.0, y: 0.0, z: 0.0))
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct PangListView_Previews: PreviewProvider {
    static var previews: some View {
        PangListView(pangInstance: PangObject())
    }
}
