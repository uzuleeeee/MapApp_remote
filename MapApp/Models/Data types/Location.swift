//
//  Location.swift
//  MapApp
//
//  Created by Mac-aroni on 1/9/23.
//

import Foundation

struct Location: Equatable {
    var latitude: Double
    var longitude: Double
}

extension Location {
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
