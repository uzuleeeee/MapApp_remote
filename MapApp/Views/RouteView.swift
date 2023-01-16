//
//  RouteView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/9/23.
//

import SwiftUI

struct RouteView: View {
    let route: Route
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(route.stops) { stop in
                let index = route.stops.firstIndex(of: stop) ?? -1
                
                HStack {
                    Image(systemName: "\(index+1).circle.fill")
                        .font(.largeTitle)
                    StopView(stop: stop)
                }
            }
        }
    }
}

struct RouteView_Previews: PreviewProvider {
    static var previews: some View {
        RouteView(route: Route.sampleRoute)
    }
}
