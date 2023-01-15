//
//  MapView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/14/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var locationManager: LocationManager
    
    var body: some View {
        Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
            .ignoresSafeArea()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(locationManager: LocationManager())
    }
}
