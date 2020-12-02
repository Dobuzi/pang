//
//  Location.swift
//  pang
//
//  Created by 김종원 on 2020/11/30.
//

import Foundation
import CoreLocation

struct Location: Identifiable, Codable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
    
    enum CodingKeys: CodingKey {
        case coordinate
    }
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let coordinate = try container.decode(CLLocationCoordinate2D.self, forKey: .coordinate)
        self.coordinate = coordinate
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(coordinate, forKey: .coordinate)
    }
}

class LocationFetcher: NSObject, CLLocationManagerDelegate, ObservableObject {
    let manager = CLLocationManager()
    @Published var lastKnownLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func start() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        objectWillChange.send()
        lastKnownLocation = locations.first?.coordinate
    }
}
