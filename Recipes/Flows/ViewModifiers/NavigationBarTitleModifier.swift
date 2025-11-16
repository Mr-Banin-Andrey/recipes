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
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(Color.mainText)
                }
            }
            .toolbarBackground(color, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}


