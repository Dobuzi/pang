//
//  Pang.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI
import Foundation

struct Pang: Identifiable, Codable {
    var id = UUID()
    var text: String?
    var images: [UIImage]
    var currentDate = Date()
    var expirationDate: Date {
        currentDate + 10
    }
    
    enum CodingKeys: CodingKey {
        case text, images
    }
    
    init(text: String? = nil, images: [UIImage] = []) {
        if let text = text {
            self.text = text
        }
        self.images = images
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let text = try container.decode(String.self, forKey: CodingKeys.text)
        self.text = text
        
        let data = try container.decode([Data].self, forKey: CodingKeys.images)
        
        self.images = data.compactMap { UIImage(data: $0) }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if let text = self.text {
            try container.encode(text, forKey: .text)
            print("\(text) encoded")
        }
        
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
        
    }
}
