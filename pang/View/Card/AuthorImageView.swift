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
            .font(.title2)
            .padding(10)
            .background(Color.offWhite)
            .clipShape(Circle())
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
    }
}

struct AuthorImageView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorImageView()
    }
}
