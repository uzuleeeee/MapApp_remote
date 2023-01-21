//
//  Stop.swift
//  MapApp
//
//  Created by Mac-aroni on 1/9/23.
//

import Foundation
import MapKit

struct Stop: Identifiable, Equatable {
    let id: UUID
    var location: CLLocation
    var name: String
    
    init(id: UUID = UUID(), latitude: Double, longitude: Double, name: String) {
        self.id = id
        self.location = CLLocation(latitude: latitude, longitude: longitude)
        self.name = name
    }
}

extension Stop {
    static func ==(lhs: Stop, rhs: Stop) -> Bool {
        lhs.location == rhs.location && lhs.name == rhs.name
    }
}

extension Stop {
    static let newStop = Stop(latitude: 0, longitude: 0, name: "New stop")
    
    static let sampleStop = Stop(latitude: 33.781500, longitude: -84.396040, name: "10th St & Holly St")
}
