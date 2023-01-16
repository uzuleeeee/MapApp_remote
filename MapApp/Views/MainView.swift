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
            VStack {
                ScrollView {
                    RouteView(route: routesManager.currentRoute)
                        .padding()
                    Spacer()
                }
                
                Button {
                    
                } label: {
                    Text("Start")
                        .font(.system(size: 30, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(routesManager.currentRoute.stops.first == Stop.newStop ? .gray.opacity(0.5) : .blue)
                        .cornerRadius(25)
                        .foregroundColor(.white)
                        .padding()
                }
                .disabled(routesManager.currentRoute.stops.first == Stop.newStop)
                /*
                NavigationLink(destination: SearchView()) {
                    Image(systemName: "magnifyingglass")
                        .cornerRadius(50)
                        .font(.system(size: 30, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .cornerRadius(25)
                        .foregroundColor(.white)
                        .padding()
                }
                */
            }
            /*List {
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
            }*/
            .navigationTitle("Wake me up at...")
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
            .environmentObject(routesManager)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
