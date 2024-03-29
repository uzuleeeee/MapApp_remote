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
    static let newRoute = Route(stops: [], from: "", to: "")
    
    static let sampleRoute = Route(stops: [
        Stop(latitude: 33.781720, longitude: -84.396410, name: "Graduate Living Center"),
        Stop(latitude: 33.777039, longitude: -84.395378, name: "Klaus Advanced Computing Building"),
        Stop(latitude: 33.775700, longitude: -84.404243, name: "Georgia Tech Campus Recreation Center"),
        Stop(latitude: 33.781500, longitude: -84.396040, name: "10th St & Holly St"),
        Stop.newStop],
                                  from: "Apple", to: "Banana")
    
    static let sampleRoutes = [Route(stops: [
                                    Stop(latitude: 33.781720, longitude: -84.396410, name: "Graduate Living Center"),
                                    Stop(latitude: 33.777039, longitude: -84.395378, name: "Klaus Advanced Computing Building")], from: "Apple", to: "Banana"),
                               Route(stops: [
                                   Stop(latitude: -23, longitude: 24, name: "Card Ave"),
                                   Stop(latitude: 0, longitude: 5, name: "Donald Dr")], from: "Card", to: "Donald"),
                               Route(stops: [
                                   Stop(latitude: 30, longitude: -4, name: "Gorilla St"),
                                   Stop(latitude: 17, longitude: 40, name: "James St")], from: "Gorilla", to: "James"),
                               Route(stops: [
                                   Stop(latitude: 50, longitude: 50, name: "Apple St"),
                                   Stop(latitude: 45, longitude: 45, name: "Banana St")], from: "Apple", to: "Banana"),
                               Route(stops: [
                                   Stop(latitude: -23, longitude: 24, name: "Card Ave"),
                                   Stop(latitude: 0, longitude: 5, name: "Donald Dr")], from: "Card", to: "Donald"),
                               Route(stops: [
                                   Stop(latitude: 30, longitude: -4, name: "Gorilla St"),
                                   Stop(latitude: 17, longitude: 40, name: "James St")], from: "Gorilla", to: "James")]
                            }
