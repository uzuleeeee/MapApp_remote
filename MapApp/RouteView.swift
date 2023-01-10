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
        VStack {
            Text("From: \(route.from), to: \(route.to)")
                .bold()
                .padding(.bottom, 0.7)
            ForEach(route.stops) { stop in
                StopView(stop: stop)
            }
        }
    }
}

struct RouteView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            RouteView(route: Route.sampleRoute)
        }
    }
}
