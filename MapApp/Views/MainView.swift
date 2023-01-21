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
                    TripView(routesManager: routesManager)
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Start")
                        .bigButtonStyle(color: routesManager.currentRoute.stops.isEmpty ? .gray.opacity(0.5) : .blue)
                }
                .simultaneousGesture(TapGesture().onEnded{
                    routesManager.start()
                })
                .padding(.top)
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
