//
//  SearchView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/15/23.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var searchEntry = ""
    @State private var searchLocationManager = SearchLocationManager()
    @State private var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            TextField("Search for new stop", text: $searchEntry)
                .bold()
                .padding()
                .frame(maxWidth: .infinity)
                .background(.ultraThickMaterial)
                .foregroundColor(.black)
                .cornerRadius(25)
                
            ScrollView {
                if (!searchEntry.isEmpty && !searchLocationManager.searchedStops.isEmpty) {
                    ForEach(searchLocationManager.searchedStops) { stop in
                        HStack(spacing: 0) {
                            StopView(stop: stop)
                            Button {
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
        }
        .navigationBarTitleDisplayMode(.inline)
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
            if (!searchEntry.isEmpty) {
                searchLocationManager.searchLocation(search: newSearchEntry, in: locationManager.region)
            } else {
                searchLocationManager.searchedStops = []
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchView()
        }
    }
}
