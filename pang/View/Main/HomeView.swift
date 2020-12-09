//
//  HomeView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @State private var locationManager = CLLocationManager()
    @Binding var pangs: Pangs
    @State private var showingAddSheet: Bool = false
    @State private var showingZoneSheet: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                PangListView(pangs: $pangs)
            }
            .navigationBarTitle("pang!")
            .navigationBarItems(
                leading: MapButtonView(showingSheet: $showingZoneSheet, locationManager: $locationManager),
                trailing: AddButtonView(pangs: $pangs, showingSheet: $showingAddSheet, locationManager: $locationManager))
        }
        .onAppear {
            self.initLocationSetting()
        }
    }
    
    func initLocationSetting() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

struct HomeView_Previews: PreviewProvider {
    @State static var pangs = Pangs.example
    static var previews: some View {
        HomeView(pangs: $pangs)
            .preferredColorScheme(.dark)
    }
}
