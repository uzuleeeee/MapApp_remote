//
//  AddStopView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/16/23.
//

import SwiftUI

struct AddStopView: View {
    @ObservedObject var routesManager: RoutesManager
    
    var body: some View {
        let index = routesManager.currentRoute.stops.count
        
        HStack {
            Image(systemName: "\(index+1).circle.fill")
                .font(.largeTitle)
            NavigationLink {
                SearchView(routesManager: routesManager)
                    .padding()
            } label: {
                Image(systemName: "plus")
                    .frame(maxWidth: .infinity)
                    .roundedBackground(color: .gray.opacity(0.15))
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
            }
        }
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
        AddStopView(routesManager: RoutesManager())
    }
}
