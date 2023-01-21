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
    @State var showMapButton: Bool = true

    @State private var isShowingMapView = false
    
    var body: some View {
        HStack {
            // Stop name and distance
            VStack(alignment: .leading, spacing: 5) {
                Text(stop.name)
                    .font(.title3)
                    .bold()
                Text(String(format: "%0.02f km away", distance))
            }
            
            Spacer()
            
            // Map button
            if (showMapButton) {
                Button {
                    isShowingMapView = true
                } label: {
                    Image(systemName: "map")
                        .roundedBackground(color: .white)
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                }
            }
        }
        .roundedBackground(color: .gray.opacity(0.1))
        .sheet(isPresented: $isShowingMapView) {
            NavigationView {
                MapView()
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isShowingMapView = false
                            }
                            .smallButtonStyle()
                        }
                    }
            }
        }
    }
}

struct StopView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RouteView()
                .environmentObject(RoutesManager())
                .padding()
        }
    }
}
