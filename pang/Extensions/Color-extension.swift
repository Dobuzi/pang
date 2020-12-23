//
//  Color-extension.swift
//  pang
//
//  Created by 김종원 on 2020/11/17.
//

import SwiftUI

extension Color {
    static let offPurple = Color(.sRGB, red: 108 / 255, green: 92 / 255, blue: 231 / 255, opacity: 1)
    
    static let offWhite = Color(.sRGB, red: 245 / 255, green: 245 / 255, blue: 255 / 255)
    static let offBlack = Color(.sRGB, red: 20 / 255, green: 20 / 255, blue: 30 / 255)
    
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    
    static let lightStart = Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
    static let lightEnd = Color(red: 30 / 255, green: 80 / 255, blue: 120 / 255)
    
    static func random() -> Color {
        Color(.sRGB, red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1), opacity: 1)
    }
    
    init(rgb: Int) {
        self.init(red: Double((rgb & 0xFF0000) >> 16) / 255,
                  green: Double((rgb & 0x00FF00) >> 8) / 255,
                  blue: Double(rgb & 0x0000FF) / 255
        )
    }
}
