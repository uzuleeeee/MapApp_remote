//
//  MapView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/14/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var routesManager: RoutesManager
    
    var body: some View {
        Map(coordinateRegion: $routesManager.locationManager.region, showsUserLocation: true, annotationItems: routesManager.currentRoute.stops) { stop in
            MapMarker(coordinate: CLLocationCoordinate2D(latitude: stop.location.coordinate.latitude, longitude: stop.location.coordinate.longitude))
        }
        .ignoresSafeArea()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(RoutesManager())
    }
}
