//
//  Publishers-extension.swift
//  pang
//
//  Created by 김종원 on 2020/11/26.
//

import SwiftUI
import Combine

extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        return Publishers.MergeMany(willShow, willHide).eraseToAnyPublisher()
    }
}
