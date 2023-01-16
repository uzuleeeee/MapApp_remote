//
//  StopView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/9/23.
//

import SwiftUI

struct StopView: View {
    let stop: Stop

    @State private var isShowingMapView = false
    
    var body: some View {
        HStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(stop.name)
                        .font(.title3)
                        .bold()
                    Text("0.98 km away")
                    Spacer()
                    
                }
                
                Spacer()
                
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
            
            Spacer()
        }
        .padding()
        .background(.ultraThickMaterial)
        .cornerRadius(25)
        .sheet(isPresented: $isShowingMapView) {
            NavigationView {
                MapView(region: stop.region, disabled: false)
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
            RouteView(route: Route.sampleRoute)
                .padding()
        }
    }
}
