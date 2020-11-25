//
//  AuthorImageView.swift
//  pang
//
//  Created by 김종원 on 2020/11/17.
//

import SwiftUI

struct AuthorImageView: View {
    var body: some View {
        Image(systemName: "person")
            .font(.headline)
            .foregroundColor(.offPurple)
            .padding()
            .cardBackgroundStyle(isHighlighted: false, shape: Circle())
    }
}

struct AuthorImageView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorImageView()
    }
}
