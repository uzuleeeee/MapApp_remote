//
//  SearchView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/15/23.
//

import SwiftUI
import MapKit

struct SearchView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @FocusState private var searchIsFocused: Bool
    
    @EnvironmentObject var routesManager: RoutesManager
    
    @State private var searchEntry = ""
    @State private var searchLocationManager = SearchLocationManager()
    
    var body: some View {
        VStack {
            TextField("Search for new stop", text: $searchEntry)
                .focused($searchIsFocused)
                .bold()
                .roundedBackground(color: .gray.opacity(0.1))
            
            ScrollView {
                if (!searchEntry.isEmpty && !searchLocationManager.searchedStops.isEmpty) {
                    ForEach(searchLocationManager.searchedStops) { stop in
                        HStack(spacing: 0) {
                            Button {
                                routesManager.locationManager.center(to: stop)
                                searchIsFocused = false
                            } label: {
                                StopView(stop: stop, distance: routesManager.locationManager.distanceFrom(from: stop), showMapButton: false)
                                    .foregroundColor(.black)
                            }
                            
                            Button {
                                routesManager.addStop(stop: stop)
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(systemName: "plus")
                                    .font(.system(size: 20, weight: .bold))
                                    .frame(maxHeight: .infinity)
                                    .padding(.horizontal, 10)
                                    .background(.blue)
                                    .cornerRadius(15)
                                    .foregroundColor(.white)
                                    .padding(.leading)
                            }
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            // Map
            Map(coordinateRegion: $routesManager.locationManager.region, showsUserLocation: true, annotationItems: searchLocationManager.searchedStops) { stop in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: stop.location.coordinate.latitude, longitude: stop.location.coordinate.longitude))
            }
            .cornerRadius(25)
            .if(searchIsFocused, content: { view in
                view
                    .frame(width: 0, height: 0)
            })
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .bold()
                        .foregroundColor(.black)
                }
            }
        }
        .onChange(of: searchEntry) { newSearchEntry in
            let delay = 0.3
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                if (!searchEntry.isEmpty) {
                    searchLocationManager.searchLocation(search: newSearchEntry, in: routesManager.locationManager.region)
                } else {
                    searchLocationManager.searchedStops = []
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchView()
                .environmentObject(RoutesManager())
        }
    }
}
