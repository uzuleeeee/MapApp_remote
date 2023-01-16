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
    @EnvironmentObject var routesManager: RoutesManager
    
    @State var disabled: Bool = false
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: Route.sampleRoute.stops) { stop in
            MapMarker(coordinate: CLLocationCoordinate2D(latitude: stop.location.latitude, longitude: stop.location.longitude))
        }
        .ignoresSafeArea()
        .disabled(disabled)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(region: Stop.sampleStop.region)
    }
}
