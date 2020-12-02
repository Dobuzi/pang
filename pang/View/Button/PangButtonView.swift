//
//  PangButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI

struct PangButtonView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var locationManager: LocationFetcher
    
    @Binding var pangs: Pangs
    @Binding var pangText: String
    @Binding var inputImages: [UIImage]
    
    var body: some View {
        Button(action: self.uploadPang) {
            HStack {
                Label(
                    title: { Text("Pang!") },
                    icon: { Image(systemName: "burst") }
                )
            }
        }
        .buttonStyle(CardButtonStyle(shape: Capsule()))
    }
    
    func uploadPang() {
        var newPang = Pang(text: pangText == "" ? nil : pangText, images: inputImages)
        if let currentLocation = locationManager.lastKnownLocation {
            newPang.location = Location(coordinate: currentLocation)
        }
        withAnimation(.spring()) {
            pangs.add(newPang)
            inputImages = []
            pangText = ""
            UIApplication.shared.endEditing()
        }
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct PangButtonView_Previews: PreviewProvider {
    @State static var pangs = Pangs()
    @State static var pangText: String = ""
    @State static var inputImages: [UIImage] = []
    static var previews: some View {
        PangButtonView(pangs: $pangs, pangText: $pangText, inputImages: $inputImages)
    }
}
