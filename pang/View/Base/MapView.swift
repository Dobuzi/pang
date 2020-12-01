//
//  MapView.swift
//  pang
//
//  Created by 김종원 on 2020/11/27.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Binding var userTrackingMode: MapUserTrackingMode
    @Binding var region: MKCoordinateRegion
    private var locations: [Location] {
        guard let currentLocation = locationManager.lastKnownLocation else { return [] }
        return [Location(coordinate: currentLocation)]
    }
    
    @EnvironmentObject var locationManager: LocationFetcher
    
    private var diameter: CGFloat {
        20 / CGFloat(region.span.latitudeDelta)
    }
    
    var body: some View {
        Map(coordinateRegion: $region,
            interactionModes: .all,
            showsUserLocation: true,
            userTrackingMode: $userTrackingMode,
            annotationItems: locations) { location in
            MapAnnotation(coordinate: location.coordinate) {
                Circle()
                    .fill(Color.offPurple.opacity(0.2))
                    .frame(width: diameter, height: diameter)
                    .overlay(Circle().stroke(Color.offPurple.opacity(0.7), lineWidth: 2))
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct MapView_Previews: PreviewProvider {
    @State static var userTrackingMode: MapUserTrackingMode = .follow
    @State static var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    static var previews: some View {
        MapView(userTrackingMode: $userTrackingMode, region: $region)
    }
}
