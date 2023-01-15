//
//  AddStopView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/14/23.
//

import SwiftUI

struct NewStopView: View {
    @State var locationManager = LocationManager()
    
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
    }
}

struct AddStopView_Previews: PreviewProvider {
    static var previews: some View {
        NewStopView(locationManager: LocationManager())
    }
}
