//
//  RouteEditView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/9/23.
//

import SwiftUI

struct RouteEditView: View {
    @Binding var route: Route
    @State private var isShowingNewStopView = false
    
    var body: some View {
        VStack {
            HStack {
                Text("From: ")
                TextField("Enter name of location", text: $route.from)
            }
            HStack {
                Text("To: ")
                TextField("Enter name of location", text: $route.to)
            }
            RouteView(route: route)
            Button("New Stop") {
                isShowingNewStopView = true
            }
        }
        .sheet(isPresented: $isShowingNewStopView) {
            VStack {
                HStack {
                    Button {
                        isShowingNewStopView = false
                    } label: {
                        Text("Dismiss")
                            .bold()
                    }
                    .padding(5)
                    Spacer()
                }
                NewStopView()
            }
        }
    }
}

struct RouteEditView_Previews: PreviewProvider {
    static var previews: some View {
        RouteEditView(route: .constant(Route.sampleRoute))
    }
}
