//
//  SimpleRouteView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/18/23.
//

import SwiftUI

struct SimpleRouteView: View {
    let route: Route
    let zoom: (_ stop: Stop) -> Void
    
    var body: some View {
        VStack {
            Image(systemName: "bus.fill")
                .font(.largeTitle)
                .bold()
            
            ZStack {
                Rectangle()
                    .frame(height: 10)
                    .foregroundColor(.black.opacity(1.0))
                    .padding()
                
                HStack {
                    Image(systemName: "circle.fill")
                        .padding(.trailing)
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    ForEach(route.stops) { stop in
                        let index = route.stops.firstIndex(of: stop)
                        
                        Button {
                            zoom(stop)
                        } label: {
                            ZStack {
                                Image(systemName: "\((index ?? -1)+1).circle")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                Image(systemName: "\((index ?? -1)+1).circle.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Image(systemName: "circle.fill")
                        .padding(.leading)
                        .font(.largeTitle)
                }
            }
        }
        .padding(5)
        .background(.white.opacity(0.9))
        .cornerRadius(25)
    }
}

struct SimpleRouteView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleRouteView(route: Route.sampleRoute, zoom: {stop in })
    }
}
