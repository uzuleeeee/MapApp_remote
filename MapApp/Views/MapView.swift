//
//  MapView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/14/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var region: MKCoordinateRegion
    let route: [Stop]
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: route) { stop in
            MapMarker(coordinate: CLLocationCoordinate2D(latitude: stop.location.latitude, longitude: stop.location.longitude))
        }
        .ignoresSafeArea()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(region: Stop.sampleStop.region, route: Route.sampleRoute.stops)
    }
}
