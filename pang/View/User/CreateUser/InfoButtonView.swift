//
//  InfoButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/12/12.
//

import SwiftUI

struct InfoButtonView: View {
    @Binding var showingInfo: Bool
    let labelTitle: String
    let title: String
    let message: String
    var body: some View {
        Button(action: {
            print("show alert")
            showingInfo = true
        }) {
            Label(labelTitle, systemImage: "info.circle")
        }
        .actionSheet(isPresented: $showingInfo, content: {
            ActionSheet(title: Text(title), message: Text(message), buttons: [.cancel()])
        })
    }
}

struct InfoButtonView_Previews: PreviewProvider {
    @State static var showingInfo = false
    static let labelTitle = "Label Title"
    static let title = "title"
    static let message = "message"
    static var previews: some View {
        InfoButtonView(showingInfo: $showingInfo, labelTitle: labelTitle, title: title, message: message)
    }
}
