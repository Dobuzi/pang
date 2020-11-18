//
//  CardView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct CardView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let pang: Pang
    
    var formattedDate: String {
        self.formatDate(pang.currentDate)
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.offWhite
                CardBoxView(pang: pang,
                            formattedDate: formattedDate,
                            backgroundColor: .offWhite)
                .frame(width: geo.size.width * 0.85, height: 80)
                .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                HStack {
                    Spacer()
                    VStack {
                        AuthorImageView()
                            .offset(x: -geo.size.width * 0.05, y: 10.0)
                        Spacer()
                    }
                }
                
            }
        }
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
        CardView(pang: Pang(text: "Example"))
            .frame(height: 120)
    }
}
