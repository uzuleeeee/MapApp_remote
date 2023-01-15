//
//  StopView.swift
//  MapApp
//
//  Created by Mac-aroni on 1/9/23.
//

import SwiftUI

struct StopView: View {
    let stop: Stop
    
    var body: some View {
        HStack {
            Text(stop.name)
            Spacer()
            Text("\(stop.location.latitude), \(stop.location.longitude)")
        }
    }
}

struct StopView_Previews: PreviewProvider {
    static var previews: some View {
        StopView(stop: Stop.sampleStop)
    }
}
