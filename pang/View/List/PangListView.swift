//
//  PangListView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI

struct PangListView: View {
    @StateObject var pangInstance: PangObject
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                Spacer()
                ForEach(pangInstance.pangs.reversed()) { pang in
                    CardView(pang: pang)
                }
            }
        }
    }
}

struct PangListView_Previews: PreviewProvider {
    static var previews: some View {
        return PangListView(pangInstance: PangObject.example)
            .preferredColorScheme(.dark)
    }
}
