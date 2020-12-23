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
    @Binding var locationManager: CLLocationManager
    
    var body: some View {
        Button(action: {
            self.showingSheet = true
        }) {
            Label("Zone", systemImage: "mappin.and.ellipse")
        }
        .sheet(isPresented: $showingSheet) {
            PangZoneView(locationManager: $locationManager)
        }
    }
}

struct MapButtonView_Previews: PreviewProvider {
    @State static var locationManager = CLLocationManager()
    static var previews: some View {
        MapButtonView(showingSheet: .constant(false), locationManager: $locationManager)
    }
}
