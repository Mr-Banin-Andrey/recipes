//
//  GreenButtonModifier.swift
//  Recipes
//
//  Created by Андрей Банин on 01.04.2025.
//


import SwiftUI

struct GreenButtonModifier: ViewModifier {
    
    var textColor: Color
    var backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .semibold))
            .foregroundStyle(textColor)
            .padding(14)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .clipShape(.rect(cornerRadius: 14))
            .padding(.horizontal, 12)
    }
}
