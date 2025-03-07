//
//  NavigationBarTitleModifier.swift
//  Recipes
//
//  Created by Андрей Банин on 07.03.2025.
//

import SwiftUI

struct NavigationBarTitleModifier: ViewModifier {
    
    var title: String
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
            .toolbarBackground(Color.indigo.opacity(0.3), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}
