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
    var location: Location
    var name: String
    
    init(id: UUID = UUID(), location: Location, name: String) {
        self.id = id
        self.location = location
        self.name = name
    }
}

extension Stop {
    var region: MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
    
    static func ==(lhs: Stop, rhs: Stop) -> Bool {
        lhs.location == rhs.location && lhs.name == rhs.name
    }
}

extension Stop {
    static let newStop = Stop(location: Location(latitude: 0, longitude: 0), name: "New stop")
    
    static let sampleStop = Stop(location: Location(latitude: 33.781500, longitude: -84.396040), name: "10th St & Holly St")
}
