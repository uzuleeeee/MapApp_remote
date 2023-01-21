//
//  TripView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/18/23.
//

import SwiftUI
import MapKit

struct TripView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var routesManager: RoutesManager
    
    var body: some View {
        VStack (spacing: 0) {
            // Simple route view
            SimpleRouteView(route: routesManager.currentRoute, centerToAction: { stop in
                routesManager.locationManager.center(to: stop)
            })
            .padding(.bottom)
            
            // List of stops
            RouteView(routesManager: routesManager, showMapButton: false)
            
            // Map
            Map(coordinateRegion: $routesManager.locationManager.region, showsUserLocation: true, annotationItems: routesManager.currentRoute.stops) { stop in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: stop.location.coordinate.latitude, longitude: stop.location.coordinate.longitude))
            }
            .cornerRadius(25)
            .padding(.vertical)
            
            // Stop button
            Button {
                routesManager.stop()
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("End")
                    .bigButtonStyle(foregroundColor: .white, backgroundColor: .red)
            }
            .padding(.top)
        }
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView(routesManager: RoutesManager())
        
        .padding(.horizontal)
    }
}
