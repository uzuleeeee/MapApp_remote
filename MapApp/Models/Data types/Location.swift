//
//  Location.swift
//  MapApp
//
//  Created by Mac-aroni on 1/9/23.
//

import Foundation
import MapKit

struct Location: Equatable, Identifiable {
    let id: UUID
    var latitude: Double
    var longitude: Double
    
    var cllocation: CLLocation {
        CLLocation(latitude: latitude, longitude: longitude)
    }
    
    init(id: UUID = UUID(), latitude: Double, longitude: Double) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension Location {
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
