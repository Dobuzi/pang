//
//  CardView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct CardView: View {
    let pang: Pang
    
    var formattedDate: String {
        self.formatDate(pang.currentDate)
    }
    
    var body: some View {
        ZStack {
            CardBoxView(pang: pang,
                        formattedDate: formattedDate)
            HStack {
                Spacer()
                VStack {
                    AuthorImageView()
                    Spacer()
                }
            }
        }
        .padding(.trailing, 15)
        .frame(height: 120)
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        return formatter.string(from: date)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CardView(pang: Pang(text: "Example"))
            CardView(pang: Pang(uiImage: UIImage(systemName: "star")))
        }
    }
}
