//
//  RoutesManager.swift
//  MapApp
//
//  Created by Mac-aroni on 1/9/23.
//

import Foundation

class RoutesManager: ObservableObject {
    @Published var onRoute: Bool = false
    
    @Published var currentRoute: Route = Route.newRoute

    var locationManager = LocationManager()
    
    func start () {
        onRoute = true
    }
    
    func stop () {
        onRoute = false
    }
    
    func addStop (stop: Stop) {
        currentRoute.stops.append(stop)
    }
}
