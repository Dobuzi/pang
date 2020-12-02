//
//  Pang.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI
import Foundation
import MapKit

struct Pang: Identifiable, Codable {
    var id = UUID()
    var text: String?
    var images: [UIImage]
    var currentDate = Date()
    var expirationDate: Date {
        currentDate.addingTimeInterval(10)
    }
    var location: Location?
    
    enum CodingKeys: CodingKey {
        case text, images, location
    }
    
    init(text: String? = nil, images: [UIImage] = [], location: Location? = nil) {
        self.text = text
        self.images = images
        self.location = location
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let text = try container.decode(String.self, forKey: CodingKeys.text)
        self.text = text
        
        let data = try container.decode([Data].self, forKey: CodingKeys.images)
        self.images = data.compactMap { UIImage(data: $0) }
        
        let location = try container.decode(Location.self, forKey: CodingKeys.location)
        self.location = location
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
//        text encoding
        if let text = self.text {
            do {
                try container.encode(text, forKey: .text)
                print("\(text) encoded.")
            } catch {
                print("text encoding is failed.")
            }
            
        }
        
//        image encoding
        var encodedImages: [Data] = []
        for image in images {
            if let encodedImage = image.jpegData(compressionQuality: 0.2) {
                encodedImages.append(encodedImage)
            }
        }
        
        do {
            try container.encode(encodedImages, forKey: .images)
            print("image encoded.")
        } catch {
            print("image encoding is failed.")
        }
        
//        location encoding
        if let location = self.location {
            do {
                try container.encode(location, forKey: .location)
                print("location is encoded.")
            } catch {
                print("location encoding  is failed.")
            }
        }
    }
}
