//
//  PangInputView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI
import Combine
import CoreLocation

struct PangInputView: View {
    @Binding var pangs: Pangs
    @Binding var locationManager: CLLocationManager
    
    @State private var pangText: String = ""
    @State private var inputImages: [UIImage] = []
    @State private var keyboardHeight: CGFloat = 0
    
    var body: some View {
        ZStack {
            BackgroundView()
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 20) {
                    HStack {
                        CancelButtonView(withText: false)
                        Spacer()
                        PangButtonView(pangs: $pangs, pangText: $pangText, inputImages: $inputImages, locationManager: $locationManager)
                            .disabled(pangText == "" && inputImages.count == 0)
                    }
                    PangTextFieldView(pangText: $pangText)
                    PangImageInputView(inputImages: $inputImages)
                    Spacer()
                }
                ImageButtonView(inputImages: $inputImages)
            }
            .padding()
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct PangInputView_Previews: PreviewProvider {
    @State static var pangs = Pangs.example
    @State static var location = Location()
    @State static var locationManager = CLLocationManager()
    static var previews: some View {
        PangInputView(pangs: $pangs, locationManager: $locationManager)
            
    }
}
