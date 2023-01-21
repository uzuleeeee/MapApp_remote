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

struct BigButton: ViewModifier {
    let backgroundColor: Color
    let foregroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .roundedBackground(color: backgroundColor)
            .foregroundColor(foregroundColor)
            .fontWeight(.semibold)
            .font(.title)
    }
}

struct SmallButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .padding(2)
            .padding(.leading,7)
            .background(.blue)
            .foregroundColor(.white)
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
    
    func bigButtonStyle(foregroundColor: Color, backgroundColor: Color) -> some View {
        modifier(BigButton(backgroundColor: backgroundColor, foregroundColor: foregroundColor))
    }
    
    func smallButtonStyle() -> some View {
        modifier(SmallButton())
    }
}
