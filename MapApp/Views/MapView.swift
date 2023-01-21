//
//  MapView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/14/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    var stop: Stop
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: [stop]) { stop in
            MapMarker(coordinate: CLLocationCoordinate2D(latitude: stop.location.coordinate.latitude, longitude: stop.location.coordinate.longitude))
        }
        .ignoresSafeArea()
        .onAppear {
            region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: stop.location.coordinate.latitude, longitude: stop.location.coordinate.latitude), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(stop: Stop.sampleStop)
    }
}
