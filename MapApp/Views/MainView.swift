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
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Wake me up at...")
                    .font(.largeTitle)
                    .bold()
                
                ScrollView {
                    RouteView(routesManager: routesManager)
                    AddStopView(routesManager: routesManager)
                }
                .scrollIndicators(.hidden)
                
                NavigationLink {
                    VStack {
                        TripView(routesManager: routesManager)
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
            }
            .padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(routesManager: RoutesManager())
    }
}
