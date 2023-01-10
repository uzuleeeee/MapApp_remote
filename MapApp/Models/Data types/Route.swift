//
//  Route.swift
//  MapApp
//
//  Created by Mac-aroni on 1/9/23.
//

import Foundation

struct Route: Identifiable {
    let id: UUID
    var stops: [Stop]
    var from: String
    var to: String
    
    init(id: UUID = UUID(), stops: [Stop], from: String, to: String) {
        self.id = id
        self.stops = stops
        self.from = from
        self.to = to
    }
}

extension Route {
    mutating func addStop (stop: Stop) {
        stops.append(stop)
    }
}

extension Route {
    static let newRoute = Route(stops: [], from: "", to: "")
    
    static let sampleRoute = Route(stops: [
        Stop(location: Location(latitude: 50, longitude: 50), name: "Apple St"),
        Stop(location: Location(latitude: 45, longitude: 45), name: "Banana St")],
                                  from: "Apple", to: "Banana")
    
    static let sampleRoutes = [Route(stops: [
                                    Stop(location: Location(latitude: 50, longitude: 50), name: "Apple St"),
                                    Stop(location: Location(latitude: 45, longitude: 45), name: "Banana St")], from: "Apple", to: "Banana"),
                               Route(stops: [
                                   Stop(location: Location(latitude: -23, longitude: 24), name: "Card Ave"),
                                   Stop(location: Location(latitude: 0, longitude: 5), name: "Donald Dr")], from: "Card", to: "Donald"),
                               Route(stops: [
                                   Stop(location: Location(latitude: 30, longitude: -4), name: "Gorilla St"),
                                   Stop(location: Location(latitude: 17, longitude: 40), name: "James St")], from: "Gorilla", to: "James"),
                               Route(stops: [
                                   Stop(location: Location(latitude: 50, longitude: 50), name: "Apple St"),
                                   Stop(location: Location(latitude: 45, longitude: 45), name: "Banana St")], from: "Apple", to: "Banana"),
                               Route(stops: [
                                   Stop(location: Location(latitude: -23, longitude: 24), name: "Card Ave"),
                                   Stop(location: Location(latitude: 0, longitude: 5), name: "Donald Dr")], from: "Card", to: "Donald"),
                               Route(stops: [
                                   Stop(location: Location(latitude: 30, longitude: -4), name: "Gorilla St"),
                                   Stop(location: Location(latitude: 17, longitude: 40), name: "James St")], from: "Gorilla", to: "James")]
                            }
