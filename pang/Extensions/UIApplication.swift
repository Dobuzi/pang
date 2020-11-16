//
//  UIApplication.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
