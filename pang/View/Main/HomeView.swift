//
//  HomeView.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @StateObject var locationManager = LocationFetcher()
    
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
                leading: MapButtonView(showingSheet: $showingZoneSheet),
                trailing: AddButtonView(pangs: $pangs, showingSheet: $showingAddSheet))
        }
        .environmentObject(locationManager)
        .onAppear {
            locationManager.start()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    @State static var pangs = Pangs.example
    static var previews: some View {
        HomeView(pangs: $pangs)
            .preferredColorScheme(.dark)
    }
}
