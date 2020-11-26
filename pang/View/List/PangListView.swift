//
//  PangListView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI

struct PangListView: View {
    @Binding var pangs: Pangs
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                Spacer()
                ForEach(pangs.zonePangs.reversed()) { pang in
                    CardView(pang: pang)
                }
            }
        }
    }
}

struct PangListView_Previews: PreviewProvider {
    @State static var pangs = Pangs.example
    static var previews: some View {
        PangListView(pangs: $pangs)
            .preferredColorScheme(.dark)
    }
}
