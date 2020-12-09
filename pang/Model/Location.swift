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
    var placemark: String = "???"
    
    private let geocoder = CLGeocoder()
    
    enum CodingKeys: CodingKey {
        case coordinate
    }
    
    init(coordinate: CLLocationCoordinate2D? = nil) {
        guard let coordinate = coordinate else {
            let manager = CLLocationManager()
            self.coordinate = manager.location?.coordinate ?? Self.SeoulCoordinate
            return
        }
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
    
    static var SeoulCoordinate: CLLocationCoordinate2D = .init(latitude: 37.5665, longitude: 126.9780)
}
