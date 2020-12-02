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
    var formattedLocation: String {
        self.formatLocation(pang.location) ?? ""
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
                        Text(formattedLocation)
                            .font(.caption2)
                            .foregroundColor(.secondary)
                        Text(formattedDate)
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
                .cardBackgroundStyle(isHighlighted: false, shape: RoundedRectangle(cornerRadius: 15))
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
    
    func formatLocation(_ location: Location?) -> String? {
        guard let location = location else { return nil }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        return "위치: \(latitude), \(longitude)"
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            LazyVStack {
                ForEach(Pangs.example.zonePangs) { pang in
                    CardView(pang: pang)
                }
            }
        }
    }
}
