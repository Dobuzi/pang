//
//  PangListView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI

struct PangListView: View {
    @EnvironmentObject var pangs: Pangs
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(pangs.pangs.reversed()) { pang in
                    CardView(pang: pang)
                        .frame(height: 120)
                }
                Spacer()
            }
        }
    }
}

struct PangListView_Previews: PreviewProvider {
    static var pangs = Pangs()
    static var previews: some View {
        PangListView()
            .environmentObject(pangs)
    }
}
