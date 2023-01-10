//
//  Stop.swift
//  MapApp
//
//  Created by Mac-aroni on 1/9/23.
//

import Foundation

struct Stop: Identifiable {
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
    static let sampleStop = Stop(location: Location(latitude: 10, longitude: 20), name: "Sample stop")
}
