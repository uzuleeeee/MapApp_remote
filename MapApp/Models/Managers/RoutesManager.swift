//
//  RoutesManager.swift
//  MapApp
//
//  Created by Mac-aroni on 1/9/23.
//

import Foundation

class RoutesManager: ObservableObject {
    @Published var onRoute: Bool = false
    
    @Published var currentRoute: Route = Route.sampleRoute
    @Published var tempRoute: Route = Route.newRoute
    @Published var savedRoutes: [Route] = []
    
    init () {
        tempRoute = Route.sampleRoute
        savedRoutes = Route.sampleRoutes
    }
    
    func start () {
        onRoute = true
    }
    
    func stop () {
        onRoute = false
    }
    
    func saveRoute (route: Route) {
        savedRoutes.append(route)
    }
    
    func addStop (stop: Stop) {
        currentRoute.stops.append(stop)
    }
}
