//
//  RouteEditView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/9/23.
//

import SwiftUI

struct RouteEditView: View {
    @Binding var route: Route
    @State private var newRouteName: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("From: ")
                TextField("Enter name of location", text: $route.from)
            }
            HStack {
                Text("To: ")
                TextField("Enter name of location", text: $route.to)
            }
            HStack {
                TextField("New Stop", text: $newRouteName)
                Button {
                    route.addStop(stop: Stop(location: Location(latitude: 0, longitude: 0), name: newRouteName))
                    newRouteName = ""
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
                .disabled(newRouteName.isEmpty)
            }
            RouteView(route: route)
        }
    }
}

struct RouteEditView_Previews: PreviewProvider {
    static var previews: some View {
        RouteEditView(route: .constant(Route.sampleRoute))
    }
}
