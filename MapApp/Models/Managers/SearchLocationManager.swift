//
//  SearchLocationManager.swift
//  MapApp
//
//  Created by Mac-aroni on 1/15/23.
//

import Foundation
import MapKit

class SearchLocationManager: ObservableObject {
    @Published var searchedStops: [Stop] = []
    
    func searchLocation(search searchEntry: String, in region: MKCoordinateRegion) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchEntry
        searchRequest.region = region

        let search = MKLocalSearch(request: searchRequest)
        
        search.start { response, error in
            guard let response = response else {
                print("Error: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            
            self.searchedStops = response.mapItems.compactMap({ item in
                return Stop(latitude: item.placemark.coordinate.latitude,
                                               longitude: item.placemark.coordinate.longitude,
                                                name: item.placemark.name ?? "No name found")
            })
        }
    }
}
