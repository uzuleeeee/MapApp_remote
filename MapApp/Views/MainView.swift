//
//  ContentView.swift
//  MapApp
//
//  Created by Mac-aroni on 12/30/22.
//

import SwiftUI
import MapKit

struct MainView: View {
    @ObservedObject var routesManager: RoutesManager
    @ObservedObject var locationManager: LocationManager
    
    //@State private var isShowingNewRouteView = false
    //@State private var newRoute = Route.newRoute
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                
                Text("Wake me up at...")
                    .font(.largeTitle)
                    .bold()
                
                ScrollView {
                    RouteView(route: routesManager.currentRoute, locationManager: locationManager)
                    AddStopView(index: routesManager.currentRoute.stops.count, locationManager: locationManager, routesManager: routesManager)
                    Spacer()
                }
                .scrollIndicators(.hidden)
                
                NavigationLink {
                    VStack {
                        TripView(routesManager: routesManager, locationManager: locationManager)
                            .navigationBarBackButtonHidden()
                            .navigationTitle("")
                            .navigationBarTitleDisplayMode(.inline)
                            .padding()
                    }
                } label: {
                    Text("Start")
                        .font(.system(size: 30, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(routesManager.currentRoute.stops.isEmpty ? .gray.opacity(0.5) : .blue)
                        .cornerRadius(25)
                        .foregroundColor(.white)
                        .padding(.top)
                }
                .simultaneousGesture(TapGesture().onEnded{
                    routesManager.start()
                })
                .disabled(routesManager.currentRoute.stops.isEmpty)
                
                /*
                if (!routesManager.onRoute) {
                    Button {
                        routesManager.start()
                    } label: {
                        Text("Start")
                            .font(.system(size: 30, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(routesManager.currentRoute.stops.isEmpty ? .gray.opacity(0.5) : .blue)
                            .cornerRadius(25)
                            .foregroundColor(.white)
                    }
                    .disabled(routesManager.currentRoute.stops.isEmpty)
                } else {
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
                 */
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
            .padding()
            /*
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
             */
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(routesManager: RoutesManager(), locationManager: LocationManager())
    }
}
