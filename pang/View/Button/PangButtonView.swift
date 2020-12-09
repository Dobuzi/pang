//
//  PangButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI
import CoreLocation

struct PangButtonView: View {
    @Environment(\.presentationMode) var presentationMode

    @Binding var pangs: Pangs
    @Binding var pangText: String
    @Binding var inputImages: [UIImage]
    @Binding var locationManager: CLLocationManager
    
    var body: some View {
        Button(action: self.uploadPang) {
            HStack {
                Label(
                    title: { Text("pang!") },
                    icon: { Image(systemName: "burst") }
                )
            }
        }
        .buttonStyle(CardButtonStyle(shape: Capsule()))
    }
    
    func uploadPang() {
        var newPang = Pang(text: pangText == "" ? nil : pangText, images: inputImages)
        if let currentLocation = locationManager.location {
            newPang.location = Location(coordinate: currentLocation.coordinate)
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
    @State static var locationManager = CLLocationManager()
    static var previews: some View {
        PangButtonView(pangs: $pangs, pangText: $pangText, inputImages: $inputImages, locationManager: $locationManager)
    }
}
