//
//  Notification-extension.swift
//  pang
//
//  Created by 김종원 on 2020/11/26.
//

import SwiftUI
import Combine

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}
