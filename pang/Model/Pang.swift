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
    var uiImage: UIImage?
    var currentDate = Date()
    var expirationDate: Date {
        currentDate + 10
    }
    
    enum CodingKeys: CodingKey {
        case text, image
    }
    
    init(text: String? = nil, uiImage: UIImage? = nil) {
        if let text = text {
            self.text = text
        }
        if let uiImage = uiImage {
            self.uiImage = uiImage
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let text = try container.decode(String.self, forKey: CodingKeys.text)
        self.text = text
        
        let data = try container.decode(Data.self, forKey: CodingKeys.image)
        
        if let uiImage = UIImage(data: data) {
            self.uiImage = uiImage
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if let text = self.text {
            try container.encode(text, forKey: .text)
            print("text encoded")
        }
        
        if let uiImage = self.uiImage {
            let encodedImage = uiImage.jpegData(compressionQuality: 1)
            try container.encode(encodedImage, forKey: .image)
            print("image encoded")
        }
    }
}
