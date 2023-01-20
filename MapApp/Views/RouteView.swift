//
//  RouteView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/9/23.
//

import SwiftUI

struct RouteView: View {
    @ObservedObject var routesManager: RoutesManager
    
    @State var showMapButton: Bool = true
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(routesManager.currentRoute.stops) { stop in
                let index = routesManager.currentRoute.stops.firstIndex(of: stop) ?? -1
                
                HStack {
                    Image(systemName: "\(index+1).circle.fill")
                        .font(.largeTitle)
                    StopView(stop: stop, distance: routesManager.locationManager.distanceFrom(from: stop), showMapButton: showMapButton)
                }
            }
        }
        .if(routesManager.currentRoute.stops.count > 2) { view in
            ScrollView {
                view
            }
            .scrollIndicators(.hidden)
        }
    }
}

struct RouteView_Previews: PreviewProvider {
    static var previews: some View {
        RouteView(routesManager: RoutesManager())
    }
}
