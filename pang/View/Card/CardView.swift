//
//  CardView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI
import MapKit

struct CardView: View {
    let pang: Pang
    var formattedDate: String {
        self.formatDate(pang.currentDate)
    }
    
    @State var showingCard: Bool = true
    
    var body: some View {
        Group {
            if showingCard {
                HStack(alignment: .top) {
                    CardContentView(pang: pang)
                    VStack(alignment: .trailing) {
                        AuthorImageView()
                        Spacer()
                        Text(pang.location?.placemark ?? "???")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                        Text(formattedDate)
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
//                .cardBackgroundStyle(isHighlighted: false, shape: RoundedRectangle(cornerRadius: 15))
                .glassCardStyle(shape: RoundedRectangle(cornerRadius: 15))
                .frame(height: (pang.images.count > 0 && pang.text != nil) ? 160 : 140)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
            } else {
                EmptyView()
            }
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
                withAnimation(.easeInOut(duration: 1)) {
                    self.showingCard = false
                }
            }
        })
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
        ZStack {
            BackgroundView()
            ScrollView {
                LazyVStack {
                    ForEach(Pangs.example.zonePangs) { pang in
                        CardView(pang: pang)
                    }
                }
            }
        }
        
    }
}
