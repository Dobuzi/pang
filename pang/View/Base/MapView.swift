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
    @Binding var locationManager: CLLocationManager
    private var location: Location {
        guard let currentLocation = locationManager.location else { return Location(coordinate: Location.SeoulCoordinate) }
        return Location(coordinate: currentLocation.coordinate)
    }
    private let diameter: CGFloat = 200
    
    var body: some View {
        Map(coordinateRegion: $region,
            interactionModes: .pan,
            showsUserLocation: true,
            userTrackingMode: $userTrackingMode,
            annotationItems: [location]) { location in
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
    @State static var region = MKCoordinateRegion(center: Location.SeoulCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @State static var locationManager = CLLocationManager()

    static var previews: some View {
        MapView(userTrackingMode: $userTrackingMode, region: $region, locationManager: $locationManager)
    }
}
