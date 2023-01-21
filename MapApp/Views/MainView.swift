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
        VStack(alignment: .leading) {
            // Title
            Text("Wake me up at...")
                .font(.largeTitle)
                .bold()
            
            // Stops list with conditional add stop view
            ScrollView {
                RouteView(routesManager: routesManager)
                AddStopView(routesManager: routesManager)
            }
            .scrollIndicators(.hidden)
            
            // Start button
            NavigationLink {
                TripView(routesManager: routesManager)
                    .navigationBarBackButtonHidden()
                    .padding(.horizontal)
            } label: {
                Text("Start")
                    .bigButtonStyle(foregroundColor: .white, backgroundColor: routesManager.currentRoute.stops.isEmpty ? .gray.opacity(0.5) : .blue)
            }
            .simultaneousGesture(TapGesture().onEnded{
                routesManager.start()
            })
            .padding(.top)
            .disabled(routesManager.currentRoute.stops.isEmpty)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView(routesManager: RoutesManager())
                .padding()
        }
    }
}
