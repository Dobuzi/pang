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
        HStack(alignment: .top) {
            CardContentView(pang: pang)
            VStack(alignment: .trailing) {
                AuthorImageView()
                Spacer()
                Text(formattedDate)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .cardBackgroundStyle(isHighlighted: false, shape: RoundedRectangle(cornerRadius: 15))
        .frame(height: (pang.images.count > 0 && pang.text != nil) ? 160 : 120)
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            LazyVStack {
                ForEach(PangObject.example.pangs) { pang in
                    CardView(pang: pang)
                }
            }
        }
    }
}
