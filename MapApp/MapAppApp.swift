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
    
    var body: some Scene {
        WindowGroup {
            MainView(routesManager: routesManager)
                .onAppear {
                    routesManager.locationManager.checkIfLocationServicesIsEnabled()
                }
        }
    }
}
