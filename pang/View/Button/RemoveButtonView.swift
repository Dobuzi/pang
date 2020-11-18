//
//  RemoveButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/11/18.
//

import SwiftUI

struct RemoveButtonView: View {
    @EnvironmentObject var pangs: Pangs
    var body: some View {
        Button(action: {
            withAnimation {
                pangs.removeAll()
            }
        }, label: {
            Image(systemName: "trash.circle")
                .font(.largeTitle)
        })
        .buttonStyle(NeumorphismWhiteButtonStyle(shape: Circle()))
    }
}

struct RemoveButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveButtonView()
    }
}
