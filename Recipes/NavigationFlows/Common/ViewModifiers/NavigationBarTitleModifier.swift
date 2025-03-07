//
//  NavigationBarTitleModifier.swift
//  Recipes
//
//  Created by Андрей Банин on 07.03.2025.
//

import SwiftUI

struct NavigationBarTitleModifier: ViewModifier {
    
    var title: String
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.text)
                }
            }
            .toolbarBackground(color, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}
