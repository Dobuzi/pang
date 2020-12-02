//
//  MapKit-extension.swift
//  pang
//
//  Created by 김종원 on 2020/11/27.
//

import Foundation
import MapKit

extension CLLocationCoordinate2D: Codable {
    enum CodingKeys: CodingKey {
        case latitude, longitude
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
        let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
        
        self.init()
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
    }
}
