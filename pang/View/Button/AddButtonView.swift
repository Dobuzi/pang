//
//  AddButtonView.swift
//  pang
//
//  Created by 김종원 on 2020/11/23.
//

import SwiftUI
import CoreLocation

struct AddButtonView: View {
    @Binding var pangs: Pangs
    @Binding var showingSheet: Bool
    @Binding var locationManager: CLLocationManager
    
    var body: some View {
        Button(action: {
            self.showingSheet = true
        }) {
            Label("Add", systemImage: "plus.circle")
        }
        .sheet(isPresented: $showingSheet) {
            PangInputView(pangs: $pangs, locationManager: $locationManager)
        }
    }
}

struct AddButtonView_Previews: PreviewProvider {
    @State static var pangs = Pangs.example
    @State static var location = Location()
    @State static var locationManager = CLLocationManager()
    static var previews: some View {
        AddButtonView(pangs: $pangs, showingSheet: .constant(false), locationManager: $locationManager)
    }
}
