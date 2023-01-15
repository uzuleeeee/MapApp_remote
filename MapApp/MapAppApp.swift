//
//  MapAppApp.swift
//  MapApp
//
//  Created by Mac-aroni on 12/30/22.
//

import SwiftUI

@main
struct MapAppApp: App {
    @StateObject private var routesManager = RoutesManager()
    @StateObject private var locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            MainView(routesManager: routesManager, locationManager: locationManager)
                .onAppear {
                    locationManager.checkIfLocationServicesIsEnabled()
                }
        }
    }
}
