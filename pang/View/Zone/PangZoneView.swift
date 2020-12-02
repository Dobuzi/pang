//
//  PangZoneView.swift
//  pang
//
//  Created by 김종원 on 2020/11/30.
//

import SwiftUI
import MapKit

struct PangZoneView: View {
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    @EnvironmentObject var locationManager: LocationFetcher
    
    var body: some View {
        ZStack {
            MapView(userTrackingMode: $userTrackingMode, region: $region)
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    CancelButtonView(withText: false)
                }
                Spacer()
                HStack {
                    Spacer()
                    SystemImageButtonView(systemImage: "location.fill", content: getLocation)
                        .foregroundColor(.blue)
                }
                .padding(.bottom, 50)
            }
            .padding()
        }
        .onAppear {
            getLocation()
        }
    }
    
    func getLocation() {
        guard let currentLocation = locationManager.lastKnownLocation else {
            print("no current location.")
            return
        }
        region.center = currentLocation
        region.span = .init(latitudeDelta: 0.05, longitudeDelta: 0.05)
    }
}

struct PangZoneView_Previews: PreviewProvider {
    static var previews: some View {
        PangZoneView()
    }
}
