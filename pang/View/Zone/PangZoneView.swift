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
    @State private var region = MKCoordinateRegion(
        center: .init(latitude: 37.5665, longitude: 126.9780),
        span: .init(latitudeDelta: 0.02, longitudeDelta: 0.02))
    @Binding var locationManager: CLLocationManager
    private var placemark: String {
        var placemark: CLPlacemark? = nil
        let geocoder = CLGeocoder()
        guard let location = locationManager.location else { return "???" }
        geocoder.reverseGeocodeLocation(location) { (places, error) in
            guard error == nil else { return }
            guard let places = places else { return }
            placemark = places[0]
        }
        guard placemark != nil else { return "???" }
        return String(describing: placemark)
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                MapView(userTrackingMode: $userTrackingMode, region: $region, locationManager: $locationManager)
                    .cardBackgroundStyle(isHighlighted: false, shape: Rectangle())
                HStack {
                    CancelButtonView(withText: false)
                    Spacer()
                    Text(placemark)
                    Spacer()
                    SystemImageButtonView(systemImage: "location.fill", content: getLocation)
                        .foregroundColor(.blue)
                }
                .frame(height: 80)
                .padding()
            }
        }
        .onAppear {
            getLocation()
        }
    }
    
    func getLocation() {
        guard let currentLocation = locationManager.location else {
            print("no current location.")
            return
        }
        region.center = currentLocation.coordinate
    }
}

struct PangZoneView_Previews: PreviewProvider {
    @State static var locationManager = CLLocationManager()
    static var previews: some View {
        PangZoneView(locationManager: $locationManager)
    }
}
