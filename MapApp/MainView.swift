//
//  ContentView.swift
//  MapApp
//
//  Created by Mac-aroni on 12/30/22.
//

import SwiftUI

struct MainView: View {
    @StateObject private var routesManager = RoutesManager()
    
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
                                    routesManager.savedRoutes.append(newRoute)
                                    isShowingNewRouteView = false
                                    newRoute = Route.newRoute
                                }
                            }
                        }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
