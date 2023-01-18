//
//  TripView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/18/23.
//

import SwiftUI
import MapKit

struct TripView: View {
    @ObservedObject var routesManager: RoutesManager
    @ObservedObject var locationManager: LocationManager
    
    var body: some View {
        VStack (spacing: 0) {
            SimpleRouteView(route: routesManager.currentRoute, zoom: { stop in
                locationManager.region.center = CLLocationCoordinate2D(latitude: stop.location.latitude, longitude: stop.location.longitude)
            })
            .padding(.bottom)
            
            ScrollView {
                RouteView(route: routesManager.currentRoute, showMapButton: false)
            }
            .scrollIndicators(.hidden)
            .frame(height: 200)
            
            Spacer()
            
            Map(coordinateRegion: $locationManager.region, showsUserLocation: true, annotationItems: routesManager.currentRoute.stops) { stop in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: stop.location.latitude, longitude: stop.location.longitude))
            }
            .cornerRadius(25)
            .padding(.vertical)
            
            Button {
                routesManager.stop()
            } label: {
                Text("End")
                    .font(.system(size: 30, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(.red)
                    .cornerRadius(25)
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal)
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView(routesManager: RoutesManager(), locationManager: LocationManager())
    }
}
