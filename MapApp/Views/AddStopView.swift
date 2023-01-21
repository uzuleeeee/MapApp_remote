//
//  AddStopView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/16/23.
//

import SwiftUI

struct AddStopView: View {
    @EnvironmentObject var routesManager: RoutesManager
    
    var body: some View {
        let index = routesManager.currentRoute.stops.count
        
        HStack {
            Image(systemName: "\(index+1).circle.fill")
                .font(.largeTitle)
            NavigationLink {
                SearchView()
                    .environmentObject(routesManager)
            } label: {
                Image(systemName: "plus")
                    .bigButtonStyle(foregroundColor: .black, backgroundColor: .gray.opacity(0.15))
            }
        }
        .environmentObject(RoutesManager())
        .if(index != 0) { view in
            view.padding(.top)
        }
        .if(routesManager.onRoute) { view in
            view.opacity(0)
        }
    }
}

struct AddStopView_Previews: PreviewProvider {
    static var previews: some View {
        AddStopView()
            .environmentObject(RoutesManager())
    }
}
