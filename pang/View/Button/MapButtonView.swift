//
//  MapButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/11/30.
//

import SwiftUI
import MapKit

struct MapButtonView: View {
    @Binding var showingSheet: Bool
    
    var body: some View {
        Button(action: {
            self.showingSheet = true
        }) {
            Label("Zone", systemImage: "mappin.and.ellipse")
        }
        .foregroundColor(.offPurple)
        .sheet(isPresented: $showingSheet) {
            PangZoneView()
        }
    }
}

struct MapButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MapButtonView(showingSheet: .constant(false))
    }
}
