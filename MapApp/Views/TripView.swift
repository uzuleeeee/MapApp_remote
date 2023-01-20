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
            SimpleRouteView(route: routesManager.currentRoute, zoom: { stop in
                routesManager.locationManager.region.center = CLLocationCoordinate2D(latitude: stop.location.latitude, longitude: stop.location.longitude)
            })
            .padding(.bottom)
            
            if (routesManager.currentRoute.stops.count < 3) {
                RouteView(routesManager: routesManager, showMapButton: false)
            } else {
                ScrollView {
                    RouteView(routesManager: routesManager, showMapButton: false)
                }
                .scrollIndicators(.hidden)
            }
            
            Map(coordinateRegion: $routesManager.locationManager.region, showsUserLocation: true, annotationItems: routesManager.currentRoute.stops) { stop in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: stop.location.latitude, longitude: stop.location.longitude))
            }
            .cornerRadius(25)
            .padding(.vertical)
            
            Button {
                routesManager.stop()
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("End")
                    .font(.system(size: 30, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(.red)
                    .cornerRadius(25)
                    .foregroundColor(.white)
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView(routesManager: RoutesManager())
    }
}
