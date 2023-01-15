//
//  ContentView.swift
//  MapApp
//
//  Created by Mac-aroni on 12/30/22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var routesManager = RoutesManager()
    @ObservedObject var locationManager = LocationManager()
    
    @State private var isShowingNewRouteView = false
    @State private var newRoute = Route.newRoute
    
    var body: some View {
        NavigationView {
            List {
                Section("On-the-go Route") {
                    RouteEditView(route: $routesManager.tempRoute)
                }
                
                Section("Saved Routes") {
                    Button {
                        isShowingNewRouteView = true
                    } label: {
                        Text("New Route")
                            .foregroundColor(.accentColor)
                    }
                    ForEach (routesManager.savedRoutes) { route in
                        RouteView(route: route)
                    }
                    .onDelete { indicies in
                        routesManager.savedRoutes.remove(atOffsets: indicies)
                    }
                }
                
                Section("Map") {
                    MapView(locationManager: locationManager)
                        .frame(width: 500, height: 500)
                }
            }
            .sheet(isPresented: $isShowingNewRouteView) {
                NavigationView {
                    RouteEditView(route: $newRoute)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button ("Dimiss") {
                                    isShowingNewRouteView = false
                                    newRoute = Route.newRoute
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button ("Add") {
                                    routesManager.saveRoute(route: newRoute)
                                    isShowingNewRouteView = false
                                    newRoute = Route.newRoute
                                }
                            }
                        }
                }
            }
        }
        .environmentObject(routesManager)
        .environmentObject(locationManager)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
