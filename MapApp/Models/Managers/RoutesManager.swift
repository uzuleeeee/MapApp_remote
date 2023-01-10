//
//  RoutesManager.swift
//  MapApp
//
//  Created by Mac-aroni on 1/9/23.
//

import Foundation

class RoutesManager: ObservableObject {
    @Published var tempRoute: Route = Route.newRoute
    @Published var savedRoutes: [Route] = []
    
    init () {
        tempRoute = Route.sampleRoute
        savedRoutes = Route.sampleRoutes
    }
}
