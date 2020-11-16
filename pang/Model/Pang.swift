//
//  Pang.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import Foundation

struct Pang: Identifiable, Codable {
    var id = UUID()
    var text: String
    var currentDate = Date()
    var expirationDate: Date {
        currentDate + 10
    }
}
