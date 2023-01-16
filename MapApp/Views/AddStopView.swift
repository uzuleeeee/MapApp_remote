//
//  AddStopView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/16/23.
//

import SwiftUI

struct AddStopView: View {
    var index: Int
    
    @ObservedObject var routesManager: RoutesManager
    
    var body: some View {
        HStack {
            Image(systemName: "\(index+1).circle.fill")
                .font(.largeTitle)
            NavigationLink {
                SearchView(routesManager: routesManager)
                    .padding()
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.ultraThickMaterial)
                    .foregroundColor(.black)
                    .cornerRadius(25)
            }
        }
        .if(index != 0) { view in
            view.padding(.top)
        }
    }
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

struct AddStopView_Previews: PreviewProvider {
    static var previews: some View {
        AddStopView(index: 1, routesManager: RoutesManager())
    }
}
