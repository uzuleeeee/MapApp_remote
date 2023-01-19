//
//  StopView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/9/23.
//

import SwiftUI

struct StopView: View {
    let stop: Stop
    @State var distance: Double

    @State private var isShowingMapView = false
    @State var showMapButton: Bool = true
    
    var body: some View {
        HStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(stop.name)
                        .font(.title3)
                        .bold()
                    Text(String(format: "%0.02f km away", distance))
                }
                
                Spacer()
                
                if (showMapButton) {
                    Button {
                        isShowingMapView = true
                    } label: {
                        Image(systemName: "map")
                            .font(.title)
                            .bold()
                            .padding()
                            .foregroundColor(.black)
                            .background(.white.opacity(0.75))
                            .cornerRadius(25)
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        .background(.ultraThickMaterial)
        .cornerRadius(25)
        .sheet(isPresented: $isShowingMapView) {
            NavigationView {
                MapView(region: stop.region, route: [stop])
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isShowingMapView = false
                            }
                            .bold()
                            .padding(2)
                            .padding(.leading,7)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                        }
                    }
            }
        }
    }
}

struct StopView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RouteView(route: Route.sampleRoute, locationManager: LocationManager())
                .padding()
        }
    }
}
