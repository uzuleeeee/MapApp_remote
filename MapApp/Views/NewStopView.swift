//
//  AddStopView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/14/23.
//

import SwiftUI
import MapKit

struct NewStopView: View {
    @State private var locationManager = LocationManager()
    @State private var searchLocationManager = SearchLocationManager()
    
    @State private var searchEntry = ""

    @State private var isShowingNewStopView = false
    
    var body: some View {
        ZStack {
            MapView(locationManager: locationManager)
            
            VStack {
                TextField("Search for new stop", text: $searchEntry)
                    .padding()
                    .background(.white)
                    .cornerRadius(30)
                    .padding(.horizontal)
                    .padding(.top)
                ScrollView {
                    if (!searchEntry.isEmpty && !searchLocationManager.searchedStops.isEmpty) {
                        ForEach(searchLocationManager.searchedStops) { stop in
                            Text(stop.name)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(.white)
                        }
                    }
                }
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        ZStack {
                            Image(systemName: "plus")
                                .foregroundColor(.white.opacity(0.75))
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                    .font(.system(size: 60))
                    .padding()
                    .padding(.trailing)
                    .clipShape(Circle())
                }
            }
        }
        .onChange(of: searchEntry) { newSearchEntry in
            if (!searchEntry.isEmpty) {
                searchLocationManager.searchLocation(search: newSearchEntry, in: locationManager.region)
            } else {
                searchLocationManager.searchedStops = []
            }
        }
    }
}

struct AddStopView_Previews: PreviewProvider {
    static var previews: some View {
        NewStopView()
    }
}
