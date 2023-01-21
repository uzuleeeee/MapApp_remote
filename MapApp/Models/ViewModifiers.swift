//
//  ViewModifiers.swift
//  MapApp
//
//  Created by Mac-aroni on 1/19/23.
//

import SwiftUI

struct RoundedBackground: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(color)
            .cornerRadius(25)
    }
}

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
    
    func roundedBackground(color: Color) -> some View {
        modifier(RoundedBackground(color: color))
    }
}
