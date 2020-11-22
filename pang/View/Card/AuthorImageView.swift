//
//  AuthorImageView.swift
//  pang
//
//  Created by 김종원 on 2020/11/17.
//

import SwiftUI

struct AuthorImageView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Image(systemName: "person")
            .font(.headline)
            .neumorphismBackgroundStyle(inLightMode: colorScheme == .light, shape: Circle())
    }
}

struct AuthorImageView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorImageView()
    }
}
